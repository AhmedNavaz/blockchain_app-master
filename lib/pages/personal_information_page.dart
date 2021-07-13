import 'package:blockchain_app/controller/auth_controller.dart';
import 'package:blockchain_app/controller/user_controller.dart';
import 'package:blockchain_app/widgets/custom_textfiled_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInformationPage extends StatelessWidget {
  PersonalInformationPage({Key? key}) : super(key: key);
  final userController = Get.put(UserController());
  final authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController citizenshipController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              'Personal Information',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
            Container(
              margin: EdgeInsets.only(top: 80),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(20),
                        child: CustomTextfieldWidget(
                          label: 'First Name',
                          placeholder: 'Simpy',
                          controller: firstNameController,
                        )),
                    Container(
                        padding: const EdgeInsets.all(20),
                        child: CustomTextfieldWidget(
                          label: 'Last Name',
                          placeholder: 'Swap',
                          controller: lastNameController,
                        )),
                    Container(
                        padding: const EdgeInsets.all(20),
                        child: CustomTextfieldWidget(
                          label: 'Street Address',
                          placeholder: '74 Monroe Avenue',
                          controller:streetController,
                        )),
                    Container(
                        padding: const EdgeInsets.all(20),
                        child: CustomTextfieldWidget(
                          label: 'City',
                          placeholder: 'Fort Myers',
                          controller: cityController,
                        )),
                    Container(
                        padding: const EdgeInsets.all(20),
                        child: CustomTextfieldWidget(
                          label: 'Zip/Area code',
                          placeholder: '33901',
                          controller: zipController,
                        )),
                    Container(
                        padding: const EdgeInsets.all(20),
                        child: CustomTextfieldWidget(
                          label: 'Citizenship',
                          placeholder: 'United States',
                          controller: citizenshipController,
                        )),
                    Container(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Successfully Updated'),
                              backgroundColor: Colors.green,
                            ));
                                authController.addPersonalInfo(
                                    firstNameController.text,
                                    lastNameController.text,
                                    streetController.text,
                                    cityController.text,
                                    zipController.text,
                                    citizenshipController.text, userController.loggedInUser.value.uid!).then((res) {
                                      if(res.statusCode == 200){
                                        Get.back();
                                      }
                                });
                          }
                        },
                        child: Text('Submit'),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'We get your personal information from the verification process. If you want to make changes on your personal information, contact our support.',
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
