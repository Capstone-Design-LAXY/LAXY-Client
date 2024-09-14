import 'dart:async';
import 'dart:convert';
import 'package:laxy/common/const/constants.dart';
import 'package:http/http.dart' as http;
//
// Future<void> server_request() async {
//   final url = Uri.parse('$BASE_URL/login');
//
//   // HTTP 클라이언트 생성
//   final client = http.Client();
//
//   try {
//     final response = await client.post(
//       url,
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'email': email,
//         'password': password,
//       }),
//       // 요청 시간 초과 설정 (예: 10초)
//     ).timeout(Duration(seconds: 5));
//
//     if (response.statusCode == 200) {
//       // 로그인 성공 시 처리 (홈 화면으로 이동)
//     } else {
//       // 로그인 실패 시 처리 (오류 메시지 보여주기)
//       _showErrorDialog('로그인에 실패했습니다. 상태 코드: ${response.statusCode}');
//     }
//   } on TimeoutException catch (_) {
//     // 시간 초과 오류 처리
//     _showErrorDialog('요청이 시간 초과되었습니다. 인터넷 연결을 확인해 주세요.');
//   } catch (error) {
//     // 네트워크 오류 처리
//     _showErrorDialog('로그인 요청 중 오류가 발생했습니다: $error');
//   } finally {
//     client.close(); // HTTP 클라이언트 자원 해제
//   }
// }