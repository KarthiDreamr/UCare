import 'package:flutter/material.dart';
import 'package:ucare/Components/custom_bottom_sheet.dart';
import 'package:ucare/Components/custom_card_text.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomCardText(
              headingValue: "Doctor Recommendation",
              textValue: "\n- Contact your doctor soon after symptoms"
                  "\n- Take antibiotics to treat urinary tract infections"
                  "\n- Drink water to prevent dehydration"
                  "\n- Use a heating pad to relieve pain "
                  "\n- Avoid caffeine, alcohol and spicy foods"
                  "\n- Abdominal, pelvic, or lower back pain  "
                  "\n- Blood in the urine (hematuria) "
                  "\n- Difficulty producing the urine "
                  "\n- Frequent, urgent, or painful urination "
                  "\n- Leaking of urine (incontinence)"
                  "\n- Discharge from the urethra",
              isTop: true),
          CustomCardText(
            headingValue: "Nearby Hospitals",
            textValue: "\n- Apollo Hospitals: +91-44-28290200 "
                "\n- Medanta the Medicity: +91-124-4141414"
                "\n- Fortis Healthcare: +91-11-49343536"
                "\n- Coimbatore Kidney Centre: +91-422-2312000 "
                "\n- Prema Hospital: +91-422-2361000  "
                "\n- AIIMS Hospital: +91-11-26588500"
                "\n- Lions Kidney Hospitals: +91-11-42258494 "
                "\n- B.K.Kidney & G.I.Centre: +91-22-28094040"
                "\n- Apex Kidney Care: +91-22-61538888"
                "\n- Manipal Hospitals: +91-80-25024444 ",
          ),
          CustomBottomSheet()
        ],
      ),
    );
  }
}
