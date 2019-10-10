import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;


abstract class BaseAuth {
  Future<String> signIn(String email, String password);
  Future<String> signUp(String email, String password);
  Future<String> getCurrentUser();
  Future<void> signOut();
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
      return null;
  }

  Future<String> signUp(String email, String password) async {
      String url = "https://gym-notes-f8bbe.appspot.com/notes/api/users";
      String body = '{"email" : "$email", "password" : "$password"}';
      http.Response res =  await http.post(url, body: body);
      String content = res.body;
      return content;
  }

  Future<String> getCurrentUser() async {
    return null;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}