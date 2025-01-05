import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/models/user_model/user_model.dart';
import 'package:e_commerce_app/data/services/shared_preference.dart';
import 'package:e_commerce_app/core/utils/api_endpoints.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;


class UserRepo {
  static Future<List<UserModel>> fetchUserDetails() async {
    Dio dio = Dio();
    String token = await UserToken.getToken();
    // String userId = await CurrentUserId.getUserId();
    String userListUrl = "${ApiEndPoints.baseUrl}${ApiEndPoints.allUsers}";
    List<UserModel> users = [];
    try {
      var response = await dio.get(
        userListUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      debugPrint('Fetch User Status: ${response.statusCode}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        List userList = responseData['user'];
        for (int i = 0; i < userList.length; i++) {
          // UserModel user = UserModel.fromJson(userList[i]);
          // if (user.id != userId && !user.isBlocked!) {
          //   users.add(user);
          // }
        }
        return users;
      }
      return [];
    } catch (e) {
      debugPrint('Fetch User Error: ${e.toString()}');
      return [];
    }
  }

  // static Future<UserDetailsModel?> fetchUserDetailsById(String userId) async {
  //   Dio dio = Dio();
  //   String token = await UserToken.getToken();
  //   String userDetailUrl = "${ApiEndPoints.baseUrl}${ApiEndPoints.user}$userId";
  //   // List<PostModel> posts = [];
  //   try {
  //     var response = await dio.get(
  //       userDetailUrl,
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'Authorization': 'Bearer $token',
  //         },
  //       ),
  //     );
  //     debugPrint('Fetch User By Id Status: ${response.statusCode}');
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> responseData = response.data;
  //       UserModel user = UserModel.fromJson(responseData['user']);
  //       final List postsList = responseData['posts'];
  //       for (int i = 0; i < postsList.length; i++) {
  //         PostModel post = PostModel.fromJson(postsList[i]);
  //         if (!post.isBlocked) {
  //           posts.add(post);
  //         }
  //       }
  //       return UserDetailsModel(user: user, posts: posts);
  //     }
  //     return null;
  //   } catch (e) {
  //     debugPrint('Fetch User By Id Error: $e');
  //     return null;
  //   }
  // }


}

class UserDetailsModel {
  final UserModel user;


  UserDetailsModel({
    required this.user,

  });
}


