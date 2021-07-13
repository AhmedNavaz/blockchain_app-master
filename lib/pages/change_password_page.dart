import 'package:blockchain_app/controller/auth_controller.dart';
import 'package:blockchain_app/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());
  final authController = Get.put(AuthController());

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool currentPasswordValid = true;

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
              'Change Password',
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        controller: passwordController,
                        enableSuggestions: false,
                        autocorrect: false,
                        obscureText: true,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 18),
                        decoration: InputDecoration(
                          errorText: currentPasswordValid
                              ? ''
                              : 'Please check your current password',
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: IconButton(
                              icon: Icon(Icons.visibility),
                              onPressed: () {},
                            ),
                          ),
                          labelText: 'Current Password',
                          labelStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          contentPadding: EdgeInsets.all(5),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: passwordFields('New Password', (value) {},
                          newPasswordController),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: passwordFields('Repeat Password', (value) {
                        return newPasswordController.text ==
                                value
                            ? null
                            : 'Passwords must match';
                      }, repeatPasswordController),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30, bottom: 200),
                      child: ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: Text(
                            'Change Password',
                            style: TextStyle(
                                fontFamily: 'Exo2',
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ))),
                        onPressed: () async {
                          currentPasswordValid =
                              await authController.validateCurrentPassword(
                                  passwordController.text);

                          setState(() {});
                          if (_formKey.currentState!.validate() &&
                              currentPasswordValid) {
                            authController.updateUserPassword(
                                newPasswordController.text);
                            Get.back();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

TextFormField passwordFields(final String label, FormFieldValidator valid,
    TextEditingController controller) {
  return TextFormField(
    controller: controller,
    validator: valid,
    enableSuggestions: false,
    autocorrect: false,
    obscureText: true,
    style: TextStyle(
        fontWeight: FontWeight.w400, color: Colors.black, fontSize: 18),
    decoration: InputDecoration(
      suffixIcon: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: IconButton(
          icon: Icon(Icons.visibility),
          onPressed: () {},
        ),
      ),
      labelText: label,
      labelStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 18,
          fontWeight: FontWeight.bold),
      contentPadding: EdgeInsets.all(5),
    ),
  );
}
