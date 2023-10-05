import 'package:flutter/material.dart';

class CustomCardText extends StatelessWidget {
   const CustomCardText({super.key,required this.textValue,this.headingValue,this.isTop});

   final String textValue;
   final String? headingValue;
   final bool? isTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (isTop==true)?const EdgeInsets.only(left: 12,right: 12,bottom: 10,top: 10):const EdgeInsets.only(left: 12,right: 12,bottom: 10),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: Theme.of(context).colorScheme.secondaryContainer,
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
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary
                        ),
                    ),
                  ):Container(),
                  Text(
                    textValue,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary
                    ),
                  ),
                ],
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