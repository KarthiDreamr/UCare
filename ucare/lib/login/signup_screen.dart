import '/custom_form_field.dart';
import '/text_styling/custom_text_getter.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF1E1E1E),
        body: Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            Center(
              child: CustomText(
                  text: "Create account",
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  context: context,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 120,
            ),
            Expanded(
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ListView(
                    children: [
                      CustomFormField(
                        label: "Phone",
                        hintText: "(050) 123 45 67",
                        validator: (string) {
                          String pattern = r'(^[0-9]{10}$)';
                          RegExp regExp = RegExp(pattern);
                          if (string == null || !regExp.hasMatch(string)) {
                            return 'Please enter a valid phone number';
                          } else {
                            return null;
                          }
                        },
                      ),
                      CustomFormField(
                        label: "Email (Optional) ",
                        hintText: "Enter your email address",
                        icon: Icons.help_outline,
                        validator: (value) {
                          if (value==null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      CustomFormField(
                        label: "Password",
                        hintText: "Set password",
                        password: true,
                      validator: (string) {
                        String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                        RegExp regExp = RegExp(pattern);
                        if (string==null || !regExp.hasMatch(string)) {
                          return 'Please enter a valid password';
                        } else {
                          return null;
                        }
                      },
                      ),
                      const Expanded(
                        child: SizedBox(
                          height: 10,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "Already have an account?",
                            context: context,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LogInPage()),
                              );
                            },
                            child: CustomText(
                              text: "Log In",
                              context: context,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE0AC94),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => LogInPage(),
                            //   ),
                            // );
                          }
                        },
                        child: CustomText(
                          text: "Continue",
                          context: context,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
