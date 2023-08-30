import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
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
        lightColorScheme = lightColorScheme.copyWith(secondary: _brandBlue);
        lightCustomColors = lightCustomColors.harmonized(lightColorScheme);

        darkColorScheme = darkDynamic.harmonized();
        darkColorScheme = darkColorScheme.copyWith(secondary: _brandBlue);
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
        home: const HomePage(),
      );
    },
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









//
//
// import 'common.dart';
//
// bool _isDemoUsingDynamicColors = false;
//
// // Fictitious brand color.
// const _brandBlue = Color(0xFF1E88E5);
//
// CustomColors lightCustomColors = const CustomColors(danger: Color(0xFFE53935));
// CustomColors darkCustomColors = const CustomColors(danger: Color(0xFFEF9A9A));
//
// class CompleteExample extends StatelessWidget {
//   const CompleteExample({Key? key}) : super(key: key);
//
//   static const title = 'Complete example';
//
//   @override
//   Widget build(BuildContext context) {
//     // Wrap MaterialApp with a DynamicColorBuilder.
//     return DynamicColorBuilder(
//       builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
//         ColorScheme lightColorScheme;
//         ColorScheme darkColorScheme;
//
//         if (lightDynamic != null && darkDynamic != null) {
//           // On Android S+ devices, use the provided dynamic color scheme.
//           // (Recommended) Harmonize the dynamic color scheme' built-in semantic colors.
//           lightColorScheme = lightDynamic.harmonized();
//           // (Optional) Customize the scheme as desired. For example, one might
//           // want to use a brand color to override the dynamic [ColorScheme.secondary].
//           lightColorScheme = lightColorScheme.copyWith(secondary: _brandBlue);
//           // (Optional) If applicable, harmonize custom colors.
//           lightCustomColors = lightCustomColors.harmonized(lightColorScheme);
//
//           // Repeat for the dark color scheme.
//           darkColorScheme = darkDynamic.harmonized();
//           darkColorScheme = darkColorScheme.copyWith(secondary: _brandBlue);
//           darkCustomColors = darkCustomColors.harmonized(darkColorScheme);
//
//           _isDemoUsingDynamicColors = true; // ignore, only for demo purposes
//         } else {
//           // Otherwise, use fallback schemes.
//           lightColorScheme = ColorScheme.fromSeed(
//             seedColor: _brandBlue,
//           );
//           darkColorScheme = ColorScheme.fromSeed(
//             seedColor: _brandBlue,
//             brightness: Brightness.dark,
//           );
//         }
//
//         return MaterialApp(
//           theme: ThemeData(
//             colorScheme: lightColorScheme,
//             extensions: [lightCustomColors],
//           ),
//           darkTheme: ThemeData(
//             colorScheme: darkColorScheme,
//             extensions: [darkCustomColors],
//           ),
//           home: const Home(),
//           debugShowCheckedModeBanner: false,
//         );
//       },
//     );
//   }
// }
