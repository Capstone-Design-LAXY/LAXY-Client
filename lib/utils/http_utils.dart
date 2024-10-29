import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:laxy/common/component/show_dialog.dart';
import 'package:laxy/utils/utils.dart';

// API URL을 하나의 변수로 저장
const String baseUrl = 'http://43.202.77.176:8001/api';
final storage = FlutterSecureStorage(); // FlutterSecureStorage 인스턴스 생성

// 회원가입 요청을 처리하는 함수
Future<void> registerUser(BuildContext context, {
  required String email,
  required String password,
  required String name,
  required String birth,
  required String gender,
}) async {
  final String url = '$baseUrl/signUp'; // 기본 URL에 회원가입 엔드포인트 추가
  // 요청 데이터 생성
  final Map<String, dynamic> data = {
    "email": email,
    "password": password,
    "name": name,
    "birth": birth,
    "gender": gender,
  };
  try {
    // POST 요청 보내기
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json", // JSON 형식으로 전송
      },
      body: jsonEncode(data), // Map을 JSON으로 변환
    );
    // 응답 처리
    if (response.statusCode == 200) {
      // 성공적으로 회원가입 처리
      print('회원가입 성공: ${response.body}');
      return; // 성공 시 추가 처리 필요 시 반환
    } else {
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('로그인 실패: ${errorResponse['message']}');
      showErrorDialog(context, errorResponse['message']);
      throw Exception('회원가입 실패');
    }
  } catch (e) {
    print('예외 발생: $e');
    throw Exception('서버와의 연결에 실패했습니다.');
  }
}

// 로그인 요청을 처리하는 함수
Future<void> loginUser(BuildContext context, {
  required String email,
  required String password,
}) async {
  final String url = '$baseUrl/login'; // 기본 URL에 로그인 엔드포인트 추가
  final Map<String, dynamic> data = {
    "email": email,
    "password": password,
  };
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      print('로그인 성공: ${response.body}');
      // 응답 데이터를 저장하는 함수 호출
      await _saveLoginResponse(response.body);
      return;
    } else {
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('로그인 실패: ${errorResponse['message']}');
      showErrorDialog(context, errorResponse['message']);
      throw Exception(errorResponse['message']);
    }
  } catch (e) {
    print('예외 발생: $e');
    throw Exception('서버와의 연결에 실패했습니다.');
  }
}

// 로그인 응답을 저장하는 함수
Future<void> _saveLoginResponse(String responseBody) async {
  final Map<String, dynamic> responseData = jsonDecode(responseBody);

  // 토큰 및 사용자 정보를 저장
  await storage.write(key: 'accessToken', value: responseData['accessToken']);
  await storage.write(key: 'refreshToken', value: responseData['refreshToken']);
  await storage.write(key: 'name', value: responseData['name']);
  await storage.write(key: 'email', value: responseData['email']);
  await storage.write(key: 'imageUrl', value: responseData['imageUrl']?.toString());

  print('로그인 응답 저장 완료');
}
// 로그아웃 사용자 데이터 삭제
Future<void> _logout() async {
  await storage.deleteAll(); // 모든 데이터 삭제
  print('로그아웃 : 로그인 사용자 데이터 삭제');
}

