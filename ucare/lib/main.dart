import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import '/onboarding/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'firebase/firebase_options.dart';


// https://youtu.be/rWamixHIKmQ

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}
const _brandBlue = Color(0xFFFF7F50);

CustomColors lightCustomColors = const CustomColors(danger: Color(0xFFE53935));
CustomColors darkCustomColors = const CustomColors(danger: Color(0xFFEF9A9A));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      ColorScheme lightColorScheme;
      ColorScheme darkColorScheme;

      if (lightDynamic != null && darkDynamic != null) {
        lightColorScheme = lightDynamic.harmonized();
        // lightColorScheme = lightColorScheme.copyWith(secondary: _brandBlue);
        lightCustomColors = lightCustomColors.harmonized(lightColorScheme);

        darkColorScheme = darkDynamic.harmonized();
        // darkColorScheme = darkColorScheme.copyWith(secondary: _brandBlue);
        darkCustomColors = darkCustomColors.harmonized(darkColorScheme);

      } else {
        // Otherwise, use fallback schemes.
        lightColorScheme = ColorScheme.fromSeed(
          seedColor: _brandBlue,
        );
        darkColorScheme = ColorScheme.fromSeed(
          seedColor: _brandBlue,
          brightness: Brightness.dark,
        );
      }

      return MaterialApp(
        title: 'UCare',
        theme: ThemeData(
          colorScheme: lightColorScheme,
            extensions: [lightCustomColors],
          useMaterial3: true
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme,
            extensions: [darkCustomColors],
          useMaterial3: true
        ),
        home: const MyHomePage(),
      );
    },
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


@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.danger,
  });

  final Color? danger;

  @override
  CustomColors copyWith({Color? danger}) {
    return CustomColors(
      danger: danger ?? this.danger,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      danger: Color.lerp(danger, other.danger, t),
    );
  }

  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith(danger: danger!.harmonizeWith(dynamic.primary));
  }
}

// needle pointer -> smaller ( gradient ) realtime value
// remove values of graph and add x and y axis add values
// Header size increase
// add double box page,
// database page -- charan bhavy
// Diet plan - todo + custom + auto
// nearby hospital


