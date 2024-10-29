import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

// API URL을 하나의 변수로 저장
const String baseUrl = 'http://43.202.77.176:8001/api';

final storage = FlutterSecureStorage(); // FlutterSecureStorage 인스턴스 생성

// 회원가입 요청을 처리하는 함수
Future<void> registerUser({
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
  print(jsonEncode(data));

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
      // 오류 처리
      print('회원가입 실패: ${response.body}');
      throw Exception('회원가입 실패');
    }
  } catch (e) {
    print('예외 발생: $e');
    throw Exception('서버와의 연결에 실패했습니다.');
  }
}

// 로그인 요청을 처리하는 함수
Future<void> loginUser({
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
