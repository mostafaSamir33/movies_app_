import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/providers/token_provider.dart';

import '../models/profile_response_model.dart';

class ProfileApi {
  static final String baseUrl = "https://route-movie-apis.vercel.app";

  static Future<ProfileData?> getProfile(BuildContext context) async {
    final String? token = context.read<TokenProvider>().token;

    Uri uri = Uri.parse('$baseUrl/profile');
    http.Response response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
    );
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    ProfileResponseModel data = ProfileResponseModel.fromJson(jsonResponse);
    if (response.statusCode == 200) {
      return data.data;
    } else {
      throw data.message ?? 'something went wrong';
    }
  }

  static Future<dynamic> updateProfile() async {
    Uri uri = Uri.https(baseUrl, 'profile');
    http.Response response = await http.get(uri);
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    // ArticleResponseModel data = ArticleResponseModel.fromJson(jsonResponse);
    // if (data.status == 'ok' && response.statusCode == 200) {
    //   return data.articles;
    // } else {
    //   throw data.message ?? 'something went wrong';
    // }
  }

  static Future<dynamic> deleteProfile() async {
    Uri uri = Uri.https(baseUrl, 'profile');
    http.Response response = await http.get(uri);
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    // ArticleResponseModel data = ArticleResponseModel.fromJson(jsonResponse);
    // if (data.status == 'ok' && response.statusCode == 200) {
    //   return data.articles;
    // } else {
    //   throw data.message ?? 'something went wrong';
    // }
  }
}
