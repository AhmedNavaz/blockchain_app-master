import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class ChangePin extends StatelessWidget {
  const ChangePin({Key? key}) : super(key: key);

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
              'Change Pin',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
            Container(
              margin: const EdgeInsets.only(top: 80),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 20),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Current Pin',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
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
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 20),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'New Pin',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
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
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 100, bottom: 200),
                        child: ElevatedButton(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            child: Text(
                              'Change Pin',
                              style: TextStyle(
                                  fontFamily: 'Exo2',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ))),
                          onPressed: () => Get.to(() {}),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
