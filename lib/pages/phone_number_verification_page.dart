import 'package:blockchain_app/controller/user_controller.dart';
import 'package:blockchain_app/pages/account_page.dart';
import 'package:blockchain_app/pages/otp_page.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

enum PhoneVerificationPageState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class PhoneVerificationPage extends StatefulWidget {
  @override
  _PhoneVerificationPageState createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  PhoneVerificationPageState currentState =
      PhoneVerificationPageState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final userController = Get.put(UserController());

  FirebaseAuth _auth = FirebaseAuth.instance;

  String? verificationId;

  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Phone Number Verified'),
        backgroundColor: Colors.green,
      ));
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AccountPage()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _scaffoldKey.currentState!
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

  getMobileFormWidget(context) {
    return SingleChildScrollView(
      child: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: 70),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Card(
                  color: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Container(
                              child: CountryCodePicker(
                                onChanged: (code) {
                                  userController.country_code.value =
                                      code.toString();
                                },
                                initialSelection: 'US',
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: true,
                                alignLeft: false,
                              ),
                            ),
                          ),
                          Container(
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 20,
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: phoneController,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600,
                      fontSize: 16),
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    hintText: 'XX XXX XXXXXXX',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 16,
                    ),
                    contentPadding: EdgeInsets.all(5),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.34,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 100),
                child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 40),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontFamily: 'Exo2',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ))),
                    onPressed: () async {
                      setState(() {
                        showLoading = true;
                      });

                      await _auth.verifyPhoneNumber(
                        phoneNumber: phoneController.text,
                        verificationCompleted: (phoneAuthCredential) async {
                          setState(() {
                            showLoading = false;
                          });
                          //signInWithPhoneAuthCredential(phoneAuthCredential);
                        },
                        verificationFailed: (verificationFailed) async {
                          setState(() {
                            showLoading = false;
                          });
                          _scaffoldKey.currentState!.showSnackBar(SnackBar(
                              content: Text(verificationFailed.message!)));
                        },
                        codeSent: (verificationId, resendingToken) async {
                          setState(() {
                            showLoading = false;
                            currentState =
                                PhoneVerificationPageState.SHOW_OTP_FORM_STATE;
                            this.verificationId = verificationId;
                          });
                        },
                        codeAutoRetrievalTimeout: (verificationId) async {},
                      );
                    }),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Please enter your country and your phone number to recieve a verification code.',
            textAlign: TextAlign.center,
          ),
        ),
      ]),
    );
  }

  getOtpFormWidget(context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Text(
              'Please enter the 4-digit number we have sent to your phone',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Center(
            child: OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 15,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.bold),
                onChanged: (pin) {
                  print("Changed: " + pin);
                },
                onCompleted: (pin) async {
                  PhoneAuthCredential phoneAuthCredential =
                      PhoneAuthProvider.credential(
                          verificationId: verificationId!, smsCode: pin);

                  Future.delayed(Duration(milliseconds: 1000), () {
                    signInWithPhoneAuthCredential(phoneAuthCredential);
                  });
                }),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.35),
          Container(
            child: ElevatedButton(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontFamily: 'Exo2',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ))),
              onPressed: () => Get.to(() => OtpPage()),
            ),
          ),
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.grey.shade200,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              leading: BackButton(
                color: Colors.black,
              ),
              elevation: 0,
              backgroundColor: Colors.grey.shade200,
              centerTitle: true,
              title: Text(
                'Verify Number',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          body: Container(
            child: showLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : currentState ==
                        PhoneVerificationPageState.SHOW_MOBILE_FORM_STATE
                    ? getMobileFormWidget(context)
                    : getOtpFormWidget(context),
            padding: const EdgeInsets.all(16),
          )),
    );
  }
}
