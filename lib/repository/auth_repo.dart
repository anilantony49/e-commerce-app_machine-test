import 'dart:convert';

import 'package:e_commerce_app/services/shared_preference.dart';
import 'package:e_commerce_app/utils/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  static Future<SignInResult> userSignIn(
      {required String username, required String password}) async {
    var client = http.Client();
    String signUpUrl = "${ApiEndPoints.baseUrl}${ApiEndPoints.userSignIn}";
    try {
      var user = {
        "username": username,
        "password": password,
      };
      var response = await client.post(
        Uri.parse(signUpUrl),
        body: jsonEncode(user),
        headers: {'Content-Type': 'application/json'},
      );
      var jsonResponse = jsonDecode(response.body);
      debugPrint('User Sign In Status: ${response.statusCode}');
      if (response.statusCode == 201) {
        await UserAuthStatus.saveUserStatus(true);
        await UserToken.saveToken(jsonResponse['token']);
        await CurrentUserId.saveUserId(jsonResponse['userId']);
        return SignInResult(status: 'success', responseBody: jsonResponse);
      }
      if (response.statusCode == 400) {
        return SignInResult(status: 'invalid-username', responseBody: null);
      }
      if (response.statusCode == 401) {
        if (jsonResponse['error'] == "User Has Been Blocked by Admin") {
          return SignInResult(status: 'blocked-by-admin', responseBody: null);
        }
        if (jsonResponse['error'] == "Invalid Password") {
          return SignInResult(status: 'invalid-password', responseBody: null);
        }
      }
      return SignInResult(status: 'error', responseBody: null);
    } catch (e) {
      debugPrint('User Sign in Status: $e');
      return SignInResult(status: 'error', responseBody: null);
    }
  }
}

class SignInResult {
  final String? status;
  final dynamic responseBody;

  SignInResult({this.status, this.responseBody});
}
