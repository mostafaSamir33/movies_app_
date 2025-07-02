import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/utils/app_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = "https://route-movie-apis.vercel.app";


  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );
    final data = _processResponse(response);

    if (data.containsKey('data')) {
      final token = data['data'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      print('Token saved: $token');
    }

    return data;
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<Map<String, dynamic>> register(
      String name,
      String email,
      String password,
      String confirmPassword,
      String phone,
      int avaterId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "confirmPassword": confirmPassword,
        'avaterId': avaterId,
      }),
    );
    print('$email,$password,$name,$phone,$confirmPassword');
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> resetpassword(String email) async {
    final token = await getToken();
    if (token == null) throw Exception('Token not found, please login first');

    final response = await http.patch(
      Uri.parse('$baseUrl/auth/reset-password'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({"email": email}),
    );

    return _processResponse(response);
  }

  Map<String, dynamic> _processResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      print(jsonDecode(response.body)['message']);
      throw Exception(jsonDecode(response.body)['message'] ?? 'Request failed');
    }
  }





}

