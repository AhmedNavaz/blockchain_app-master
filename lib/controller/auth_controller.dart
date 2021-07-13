import 'dart:convert';

import 'package:blockchain_app/controller/user_controller.dart';
import 'package:blockchain_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final userController = Get.put(UserController());
  static const String BASE_URL = "https://simpyswap.net/";

  var profile_verified = true.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  final currentUser = FirebaseAuth.instance.currentUser.obs;

  @override
  void onInit() {
    currentUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  Future<String> createUser(String email, String password) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);

      createUserInDatabase(authResult.user!.uid, authResult.user!.email!).then((value) => debugPrint(value.statusCode.toString()));

      return authResult.user!.uid;
    } catch (e) {
      return '';
    }
  }

  Future<String> login(String email, String password) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      return authResult.user!.uid;
    } catch (e) {
      return '';
    }
  }

  Future<String> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    try {
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      _auth.signInWithCredential(credential).then((value) {
        if ('' == value.user!.uid || value.user!.uid == null) {
          return "Error Authenticating";
        } else {
          // CHECK IF USER EXISTS
          // IF ! EXiSTS CREATE A USER IN DATABASE
          getUser(value.user!.uid).then((res){
            if(res.statusCode == 404){
              createUserInDatabase(value.user!.uid, value.user!.email!).then((value) => debugPrint(value.statusCode.toString()));
            }
          });

          return '';
        }
      });
    } catch (e) {
      Get.snackbar("Error login Account", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
      return 'Error Authenticating';
    }
    return 'Error Authenticating';
  }

  Future<bool> validatePassword(String password) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser;

    try {
      var authCredentials = EmailAuthProvider.credential(
          email: firebaseUser!.email.toString(), password: password);
      var authResult =
          await firebaseUser.reauthenticateWithCredential(authCredentials);
      return authResult.user != null;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void logOut() async {
    try {
      await googleSignIn.signOut();
      await _auth.signOut();
      userController.loggedInUser.value.uid = null;
    } catch (e) {
      Get.snackbar("Error Signing Out", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> updatePassword(String password) async {
    var firebaseUser = await _auth.currentUser;
    firebaseUser!.updatePassword(password);
  }

  Future<bool> validateCurrentPassword(String password) async {
    return await validatePassword(password);
  }

  void updateUserPassword(String password) {
    updatePassword(password);
  }



  // HTTP REQUESTS TO HOSTINGER SERVER

  Future<http.Response> createUserInDatabase(String uid, String email) async {
    var url = Uri.parse(BASE_URL + 'auth/user-info');
    try {
      http.Response response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'email': email,
            'uid': uid,
          }));
      return response;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<http.Response> addPersonalInfo(String firstName, String lastName, String streetAddress, String city, String zip, String citizenship, String uid) async {
    var url = Uri.parse(BASE_URL + 'auth/personal-info/$uid');
    try {
      http.Response response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "firstName": firstName,
            "lastName" : lastName,
            "streetAddress" : streetAddress,
            "city" : city,
            "zip" : zip,
            "citizenship" : citizenship
          }));
      return response;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<http.Response> getUser(String uid) async {
    var url = Uri.parse(BASE_URL + 'auth/get-user/$uid');
    try {
      http.Response response = await http.get(url);
      if(jsonDecode(response.body)['data'] != 'No data found'){
        userController.loggedInUser.value = UserModel.fromJson(jsonDecode(response.body)['data']);
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

}