// 회원탈퇴 요청을 처리하는 함수
Future<void> deleteUser(BuildContext context) async {
  final String url = '$baseUrl/user'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  if(accessToken == null) {
    return;
  }
  try {
    final response = await http.delete(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer $accessToken", // accessToken 추가
      },
    );

    if (response.statusCode == 200) {
      print('회원탈퇴 성공: ${response.body}');
      // 응답 데이터를 저장하는 함수 호출
      await _logout();
      return;
    } else {
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('회원탈퇴 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken();
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 회원탈퇴 요청
          await deleteUser(context); // 재호출
          return;
        } else {
          showErrorDialog(context, '토큰 갱신에 실패했습니다.');
        }
      } else {
        showErrorDialog(context, errorResponse['message']);
      }

      throw Exception(errorResponse['message']);
    }
  } catch (e) {
    print('예외 발생: $e');
    throw Exception('서버와의 연결에 실패했습니다.');
  }
}
// 액세스 토큰 갱신
Future<String?> refreshAccessToken() async {
  final String url = '$baseUrl/refreshAccessToken'; // 토큰 갱신 엔드포인트
  String? refreshToken = await FlutterSecureStorage().read(key: "refreshToken");

  if (refreshToken == null) {
    return null; // refreshToken이 없으면 null 반환
  }

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer $refreshToken", // accessToken 추가
      },
    );
    // TODO: refreshToken 만료 시 로그아웃 만들어야함
    if (response.statusCode == 200) {
      String newAccessToken = response.body; // 응답이 문자열일 경우
      // 새로운 accessToken 저장
      await storage.write(key: "accessToken", value: newAccessToken);
      return newAccessToken; // 새로운 accessToken 반환
    } else {
      print('토큰 갱신 실패: ${response.body}');
      return null;
    }
  } catch (e) {
    print('예외 발생: $e');
    return null;
  }
}
// 사용자 정보 수정 요청
Future<void> editUser(BuildContext context, {
  String? name,
  String? password,
  String? birth,
  String? gender,
}) async {
  final String url = '$baseUrl/user'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  if(accessToken == null) {
    return;
  }
  // Request body에 담을 data  ( 'email', 'password' 자리가 변수 )
  final Map<String, dynamic> data = {
    "password": password,
    "name": name,
    "birth": birth,
    "gender": gender,
  };
  try {
    // 요청 보내는 부분 메소드, body 채우면 됌
    final response = await http.put(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer $accessToken", // accessToken 추가
      },
      body: jsonEncode(data),
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('회원정보수정 성공: ${response.body}');
      // 성공 시 동작 : 닉네임이 변경될 경우만 저장해주면 됌
      if(name != null){
        await storage.write(key: 'name', value: name);
      }
      if(password != null){
        _logout();
      }
      return;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('회원정보수정 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken();
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          await editUser(context, gender: gender, birth: birth, name: name, password: password); // 재호출
          return;
        } else {
          showErrorDialog(context, '토큰 갱신에 실패했습니다.');
        }
      } else {
        // 토큰 이외의 오류
        showErrorDialog(context, errorResponse['message']);
      }
      throw Exception(errorResponse['message']);
    }
  } catch (e) {
    print('예외 발생: $e');
    throw Exception('서버와의 연결에 실패했습니다.');
  }
}
Future<List<Post>> trendAllPost(BuildContext context, {String sortBy = 'recent'}) async {
  final String url = '$baseUrl/all?sortBy=$sortBy'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  // 요청 헤더 설정
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
  };
  // accessToken이 존재하는 경우 Authorization 헤더 추가
  if (accessToken != null) {
    headers["Authorization"] = "Bearer $accessToken";
  }
  try {
    // 요청 보내는 부분
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('트랜드-전체 요청 성공: ${response.body}');
      // 성공 시 동작
      List<Post> data = (jsonDecode(response.body) as List)
          .map<Post>((json) => Post.fromJson(json))
          .toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('트랜드-전체 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken();
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await trendAllPost(context, sortBy: sortBy); // 재호출
        } else {
          showErrorDialog(context, '토큰 갱신에 실패했습니다.');
        }
      } else {
        // 토큰 이외의 오류
        showErrorDialog(context, errorResponse['message']);
      }
      throw Exception(errorResponse['message']);
    }
  } catch (e) {
    print('예외 발생: $e');
    throw Exception('서버와의 연결에 실패했습니다.');
  }
}
// 트랜드 - 메인 - 일간 요청
Future<List<Post>> trendMainDaily(BuildContext context) async {
  final String url = '$baseUrl/daily'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  // 요청 헤더 설정
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
  };
  // accessToken이 존재하는 경우 Authorization 헤더 추가
  if (accessToken != null) {
    headers["Authorization"] = "Bearer $accessToken";
  }
  try {
    // 요청 보내는 부분
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('트랜드-메인-일간 요청 성공: ${response.body}');
      // 성공 시 동작
      List<Post> data = jsonDecode(response.body).map<Post>((json) => Post.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('트랜드-메인-일간 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken();
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await trendMainDaily(context); // 재호출;
        } else {
          showErrorDialog(context, '토큰 갱신에 실패했습니다.');
        }
      } else {
        // 토큰 이외의 오류
        showErrorDialog(context, errorResponse['message']);
      }
      throw Exception(errorResponse['message']);
    }
  } catch (e) {
    print('예외 발생: $e');
    throw Exception('서버와의 연결에 실패했습니다.');
  }
}
// 트랜드 - 메인 - 주간 요청
Future<List<Post>> trendMainWeekly(BuildContext context) async {
  final String url = '$baseUrl/weekly'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  // 요청 헤더 설정
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
  };
  // accessToken이 존재하는 경우 Authorization 헤더 추가
  if (accessToken != null) {
    headers["Authorization"] = "Bearer $accessToken";
  }
  try {
    // 요청 보내는 부분
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('트랜드-메인-주간 요청 성공: ${response.body}');
      // 성공 시 동작
      List<Post> data = jsonDecode(response.body).map<Post>((json) => Post.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('트랜드-메인-주간 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken();
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await trendMainWeekly(context); // 재호출;
        } else {
          showErrorDialog(context, '토큰 갱신에 실패했습니다.');
        }
      } else {
        // 토큰 이외의 오류
        showErrorDialog(context, errorResponse['message']);
      }
      throw Exception(errorResponse['message']);
    }
  } catch (e) {
    print('예외 발생: $e');
    throw Exception('서버와의 연결에 실패했습니다.');
  }
}
// 트랜드 - 커뮤니티 요청
Future<List<Tag>> trendCommunity(BuildContext context) async {
  final String url = '$baseUrl/tag/popular'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  // 요청 헤더 설정
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
  };
  // accessToken이 존재하는 경우 Authorization 헤더 추가
  if (accessToken != null) {
    headers["Authorization"] = "Bearer $accessToken";
  }
  try {
    // 요청 보내는 부분
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('트랜드-커뮤니티 요청 성공: ${response.body}');
      // 성공 시 동작
      List<Tag> data = jsonDecode(response.body).map<Tag>((json) => Tag.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('트랜드-커뮤니티 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken();
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await trendCommunity(context); // 재호출;
        } else {
          showErrorDialog(context, '토큰 갱신에 실패했습니다.');
        }
      } else {
        // 토큰 이외의 오류
        showErrorDialog(context, errorResponse['message']);
      }
      throw Exception(errorResponse['message']);
    }
  } catch (e) {
    print('예외 발생: $e');
    throw Exception('서버와의 연결에 실패했습니다.');
  }
}
/// 요청 함수 기본 틀
Future<void> actionObject(BuildContext context) async {
  final String url = '$baseUrl/user'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  // 요청 헤더 설정
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
  };
  // Request body에 담을 data  ( 'email', 'password' 자리가 변수 )
  final Map<String, dynamic> data = {
    "email": 'email',
    "password": 'password',
  };
  // accessToken이 존재하는 경우 Authorization 헤더 추가
  if (accessToken != null) {
    headers["Authorization"] = "Bearer $accessToken";
  }
  try {
    // 요청 보내는 부분
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('회원탈퇴 성공: ${response.body}');
      // 성공 시 동작
      await _logout();
      return;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('회원탈퇴 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken();
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          await deleteUser(context); // 재호출
          return;
        } else {
          showErrorDialog(context, '토큰 갱신에 실패했습니다.');
        }
      } else {
        // 토큰 이외의 오류
        showErrorDialog(context, errorResponse['message']);
      }
      throw Exception(errorResponse['message']);
    }
  } catch (e) {
    print('예외 발생: $e');
    throw Exception('서버와의 연결에 실패했습니다.');
  }
}