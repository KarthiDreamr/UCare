import 'package:flutter/material.dart';

class CustomCardText extends StatelessWidget {
   const CustomCardText({super.key,required this.textValue,this.headingValue});

   final String textValue;
   final String? headingValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      child: Expanded(
        child: SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 4,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    (headingValue != null) ? Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                          headingValue!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ):Container(),
                    Text(
                      textValue
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}














// "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
// " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
// "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi "
// "ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit "
// "in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur "
// "sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt "
// " Amet risus nullam eget felis. Odio pellentesque diam volutpat commodo sed "
// "egestas egestas. Platea dictumst quisque sagittis purus sit amet volutpat "
// "consequat mauris. Ultrices in iaculis nunc sed augue lacus."
// "Platea dictumst quisque sagittis purus sit amet volutpat"