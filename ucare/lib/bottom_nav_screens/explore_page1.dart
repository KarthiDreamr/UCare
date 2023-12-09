import 'package:flutter/material.dart';
import '../custom_widgets/custom_carousel.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<String> titles = [
    "3D Printed Cost-Effective Device for Diagnosing Urinary Tract Infection",
    "How Artificial Intelligence Could Revolutionize Antibiotic Choice in Recurrent UTI Infections",
    "New Vaccine Developed Against Recurrent Urinary Tract Infection (UTI)",
  ];

  List<String> subtitles = [
    "Artificial Intelligence (AI) algorithms can analyze patient data and patterns of bacterial resistance to guide antibiotic choice in recurrent UTIs"
        "Erbium YAG laser treatment decreases daytime urination frequency and urgency as well as increases voided volume.",
    "Researchers at the University of Texas at Dallas have investigated the use of whole-cell vaccines to fight urinary tract infection (UTI), part of an effort to tackle the increasingly serious issue of antibiotic-resistant bacteria."
  ];

  TextStyle getBoldTextStyle(){
    return TextStyle(
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.secondary
    );
  }

  TextStyle getTextStyle(){
    return TextStyle(
        color: Theme.of(context).colorScheme.onSecondaryContainer
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 2),
          child: CustomCarousel( ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
                left: 12,
                right: 12,
              ),
              child: Card(
                elevation: 4,
                color: Theme.of(context).colorScheme.secondaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("3D Printed Cost-Effective Device for Diagnosing Urinary Tract Infection",style: getBoldTextStyle()),
                        subtitle: Text("Artificial Intelligence (AI) algorithms can analyze patient data and patterns of bacterial resistance to guide antibiotic choice in recurrent UTIs",style: getTextStyle(),),
                      ),
                      ListTile(
                        title: Text("How Artificial Intelligence Could Revolutionize Antibiotic Choice in Recurrent UTI Infections",style: getBoldTextStyle()),
                        subtitle: Text("Researchers at the University of Texas at Dallas have investigated the use of whole-cell vaccines to fight urinary tract infection (UTI)",style: getTextStyle(),),
                      ),
                      ListTile(
                        title: Text("Laser Therapy Shows Promise in Decreasing Severity of Urinary Urge Incontinence",style: getBoldTextStyle()),
                        subtitle: Text("rbium YAG laser treatment decreases daytime urination frequency and urgency as well as increases voided volume.",style: getTextStyle(),),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
