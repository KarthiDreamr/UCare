import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ucare/home_page.dart';
import 'package:sms_autofill/sms_autofill.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
          print(e.message);
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

  void printSignatureId() async {
    print("----------------------------------------");
    print(await SmsAutoFill().getAppSignature);
    print("----------------------------------------");
      }


  Widget button(TextEditingController string, bool validationState, Function changeValidationState) {

    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        onPressed: () {
          printSignatureId();
          if(string.text.isEmpty || string.text.length<13 || string.text.length>13){
            return;
          }

          _verifyPhone(_phoneController.text);
          changeValidationState();
        },
        child: Text(
          validationState?'Change Number':'Get OTP',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget otpField(bool validationState){
    if(validationState){
      return Padding(
        padding: const EdgeInsets.all(30.0),
        child: PinFieldAutoFill(
          decoration: UnderlineDecoration(
            textStyle: const TextStyle(fontSize: 20, color: Colors.black),
            colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
          ),
          currentCode: _otpController.text,
          onCodeSubmitted: (pin) {
            firebasePincodeVerify(pin);
          },
          onCodeChanged: (value) {
            if (value!.length == 6) {
              firebasePincodeVerify(value);
            }
          },
          codeLength: 6,
        ),
      );
    }
    else{
      return Container();
    }
  }

  Widget errorMessage(String text){

    // handle all the error messages here

    if(text.isEmpty){
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: const Text(
          'Please enter a valid phone number',
          style: TextStyle(color: Colors.red),
        ),
      );
    }
    if(text.length<10){
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: const Text(
          'Please enter a valid phone number',
          style: TextStyle(color: Colors.red),
        ),
      );
    }
    else{
      return Container();
    }
  }

  final TextEditingController _otpController = TextEditingController();
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
          button(
              _phoneController,
            validationState,
            _changeValidationState
          )
        ],
      ),
    );
  }
}

