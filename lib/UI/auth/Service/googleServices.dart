import 'package:google_sign_in/google_sign_in.dart';

class GoogleServices {
  static final googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => googleSignIn.signIn();

  static Future<GoogleSignInAccount?> logout() => googleSignIn.disconnect();
class Googleservices {
  static final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
    ],
  );

  static Future<GoogleSignInAccount?> login() async {
    final user = await googleSignIn.signIn();

    return user;
  }

  static Future<void> logout() => googleSignIn.disconnect();
}
