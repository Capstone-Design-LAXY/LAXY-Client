import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:laxy/common/component/show_dialog.dart';
import 'package:laxy/screen/main/trends_screen.dart';
import 'package:laxy/screen/user/login_screen.dart';
import 'package:laxy/utils/utils.dart';

// API URL을 하나의 변수로 저장
const String baseUrl = 'http://52.78.164.15:8001/api';
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
      print('회원가입 성공: ${utf8.decode(response.bodyBytes)}');
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
      print('로그인 성공: ${utf8.decode(response.bodyBytes)}');
      // 응답 데이터를 저장하는 함수 호출
      await _saveLoginResponse(utf8.decode(response.bodyBytes));
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
      print('회원탈퇴 성공: ${utf8.decode(response.bodyBytes)}');
      // 응답 데이터를 저장하는 함수 호출
      await _logout();
      return;
    } else {
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('회원탈퇴 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
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
Future<String?> refreshAccessToken(BuildContext context) async {
  final String url = '$baseUrl/refreshAccessToken'; // 토큰 갱신 엔드포인트
  String? refreshToken = await FlutterSecureStorage().read(key: "refreshToken");

  if (refreshToken == null) {
    return null; // refreshToken이 없으면 null 반환
  }

  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer $refreshToken", // accessToken 추가
      },
    );
    // TODO: refreshToken 만료 시 로그아웃 만들어야함
    if (response.statusCode == 200) {
      String newAccessToken = utf8.decode(response.bodyBytes); // 응답이 문자열일 경우
      // 새로운 accessToken 저장
      await storage.write(key: "accessToken", value: newAccessToken);
      return newAccessToken; // 새로운 accessToken 반환
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('회원정보수정 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E104") {
        // 로그아웃
        showErrorDialog(context, '토큰이 만료되어 로그아웃됩니다.');
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => TrendsScreen()),
              (Route<dynamic> route) => false, // 모든 기존 라우트를 제거
        ).then((_) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        });
        // 페이지 이동
      }
      throw Exception(errorResponse['message']);
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
      print('회원정보수정 성공: ${utf8.decode(response.bodyBytes)}');
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
        String? newAccessToken = await refreshAccessToken(context);
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
// 트랜드 - 전체 요청
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
      print('트랜드-전체 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      List<Post> data = (jsonDecode(utf8.decode(response.bodyBytes)) as List)
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
        String? newAccessToken = await refreshAccessToken(context);
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
      print('트랜드-메인-일간 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      List<Post> data = jsonDecode(utf8.decode(response.bodyBytes)).map<Post>((json) => Post.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('트랜드-메인-일간 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
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
      print('트랜드-메인-주간 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      List<Post> data = jsonDecode(utf8.decode(response.bodyBytes)).map<Post>((json) => Post.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('트랜드-메인-주간 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
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
      print('트랜드-커뮤니티 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      List<Tag> data = jsonDecode(utf8.decode(response.bodyBytes)).map<Tag>((json) => Tag.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('트랜드-커뮤니티 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
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
// 마인드맵 요청
Future<List<OrbitData>> mindmapOrbit(BuildContext context) async {
  final String url = '$baseUrl/tag/orbits'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  // accessToken이 존재하는 경우 Authorization 헤더 추가
  if (accessToken == null) {
    return [];
  }
  // 요청 헤더 설정
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "Authorization": "Bearer $accessToken",
  };
  try {
    // 요청 보내는 부분
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('마인드맵 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      List<OrbitData> data = jsonDecode(utf8.decode(response.bodyBytes)).map<OrbitData>((json) => OrbitData.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('마인드맵 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await mindmapOrbit(context); // 재호출
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
// 드로워 - 랜덤 요청
Future<List<Tag>> randomDrawer(BuildContext context) async {
  final String url = '$baseUrl/randomTags'; // 기본 URL에 로그인 엔드포인트 추가
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
      print('드로워-랜덤 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      List<Tag> data = jsonDecode(utf8.decode(response.bodyBytes)).map<Tag>((json) => Tag.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('드로워-랜덤 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await randomDrawer(context); // 재호출;
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
// 드로워 - 추천 요청
Future<List<Tag>> recommendedDrawer(BuildContext context) async {
  final String url = '$baseUrl/recommendedTags'; // 기본 URL에 로그인 엔드포인트 추가
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
      print('드로워-추천 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      List<Tag> data = jsonDecode(utf8.decode(response.bodyBytes)).map<Tag>((json) => Tag.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('드로워-추천 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await recommendedDrawer(context); // 재호출;
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
// 드로워 - 즐겨찾기 요청
Future<List<Tag>> bookmarkedDrawer(BuildContext context) async {
  final String url = '$baseUrl/myTags'; // 기본 URL에 로그인 엔드포인트 추가
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
      print('드로워-즐겨찾기 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      List<Tag> data = jsonDecode(utf8.decode(response.bodyBytes)).map<Tag>((json) => Tag.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('드로워-즐겨찾기 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await bookmarkedDrawer(context); // 재호출;
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
// 태그 북마크 여부 요청
Future<bool> checkBookmark(BuildContext context, {
  required int tagId
}) async {
  final String url = '$baseUrl/tag/bookmark/$tagId'; // 기본 URL에 로그인 엔드포인트 추가
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
      print('태그 북마크 여부 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      bool result = utf8.decode(response.bodyBytes).toLowerCase() == 'true';
      return result;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('태그 북마크 여부 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await checkBookmark(context, tagId: tagId); // 재호출;
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
// 태그 북마크 등록 요청
Future<void> addBookmark(BuildContext context, {
  required int tagId
}) async {
  final String url = '$baseUrl/tag/bookmark/$tagId'; // 기본 URL에 로그인 엔드포인트 추가
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
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('태그 북마크 등록 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      return;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('태그 북마크 등록 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await addBookmark(context, tagId: tagId); // 재호출;
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
// 태그 북마크 해제 요청
Future<void> deleteBookmark(BuildContext context, {
  required int tagId
}) async {
  final String url = '$baseUrl/tag/bookmark/$tagId'; // 기본 URL에 로그인 엔드포인트 추가
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
    final response = await http.delete(
      Uri.parse(url),
      headers: headers,
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('태그 북마크 해제 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      return;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('태그 북마크 해제 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await deleteBookmark(context, tagId: tagId); // 재호출;
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
// 태그 페이지 요청
Future<List<Post>> tagPost(BuildContext context,{
  required String name,
  required String sortBy
}) async {
  final String url = '$baseUrl/all/$name?sortBy=$sortBy'; // 기본 URL에 로그인 엔드포인트 추가
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
      print('태그 페이지 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      List<Post> data = jsonDecode(utf8.decode(response.bodyBytes)).map<Post>((json) => Post.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('태그 페이지 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await tagPost(context, name: name, sortBy: sortBy); // 재호출;
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
// 커뮤니티 - 메인 - 일간 요청
Future<List<Post>> communtyMainDaily(BuildContext context, {
  required String name
}) async {
  final String url = '$baseUrl/daily/$name'; // 기본 URL에 로그인 엔드포인트 추가
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
      print('커뮤니티-메인-일간 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      List<Post> data = jsonDecode(utf8.decode(response.bodyBytes)).map<Post>((json) => Post.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('커뮤니티-메인-일간 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await communtyMainDaily(context, name: name); // 재호출;
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
Future<List<Post>> communityMainWeekly(BuildContext context, {
  required String name
}) async {
  final String url = '$baseUrl/weekly/$name'; // 기본 URL에 로그인 엔드포인트 추가
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
      print('커뮤니티-메인-주간 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      List<Post> data = jsonDecode(utf8.decode(response.bodyBytes)).map<Post>((json) => Post.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('커뮤니티-메인-주간 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await communityMainWeekly(context, name: name); // 재호출;
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
// 커뮤니티 - 공감글 요청
Future<List<Post>> communityGoodPost(BuildContext context,{
  required String name
}) async {
  final String url = '$baseUrl/liked/$name'; // 기본 URL에 로그인 엔드포인트 추가
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
      print('커뮤니티-공감글 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      List<Post> data = jsonDecode(utf8.decode(response.bodyBytes)).map<Post>((json) => Post.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('커뮤니티-공감글 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await communityGoodPost(context, name: name); // 재호출;
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
// 커뮤니티 - 전체 요청
Future<List<Post>> communityAllPost(BuildContext context,{
  required String name,
  required String sortBy
}) async {
  final String url = '$baseUrl/all/$name?sortBy=$sortBy'; // 기본 URL에 로그인 엔드포인트 추가
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
      print('커뮤니티-전체 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      List<Post> data = jsonDecode(utf8.decode(response.bodyBytes)).map<Post>((json) => Post.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('커뮤니티-전체 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await communityAllPost(context, name: name, sortBy: sortBy); // 재호출;
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
// 커뮤니티 - 추천 요청
Future<List<Tag>> communityRelated(BuildContext context, {
  required tagId
}) async {
  final String url = '$baseUrl/tag/related/$tagId'; // 기본 URL에 로그인 엔드포인트 추가
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
      print('커뮤니티-추천 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      List<Tag> data = jsonDecode(utf8.decode(response.bodyBytes)).map<Tag>((json) => Tag.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('커뮤니티-추천 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await communityRelated(context, tagId: tagId); // 재호출;
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
// 마이페이지 - 즐겨찾기 요청
Future<List<Tag>> bookmarkedTag(BuildContext context) async {
  final String url = '$baseUrl/bookmarkedTags'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  if (accessToken == null) return [];
  // 요청 헤더 설정
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "Authorization": "Bearer $accessToken"
  };
  try {
    // 요청 보내는 부분
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('마이페이지-즐겨찾기태그 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      List<Tag> data = jsonDecode(utf8.decode(response.bodyBytes)).map<Tag>((json) => Tag.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('마이페이지-즐겨찾기태그 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await bookmarkedTag(context); // 재호출;
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
// 마이페이지 - 좋아요한 글 요청
Future<List<Post>> likedPost(BuildContext context) async {
  final String url = '$baseUrl/likedPosts'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  if (accessToken == null) return [];
  // 요청 헤더 설정
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "Authorization": "Bearer $accessToken",
  };
  try {
    // 요청 보내는 부분
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('마이페이지-좋아요한글 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      List<Post> data = jsonDecode(utf8.decode(response.bodyBytes)).map<Post>((json) => Post.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('마이페이지-좋아요한글 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await likedPost(context); // 재호출;
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
// 마이페이지 - 작성한 글 요청
Future<List<Post>> myPost(BuildContext context) async {
  final String url = '$baseUrl/myPosts'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  if (accessToken == null) return [];
  // 요청 헤더 설정
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "Authorization": "Bearer $accessToken",
  };
  try {
    // 요청 보내는 부분
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('마이페이지-작성한글 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      List<Post> data = jsonDecode(utf8.decode(response.bodyBytes)).map<Post>((json) => Post.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('마이페이지-작성한글 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await myPost(context); // 재호출;
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
// 마이페이지 - 작성한 댓글 요청
Future<List<Comment>> myComment(BuildContext context) async {
  final String url = '$baseUrl/myComments'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  if (accessToken == null) return [];
  // 요청 헤더 설정
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "Authorization": "Bearer $accessToken",
  };
  try {
    // 요청 보내는 부분
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('마이페이지-작성한댓글 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      List<Comment> data = jsonDecode(utf8.decode(response.bodyBytes)).map<Comment>((json) => Comment.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('마이페이지-작성한댓글 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await myComment(context); // 재호출;
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
// 댓글 좋아요 요청
Future<void> likeComment(BuildContext context, {
  required int commentId
}) async {
  final String url = '$baseUrl/comment/like/$commentId'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  if (accessToken == null) return;
  // 요청 헤더 설정
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "Authorization": "Bearer $accessToken",
  };
  try {
    // 요청 보내는 부분
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('댓글 좋아요 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      return ;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('댓글 좋아요 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          await likeComment(context, commentId: commentId); // 재호출
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
// 댓글 좋아요 해제 요청
Future<void> deleteLikeComment(BuildContext context, {
  required int commentId
}) async {
  final String url = '$baseUrl/comment/like/$commentId'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  if (accessToken == null) return;
  // 요청 헤더 설정
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "Authorization": "Bearer $accessToken",
  };
  try {
    // 요청 보내는 부분
    final response = await http.delete(
      Uri.parse(url),
      headers: headers,
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('댓글 좋아요 해제 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      return ;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('댓글 좋아요 해제 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          await likeComment(context, commentId: commentId); // 재호출
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
// 댓글 삭제 요청
Future<void> deleteComment(BuildContext context,{
  required int commentId
}) async {
  final String url = '$baseUrl/comment/$commentId'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  if (accessToken == null) return;
  // 요청 헤더 설정
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "Authorization": "Bearer $accessToken"
  };
  try {
    // 요청 보내는 부분
    final response = await http.delete(
      Uri.parse(url),
      headers: headers,
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('댓글 삭제 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      return;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('댓글 삭제 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          await deleteComment(context, commentId: commentId); // 재호출
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
// 게시글 상세 요청
Future<Post> detailPost(BuildContext context, {
  required int postId
}) async {
  final String url = '$baseUrl/post/$postId'; // 기본 URL에 로그인 엔드포인트 추가
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
      print('게시글 상세 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      Post result = Post.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      print(result);
      return result;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('게시글 상세 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await detailPost(context, postId: postId); // 재호출
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
// 게시글 등록 요청
Future<int> writePost(BuildContext context,{
  required String title,
  required String content,
  required List<String> tags
}) async {
  final String url = '$baseUrl/post'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  if(accessToken == null) return 0;
  // 요청 헤더 설정
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "Authorization": "Bearer $accessToken",
  };
  // Request body에 담을 data
  final Map<String, dynamic> data = {
    "title": title,
    "content": content,
    "tags": tags,
  };
  try {
    // 요청 보내는 부분
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(data),
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('게시글 등록 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      int result = int.parse(utf8.decode(response.bodyBytes));
      return result;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('게시글 등록 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await writePost(context, title: title, content: content, tags: tags); // 재호출
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
// 게시글 상세 댓글 요청
Future<List<Comment>> postDetailComment(BuildContext context, {
  required int postId,
  required String sortBy
}) async {
  final String url = '$baseUrl/comment/$postId?sortBy=$sortBy'; // 기본 URL에 로그인 엔드포인트 추가
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
      print('게시글 상세 댓글 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      List<Comment> data = jsonDecode(utf8.decode(response.bodyBytes)).map<Comment>((json) => Comment.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('게시글 상세 댓글 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await postDetailComment(context, postId: postId, sortBy: sortBy); // 재호출
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
// 게시글 좋아요 등록 요청
Future<void> likePost(BuildContext context, {
  required int postId
}) async {
  final String url = '$baseUrl/post/like/$postId'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  if (accessToken == null) return;
  // 요청 헤더 설정
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "Authorization": "Bearer $accessToken"
  };
  try {
    // 요청 보내는 부분
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('게시글 좋아요 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      return;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('게시글 좋아요 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          await likePost(context, postId: postId); // 재호출
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
// 게시글 좋아요 해제 요청
Future<void> deleteLikePost(BuildContext context, {
  required int postId
}) async {
  final String url = '$baseUrl/post/like/$postId'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  if (accessToken == null) return;
  // 요청 헤더 설정
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "Authorization": "Bearer $accessToken"
  };
  try {
    // 요청 보내는 부분
    final response = await http.delete(
      Uri.parse(url),
      headers: headers,
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('게시글 좋아요 해제 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      return;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('게시글 좋아요 해제 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          await deleteLikePost(context, postId: postId); // 재호출
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
// 댓글 작성
Future<void> writeComment(BuildContext context, {
  required int postId,
  required String contents
}) async {
  final String url = '$baseUrl/comment/$postId'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  if(accessToken == null) return;
  // 요청 헤더 설정
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "Authorization": "Bearer $accessToken"
  };
  // Request body에 담을 data  ( 'email', 'password' 자리가 변수 )
  final Map<String, dynamic> data = {
    "contents": contents,
  };
  try {
    // 요청 보내는 부분
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(data),
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('댓글 등록 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      return;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('댓글 등록 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          await writeComment(context, postId: postId, contents: contents); // 재호출
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
// 게시글 삭제 요청
Future<void> deletePost(BuildContext context, {
  required int postId
}) async {
  final String url = '$baseUrl/post/$postId'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  // 요청 헤더 설정
  if (accessToken == null) return;
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "Authorization": "Bearer $accessToken"
  };
  try {
    // 요청 보내는 부분
    final response = await http.delete(
      Uri.parse(url),
      headers: headers,
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('게시글 삭제 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      return;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('게시글 삭제 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          await deletePost(context, postId: postId); // 재호출
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
// 게시글 수정 요청
Future<void> editPost(BuildContext context,{
  required int postId,
  required String title,
  required String content,
  required List<String> tags
}) async {
  final String url = '$baseUrl/post/$postId'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  if(accessToken == null) return;
  // 요청 헤더 설정
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "Authorization": "Bearer $accessToken",
  };
  // Request body에 담을 data
  final Map<String, dynamic> data = {
    "title": title,
    "contents": content,
    "tags": tags,
  };
  try {
    // 요청 보내는 부분
    final response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(data),
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('게시글 수정 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      return;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('게시글 수정 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await editPost(context, postId: postId, title: title, content: content, tags: tags); // 재호출
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
// 댓글 수정 요청
Future<void> editComment(BuildContext context, {
  required int commentId,
  required String contents
}) async {
  final String url = '$baseUrl/comment/$commentId'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  if(accessToken == null) return;
  // 요청 헤더 설정
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "Authorization": "Bearer $accessToken"
  };
  // Request body에 담을 data  ( 'email', 'password' 자리가 변수 )
  final Map<String, dynamic> data = {
    "contents": contents,
  };
  try {
    // 요청 보내는 부분
    final response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(data),
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('댓글 수정 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      return;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('댓글 수정 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          await editComment(context, commentId: commentId, contents: contents); // 재호출
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
// 태그 검색 요청
Future<List<Tag>> searchTag(BuildContext context, {
  required String query
}) async {
  final String url = '$baseUrl/tag/search?query=$query'; // 기본 URL에 로그인 엔드포인트 추가
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
      print('태그 검색 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      List<Tag> data = jsonDecode(utf8.decode(response.bodyBytes)).map<Tag>((json) => Tag.fromJson(json)).toList();
      return data;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('태그 검색 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await searchTag(context, query: query); // 재호출
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
// 태그 가중치 요청
Future<void> relateTag(BuildContext context, {
  required int originalTagId,
  required int relatedTagId,
}) async {
  final String url = '$baseUrl/tag/association'; // 기본 URL에 로그인 엔드포인트 추가
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  // 요청 헤더 설정
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
  };
  // Request body에 담을 data  ( 'email', 'password' 자리가 변수 )
  final Map<String, dynamic> data = {
    "originalTagId": originalTagId,
    "relatedTagId": relatedTagId,
  };
  // accessToken이 존재하는 경우 Authorization 헤더 추가
  if (accessToken != null) {
    headers["Authorization"] = "Bearer $accessToken";
  }
  try {
    // 요청 보내는 부분
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(data)
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('태그 가중치 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      return;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('태그 가중치 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          await relateTag(context, originalTagId: originalTagId, relatedTagId: relatedTagId); // 재호출
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
// 시간 요청
Future<DateTime> checkTime(BuildContext context) async {
  final String url = '$baseUrl/time'; // 기본 URL에 로그인 엔드포인트 추가
  // 요청 헤더 설정
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
  };
  try {
    // 요청 보내는 부분
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    // 서버 응답 판별부
    if (response.statusCode == 200) {
      print('시간 요청 성공: ${utf8.decode(response.bodyBytes)}');
      // 성공 시 동작
      DateTime result = DateTime.parse(utf8.decode(response.bodyBytes));
      return result;
    } else {
      // 에러 코드 출력
      final errorResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print('시간 요청 실패: ${errorResponse['message']}');
      // accessToken 만료 시 처리
      if (errorResponse['code'] == "E103") {
        // 새로운 accessToken 발급
        String? newAccessToken = await refreshAccessToken(context);
        if (newAccessToken != null) {
          // 새로운 accessToken으로 다시 요청
          return await checkTime(context);
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
      print('회원탈퇴 성공: ${utf8.decode(response.bodyBytes)}');
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
        String? newAccessToken = await refreshAccessToken(context);
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