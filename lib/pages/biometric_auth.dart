import 'dart:async';
import 'dart:io';
import 'package:blockchain_app/views/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class BiometricAuth extends StatefulWidget {
  @override
  _BiometricAuthState createState() => _BiometricAuthState();
}

class _BiometricAuthState extends State<BiometricAuth> {
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          localizedReason: 'Let OS determine authentication method',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = "Error - ${e.message}";
      });
      return;
    }
    if (!mounted) return;

    if (authenticated) {
      Get.to(() => RootScreen());
    }
    setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  }

  void _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.only(top: 30),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_supportState == _SupportState.unknown)
                  CircularProgressIndicator()
                else if (_supportState == _SupportState.supported)
                  Text("This device is supported")
                else
                  Text("This device is not supported"),
                Divider(height: 100),
                SizedBox(height: MediaQuery.of(context).size.height * 0.50),
                Text('Current State: $_authorized\n'),
                (_isAuthenticating)
                    ? ElevatedButton(
                        onPressed: _cancelAuthentication,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Cancel Authentication"),
                            Icon(Icons.cancel),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Authenticate'),
                                Platform.isAndroid
                                    ? Icon(Icons.fingerprint)
                                    : Icon(Icons.lock_open_outlined),
                              ],
                            ),
                            onPressed: _authenticate,
                          ),
                        ],
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
