import 'package:blockchain_app/controller/user_controller.dart';
import 'package:blockchain_app/pages/otp_page.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyNumberPage extends StatelessWidget {
  VerifyNumberPage({Key? key}) : super(key: key);
  final userController = Get.put(UserController());

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
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
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
                    child: Obx(
                      () => TextFormField(
                        keyboardType: TextInputType.number,
                        initialValue: userController.country_code.value,
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
                          hintText: 'xxxx xxx xx',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 16,
                          ),
                          contentPadding: EdgeInsets.all(5),
                        ),
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
                          'Submit',
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
                      onPressed: () => Get.to(() => OtpPage()),
                    ),
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
        ),
      ),
    );
  }
}
