import 'package:flutter/material.dart';
import 'package:ucare/page5.dart';
import 'custom_widgets/custom_card_text.dart';


class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomCardText(
              headingValue: "Doctor Recommendation",
              textValue: "\n\u2756 Contact your doctor soon after symptoms"
                  "\n\u2756 Take antibiotics to treat urinary tract infections"
                  "\n\u2756 Drink water to prevent dehydration"
                  "\n\u2756 Use a heating pad to relieve pain "
                  "\n\u2756 Avoid caffeine, alcohol and spicy foods"
                  "\n\u2756 Abdominal, pelvic, or lower back pain  "
                  "\n\u2756 Blood in the urine (hematuria) "
                  "\n\u2756 Difficulty producing the urine "
                  "\n\u2756 Frequent, urgent, or painful urination "
                  "\n\u2756 Leaking of urine (incontinence)"
                  "\n\u2756 Discharge from the urethra",
              isTop: true),
          // ElevatedButton(
          //     child: IconButton(onPressed: null, icon: Icon(Icons.explore_rounded)
          //     )
          // )

          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const WebViewMap()));
            },
            // child: Container(),
            icon: const Icon(Icons.explore_rounded),
            label: const Text("Nearby Doctors"),
          ),

          // CustomCardText(
          //   headingValue: "Nearby Hospitals",
          //   textValue: "\n\u2756 Apollo Hospitals: +91-44-28290200"
          //       "\n\u2756 Medanta the Medicity: +91-124-4141414"
          //       "\n\u2756 Fortis Healthcare: +91-11-49343536"
          //       "\n\u2756 Coimbatore Kidney Centre: +91-422-2312000"
          //       "\n\u2756 Prema Hospital: +91-422-2361000"
          //       "\n\u2756 AIIMS Hospital: +91-11-26588500"
          //       "\n\u2756 Lions Kidney Hospitals: +91-11-42258494"
          //       "\n\u2756 B.K.Kidney & G.I.Centre: +91-22-28094040"
          //       "\n\u2756 Apex Kidney Care: +91-22-61538888"
          //       "\n\u2756 Manipal Hospitals: +91-80-25024444",
          // ),
        ],
      ),
    );
  }
}
