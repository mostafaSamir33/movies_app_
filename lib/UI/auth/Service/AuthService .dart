import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = "https://route-movie-apis.vercel.app";

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    return _processResponse(response);
    
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

  Future<Map<String, dynamic>> forgetPassword(String email) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/auth/reset-password'),
      body: jsonEncode({"email": email}),
      headers: {"Content-Type": "application/json"},
    );
    return _processResponse(response);
  }

  Map<String, dynamic> _processResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception(jsonDecode(response.body)['message'] ?? 'Request failed');
    }
  }

}
