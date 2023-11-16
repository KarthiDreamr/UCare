import '/onboarding/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

// https://youtu.be/rWamixHIKmQ

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(
      brightness: brightness,
      useMaterial3: true,
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UCare',
      theme: _buildTheme(Brightness.light),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    // void super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    controller.addListener(() {
      setState(() {
        _pageIndex = controller.page!.round();
      });
    });

    if (_pageIndex != 2) {
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                allowImplicitScrolling: true,
                children: const <Widget>[
                  Center(child: OnboardingScreen1()),
                  Center(child: OnboardingScreen2()),
                  Center(child: OnboardingScreen3()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0, top: 30, right: 220),
              child: DotsIndicator(
                dotsCount: 3,
                position: _pageIndex,
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeColor: const Color(0xFFE0AC94),
                  color: Colors.white,
                  shape: const CircleBorder(
                    side: BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                  ),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          shape: const CircleBorder(),
          backgroundColor: const Color(0xFFE0AC94),
          foregroundColor: const Color(0xFFF5EAE5),
          child: const Icon(Icons.arrow_forward),
        ),
      );
    }

    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: PageView(
          controller: controller,
          allowImplicitScrolling: true,
          children: const <Widget>[
            Center(child: OnboardingScreen1()),
            Center(child: OnboardingScreen2()),
            Center(child: OnboardingScreen3()),
          ],
        ),
        ),
      ],
    ),
    );
  }
}
