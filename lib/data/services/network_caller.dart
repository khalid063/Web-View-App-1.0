import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart';
import '../../application/app.dart';
import '../models/network_response/network_response.dart';
import 'package:http/http.dart' as http;

class NetworkCaller {

  // Future<NetworkResponse> getRequest(String url) async {
  //   try {
  //     http.Response response = await http.get(Uri.parse(url));
  //     log(response.statusCode.toString());
  //     log('massage 111 : ${response.statusCode}');
  //     log(response.body);
  //     if (response.statusCode == 200) {
  //       return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
  //     } else {
  //       // todo - handle other response codes
  //       return NetworkResponse(false, response.statusCode, null);
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   return NetworkResponse(false, -1, null);
  // }

  ///---------- GET Request ----------///

  Future<NetworkResponse> getRequest(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      log(response.statusCode.toString());
      log('massage 111 : ${response.statusCode}');
      log(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
      }
      else if (response.statusCode == 401){
        //gotoLogin();
      }
      else {
        //todo - handle other response code - 401,400, 500
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }



// Future<NetworkResponse> getRequest(String url) async{
  //   //Map<String, dynamic>? decodedResponse;
  //   try{
  //
  //     Response response = await get(Uri.parse(url),);
  //
  //     // Response response = await get(Uri.parse(url), headers: {
  //     //   'token': AuthUtility.userInfo.token.toString(),
  //     // });
  //     log(response.statusCode.toString());
  //     log('massage 111 : ${response.statusCode}');
  //     log(response.body);
  //     if (response.statusCode == 200) {
  //       //decodedResponse = jsonDecode(response.body);
  //       //final decodedResponse = jsonDecode(response.body);
  //       return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
  //     }
  //     else if (response.statusCode == 401){
  //       //gotoLogin();
  //     }
  //     else {
  //       //todo - handle other response code - 401,400, 500
  //       return NetworkResponse(false, response.statusCode, null);
  //     }
  //   } catch (e) {
  //     log(e.toString());      ///*** Replace of print method
  //   }
  //   return NetworkResponse(false, -1, null);
  //
  //   //return decodedResponse;
  //
  //   // finally {
  //   //   return decodedResponse;
  //   // }
  // }

  ///---------- GET Request With Token ----------///
  // Future<NetworkResponse> getRequestWithToken(String url) async{
  //   //Map<String, dynamic>? decodedResponse;
  //
  //   String tokenHead = 'Token ';
  //   String token = AuthUtility.userInfo.token.toString();
  //   String fullToken = 'Token ${AuthUtility.userInfo.token.toString()}';
  //
  //   try{
  //     Response response = await get(Uri.parse(url), headers: {
  //       //'token': AuthUtility.userInfo.token.toString(),
  //
  //       'Authorization': 'Token $token',   ///*** it is worked, but when new install it is not work
  //     });
  //     log(response.statusCode.toString());
  //     log('massage 111 : ${response.statusCode}');
  //     log(response.body);
  //     if (response.statusCode == 200) {
  //       //decodedResponse = jsonDecode(response.body);
  //       //final decodedResponse = jsonDecode(response.body);
  //       return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
  //     }
  //     else if (response.statusCode == 401){
  //       gotoLogin();
  //     }
  //     else {
  //       //todo - handle other response code - 401,400, 500
  //       return NetworkResponse(false, response.statusCode, null);
  //     }
  //   } catch (e) {
  //     log(e.toString());      ///*** Replace of print method
  //   }
  //   return NetworkResponse(false, -1, null);
  //
  //   //return decodedResponse;
  //
  //   // finally {
  //   //   return decodedResponse;
  //   // }
  // }

  ///---------- POST Request ----------///
  // Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body, {bool isLogin = false}) async{
  //
  //   //Map<String, dynamic>? decodedResponse;
  //   try{
  //     log('body content : ${body.toString()}');
  //     Response response = await post(
  //       Uri.parse(url),
  //       //headers: {'Content-Type': 'application/json'},
  //       headers: {
  //         'Content-Type': 'application/json',
  //         //'token': AuthUtility.userInfo.token.toString(),     ///*** for sending token through Header
  //         'Authorization': AuthUtility.userInfo.token.toString(),     ///*** for sending token through Header
  //
  //       },
  //       body: jsonEncode(body),
  //     );
  //     log(response.statusCode.toString());
  //     log(response.body);
  //     log('body content : ${body.toString()}');
  //     if (response.statusCode == 200) {
  //       //decodedResponse = jsonDecode(response.body);
  //       //final decodedResponse = jsonDecode(response.body);
  //       return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
  //     }
  //     else if (response.statusCode == 401) {
  //       if (isLogin == false) {
  //         gotoLogin();
  //       }
  //     }
  //     else if (response.statusCode == 201) {
  //       // print('Status Code : ${response.statusCode}');
  //       print("Request successful! from 'Network Caller' ");
  //       // print("Response body: ${response.body}");
  //       return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
  //     }
  //     else {
  //       //todo - handle other response code - 401,400, 500
  //       return NetworkResponse(false, response.statusCode, null);
  //     }
  //   } catch (e) {
  //     log(e.toString());      ///*** Replace of print method
  //   }
  //   return NetworkResponse(false, -1, null);
  //
  //   //return decodedResponse;
  //   // finally {
  //   //   return decodedResponse;
  //   // }
  // }

  ///---------- POST Request With Token ----------///
  // Future<NetworkResponse> postRequestWithToken(String url, Map<String, dynamic> body, {bool isLogin = false}) async{
  //
  //   String tokenHead = 'Token ';
  //   String token = AuthUtility.userInfo.token.toString();
  //   String fullToken = 'Token ${AuthUtility.userInfo.token.toString()}';
  //
  //   //Map<String, dynamic>? decodedResponse;
  //   try{
  //     log('body content : ${body.toString()}');
  //     Response response = await post(
  //       Uri.parse(url),
  //       //headers: {'Content-Type': 'application/json'},
  //       headers: {
  //         'Content-Type': 'application/json',
  //         //'token': AuthUtility.userInfo.token.toString(),     ///*** for sending token through Header
  //
  //         //'Authorization': 'Token 8b6e3d2c29b377667d3435a033c26c93dd34d0c1',     ///*** for sending token through Header  /// It is worked
  //         //'Authorization': 'fullToken',     ///*** for sending token through Header
  //         'Authorization': 'Token $token',   ///*** it is worked, but when new install it is not work
  //
  //       },
  //       body: jsonEncode(body),
  //     );
  //     log(response.statusCode.toString());
  //     log(response.body);
  //     log('body content : ${body.toString()}');
  //     if (response.statusCode == 200) {
  //       //decodedResponse = jsonDecode(response.body);
  //       //final decodedResponse = jsonDecode(response.body);
  //       return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
  //     }
  //     else if (response.statusCode == 401) {
  //       if (isLogin == false) {
  //         gotoLogin();
  //       }
  //     }
  //     else if (response.statusCode == 201) {
  //       // print('Status Code : ${response.statusCode}');
  //       print("Request successful! from 'Network Caller' ");
  //       // print("Response body: ${response.body}");
  //       return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
  //     }
  //     else {
  //       //todo - handle other response code - 401,400, 500
  //       return NetworkResponse(false, response.statusCode, null);
  //     }
  //   } catch (e) {
  //     log(e.toString());      ///*** Replace of print method
  //   }
  //   return NetworkResponse(false, -1, null);
  //
  //   //return decodedResponse;
  //   // finally {
  //   //   return decodedResponse;
  //   // }
  // }


  ///---------- PUT Request with Token ----------///
  // Future<NetworkResponse> putRequestWithToken(String url, Map<String, dynamic> body) async {
  //   String token = AuthUtility.userInfo.token.toString();
  //
  //   try {
  //     log('body content : ${body.toString()}');
  //     Response response = await put(
  //       Uri.parse(url),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Token $token',
  //       },
  //       body: jsonEncode(body),
  //     );
  //     log(response.statusCode.toString());
  //     log(response.body);
  //     log('body content : ${body.toString()}');
  //     if (response.statusCode == 200) {
  //       return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
  //     } else if (response.statusCode == 401) {
  //       gotoLogin();
  //     } else if (response.statusCode == 201) {
  //       print("Request successful! from 'Network Caller' ");
  //       return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
  //     } else {
  //       return NetworkResponse(false, response.statusCode, null);
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   return NetworkResponse(false, -1, null);
  // }



  ///---------- PUT Request with Token ----------///
  // Future<NetworkResponse> putRequestWithToken(String url, Map<String, dynamic> body) async {
  //   String token = AuthUtility.userInfo.token.toString();
  //   print('Token Print 0061: $token');
  //   String fulltoken = 'Token $token';
  //   print('Token Print 0062: $fulltoken');
  //
  //   try {
  //     log('body content : ${body.toString()}');
  //     Response response = await put(
  //       Uri.parse(url),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Token $token',
  //         //'Authorization': fulltoken,
  //         //'Authorization': 'Token 8b6e3d2c29b377667d3435a033c26c93dd34d0c1',
  //       },
  //       body: jsonEncode(body),
  //     );
  //     log(response.statusCode.toString());
  //     log(response.body);
  //     log('body content : ${body.toString()}');
  //     if (response.statusCode == 200) {
  //       return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
  //     } else if (response.statusCode == 401) {
  //       gotoLogin();
  //     } else if (response.statusCode == 201) {
  //       print("Request successful! from 'Network Caller' ");
  //       return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
  //     } else {
  //       return NetworkResponse(false, response.statusCode, null);
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   return NetworkResponse(false, -1, null);
  // }

  ///---------- PUT Request ----------///
  // Future<NetworkResponse> putRequest(String url, Map<String, dynamic> body) async {
  //   try {
  //     log('body content : ${body.toString()}');
  //     Response response = await put(
  //       Uri.parse(url),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': AuthUtility.userInfo.token.toString(),
  //       },
  //       body: jsonEncode(body),
  //     );
  //     log(response.statusCode.toString());
  //     log(response.body);
  //     log('body content : ${body.toString()}');
  //     if (response.statusCode == 200) {
  //       return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
  //     } else if (response.statusCode == 401) {
  //       gotoLogin();
  //     } else if (response.statusCode == 201) {
  //       print("Request successful! from 'Network Caller' ");
  //       return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
  //     } else {
  //       return NetworkResponse(false, response.statusCode, null);
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   return NetworkResponse(false, -1, null);
  // }


  ///---------- 401 Error Handle of login ----------///
  // Future<void> gotoLogin() async{
  //   //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);  ///*** Old code, Error context not found
  //   await AuthUtility.clearUserInfo();
  //   Navigator.pushAndRemoveUntil(
  //       BulkcorApp.globalKey.currentContext!,
  //       MaterialPageRoute(builder: (context) => const LoginScreen()),
  //           (route) => false);
  // }


}