import 'package:ucare/authentication/auth_screen.dart';
import 'package:flutter/material.dart';
import '../text_styling/custom_text_getter.dart';


class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/onboard/onboard_1.png'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "Welcome to UCare",
              context: context,
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: CustomText(
            text: "UCare helps you track and improve your urinary health. It retrieves data from urinary health sensors wirelessly.",
            context: context,
            fontWeight: FontWeight.w400,
            fontSize: 20.99,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/onboard/onboard_2.png'),
        CustomText(text: "Monitor health status", context: context, fontWeight: FontWeight.w700, fontSize: 30,textAlign: TextAlign.center,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child:
          CustomText(text: "Check your urine health indicators and summary on the app dashboard. Monitor your health trends based on your history.",
              context: context, fontWeight: FontWeight.w400, fontSize: 20.99, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/onboard/onboard_3.png'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child:
            CustomText(text: "Get personalized advice and support",
              context: context, fontWeight: FontWeight.w700, fontSize: 30, textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38.0),
          child:
            CustomText(text: "Receive personalized health tips ,discover and reach out to nearby hospitals with urinary health care facilities.",
              context: context, fontWeight: FontWeight.w400, fontSize: 20.99, textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 15),
          child: FilledButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE0AC94),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: const Size(100, 50),
            ),
            onPressed: () {
               Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const AuthScreen(),
                ),
              );
              
            },
            child: CustomText(text: "Get Started", context: context, fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
