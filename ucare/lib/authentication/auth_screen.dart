import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:ucare/home_page.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final scaffoldKey = GlobalKey();
  late OTPTextEditController otp_pin_controller;

  @override
  void initState() {
    super.initState();
    otp_pin_controller = OTPTextEditController(
      codeLength: 5,
      //ignore: avoid_print
      onCodeReceive: (code) => print('Your Application receive code - $code'),
    )..startListenUserConsent(
        (code) {
          final exp = RegExp(r'(\d{5})');
          return exp.stringMatch(code ?? '') ?? '';
        },
        // strategies: [
        //   SampleStrategy(),
        // ],
      );
  }

  @override
  void dispose() {
    otp_pin_controller.stopListen();
    super.dispose();
  }

  String? _verificationCode;

  void firebasePincodeVerify(String pin) async {
    await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
            verificationId: _verificationCode!, smsCode: pin))
        .then((value) async {
      if (value.user != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      }
    });
  }

  final defaultPinTheme = PinTheme(
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 50,
    fieldWidth: 40,
    activeFillColor: Colors.white,
  );

  final TextEditingController _phoneController = TextEditingController();

  _verifyPhone(String text) async {
    await SmsAutoFill().listenForCode();
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          if (kDebugMode) {
            print(e.message);
          }
        },
        codeSent: (String? verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: const Duration(seconds: 120));
  }

  Widget button(TextEditingController string, bool validationState,
      Function changeValidationState) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        onPressed: () {

          if (validationState) {
            firebasePincodeVerify(otp_pin_controller.text);
          }
          
          if (string.text.isEmpty ||
              string.text.length < 13 ||
              string.text.length > 13) {
            return;
          }

          _verifyPhone(_phoneController.text);
          changeValidationState();
        },
        child: Text(
          validationState ? 'Next' : 'Get OTP',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget otpField(bool validationState) {
    if (validationState) {
      return Padding(
          padding: const EdgeInsets.all(30.0),
          child: PinCodeTextField(
            appContext: context,
            length: 6,
            obscureText: false,
            animationType: AnimationType.fade,
            pinTheme: defaultPinTheme,
            animationDuration: const Duration(milliseconds: 300),
            enableActiveFill: true,
            controller: otp_pin_controller,
            onCompleted: (v) {
              otp_pin_controller.stopListen();
              firebasePincodeVerify(v);
            },
            onChanged: (value) {
              if (value.length == 6) {
                otp_pin_controller.stopListen();
                firebasePincodeVerify(value);
              }
            },
            beforeTextPaste: (text) {
              return true;
            }
          )

          // TextField(
          //   textAlign: TextAlign.center,
          //   keyboardType: TextInputType.number,
          //   controller: controller,
          //   onChanged: (value) {
          //     if (value.length == 6) {
          //       controller.stopListen();
          //       firebasePincodeVerify(value);
          //     }
          //   },
          // )

          // PinFieldAutoFill(
          //   decoration: UnderlineDecoration(
          //     textStyle: const TextStyle(fontSize: 20, color: Colors.black),
          //     colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
          //   ),
          //   currentCode: _otpController.text,
          //   onCodeSubmitted: (pin) {
          //     firebasePincodeVerify(pin);
          //   },
          //   onCodeChanged: (value) {
          //     if (value!.length == 6) {
          //       firebasePincodeVerify(value);
          //     }
          //   },
          //   codeLength: 6,
          // ),

          );
    } else {
      return Container();
    }
  }

  Widget errorMessage(String text) {
    // handle all the error messages here

    if (text.isEmpty) {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: const Text(
          'Please enter a valid phone number',
          style: TextStyle(color: Colors.red),
        ),
      );
    }
    if (text.length < 10) {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: const Text(
          'Please enter a valid phone number',
          style: TextStyle(color: Colors.red),
        ),
      );
    } else {
      return Container();
    }
  }

  bool validationState = false;

  void _changeValidationState() {
    setState(() {
      validationState = !validationState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: const Center(
                child: Text(
                  'Welcome to UCare!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40, right: 15, left: 15),
              child: // all params
                  PhoneFieldHint(
                controller: _phoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                  labelText: 'Phone Number',
                ),
              ),
            ),
            otpField(validationState)
          ]),
          button(_phoneController, validationState, _changeValidationState)
        ],
      ),
    );
  }
}
