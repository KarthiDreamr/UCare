import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ucare/home_page.dart';
import 'package:phone_form_field/phone_form_field.dart';

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

  final PhoneController _phoneController = PhoneController(
      const PhoneNumber(isoCode: IsoCode.IN, nsn: '')
  );

  _verifyPhone(String text) async {
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


  Widget button(PhoneController string, bool validationState, Function changeValidationState) {

    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        onPressed: () {
          _verifyPhone(_phoneController.value!.international.toString());
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
        child: PinCodeTextField(
          appContext: context,
          length: 6,
          obscureText: false,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(10),
            fieldHeight: 50,
            fieldWidth: 40,
            activeFillColor: Colors.white,
          ),
          animationDuration: const Duration(milliseconds: 300),
          keyboardType: TextInputType.number,
          enableActiveFill: true,
          controller: _otpController,
          onCompleted: (pin) {
            firebasePincodeVerify(pin);
          },
          onChanged: (value) {
            print(value);
          },
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
              PhoneFormField(
                key: const Key('phone-field'),
                controller: _phoneController,     // controller & initialValue value
                initialValue: null,   // can't be supplied simultaneously
                shouldFormat: true,    // default
                defaultCountry: IsoCode.IN, // default
                decoration: const InputDecoration(
                    labelText: 'Phone',          // default to null
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ) // default to UnderlineInputBorder(),
                  // ...
                ),
                validator: PhoneValidator.validMobile(),   // default PhoneValidator.valid()
                isCountryChipPersistent: false, // default
                isCountrySelectionEnabled: true, // default
                countrySelectorNavigator: const CountrySelectorNavigator.bottomSheet(),
                showFlagInInput: true,  // default
                flagSize: 16,           // default
                autofillHints: const [AutofillHints.telephoneNumber], // default to null
                enabled: true,          // default
                autofocus: false,       // default
                onSaved: (PhoneNumber? p) {
                  if (p != null) {
                  print('saved $p');
                  }
                  } ,   // default null
                onChanged: (PhoneNumber? p) {
                  if (p != null) {
                    print('saved $p');
                  }
                }, // default null
                // ... + other textfield params
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

