import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<String?>? getAccessToken() async{
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  // print(accessToken);
  return accessToken;
}

Future<bool> isAccessToken() async{
  String? accessToken = await FlutterSecureStorage().read(key: "accessToken");
  if ( accessToken == null ){
    return false;
  }
  return true;
}