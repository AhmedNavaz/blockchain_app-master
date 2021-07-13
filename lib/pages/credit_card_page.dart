import 'package:blockchain_app/controller/user_controller.dart';
import 'package:blockchain_app/pages/otp_page.dart';
import 'package:blockchain_app/widgets/custom_textfiled_widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditCardPage extends StatelessWidget {
  CreditCardPage({Key? key}) : super(key: key);
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
              'Card Details',
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
                      padding: const EdgeInsets.all(20),
                      child: CustomTextfieldWidget(
                          label: 'First Name', placeholder: 'Simpy')),
                  Container(
                      padding: const EdgeInsets.all(20),
                      child: CustomTextfieldWidget(
                          label: 'Last Name', placeholder: 'Swap')),
                  Container(
                      padding: const EdgeInsets.all(20),
                      child: CustomTextfieldWidget(
                        label: 'Card Number',
                        placeholder: 'XXXX XXXX XXXX XXXX',
                        number: true,
                      )),
                  Container(
                      padding: const EdgeInsets.all(20),
                      child: CustomTextfieldWidget(
                        label: 'Expiration Date',
                        placeholder: 'MM/YY',
                        date: true,
                      )),
                  Container(
                      padding: const EdgeInsets.all(20),
                      child: CustomTextfieldWidget(
                        label: 'Security Code (CVV)',
                        placeholder: 'XXX',
                        number: true,
                      )),
                  Container(
                    margin: const EdgeInsets.only(bottom: 100),
                    child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 40),
                        child: Text(
                          'Save',
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Please enter your card details here.',
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
