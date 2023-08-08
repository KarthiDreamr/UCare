import 'package:flutter/material.dart';
import 'package:ucare/elevated_card.dart';
import 'carousel.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
         Carousel(),
        ElevatedCard( )
      ],
    );
  }
}
