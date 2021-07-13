import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Text(
                  'Please enter the 4-digit number we have sent to your phone',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              Center(
                child: OTPTextField(
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 55,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 15,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.bold),
                  onChanged: (pin) {
                    print("Changed: " + pin);
                  },
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.35),
              Container(
                child: ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: Text(
                      'Resend Code',
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
        ),
      ),
    );
  }
}
