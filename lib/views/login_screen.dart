import 'package:blockchain_app/controller/auth_controller.dart';
import 'package:blockchain_app/pages/biometric_auth.dart';
import 'package:blockchain_app/views/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'dart:io';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:local_auth/local_auth.dart';

final users = {'ahmed@gmail.com': '12345'};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  final authController = Get.find<AuthController>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future loginWithFacebook(FacebookLoginResult result) async {
    final FacebookAccessToken accessToken = result.accessToken;
    AuthCredential credential =
        FacebookAuthProvider.credential(accessToken.token);
    var a = await _auth.signInWithCredential(credential);
    print(a.user);
  }

  Future<void> handleLogin() async {
    final FacebookLoginResult result =
        await authController.facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        break;
      case FacebookLoginStatus.loggedIn:
        try {
          await loginWithFacebook(result);
        } catch (e) {
          print(e);
        }
        break;
    }
  }

  Future<String> _authUser(LoginData data) {
    return authController.login(data.name, data.password).then((value) {
      if (value == '') {
        return "Invalid Credentials";
      }
      return '';
    });
  }

  Future<String> _onSubmitUser(LoginData data) {
    return authController.createUser(data.name, data.password).then((value) {
      if (value == '') {
        return "Email already exists";
      }
      return '';
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return '';
    });
  }

  final LocalAuthentication auth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
        logo: 'assets/images/SimpySwap-03-(White Version).png',
        onLogin: _authUser,
        onSignup: _onSubmitUser,
        onSubmitAnimationCompleted: () {
          auth.isDeviceSupported().then((isSupported) {
            if (isSupported) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => BiometricAuth(),
              ));
            } else {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => RootScreen(),
              ));
            }
          });
        },
        onRecoverPassword: _recoverPassword,
        loginProviders: <LoginProvider>[
          Platform.isIOS || Platform.isMacOS
              ? LoginProvider(
                  icon: FontAwesomeIcons.apple,
                  callback: () async {
                    print('start google sign in');
                    await Future.delayed(loginTime);
                    print('stop google sign in');
                    return null;
                  },
                )
              : LoginProvider(
                  icon: FontAwesomeIcons.google,
                  callback: () async {
                    return authController.loginWithGoogle().then((value) {
                      if (value == '') {
                        return 'Error Authenticating';
                      } else {
                        return '';
                      }
                    });
                  },
                ),
          LoginProvider(
            icon: FontAwesomeIcons.facebookF,
            callback: () async {
              handleLogin();
            },
          ),
        ]);
  }
}
