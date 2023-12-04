import 'package:ucare/authentication/auth_screen.dart';

import '../custom_widgets/custom_form_field.dart';
import '/text_styling/custom_text_getter.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF1E1E1E),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 90,
            ),
            Center(
              child: CustomText(
                  text: "Log in",
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
                        label: "Password",
                        hintText: "Set password",
                        password: true,
                        validator: (string) {
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: CustomText(
                            text: "Forgot password?",
                            context: context,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          height: 80,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "Don’t you have an account?",
                            context: context,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const AuthScreen()),
                              );
                            },
                            child: CustomText(
                                text: "Sign up",
                                context: context,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
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
