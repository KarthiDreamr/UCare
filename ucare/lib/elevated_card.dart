import 'package:flutter/material.dart';

class ElevatedCard extends StatelessWidget {
  const ElevatedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        child: SizedBox(
          width: 350,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
              " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
              "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi "
              "ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit "
              "in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur "
              "sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt "
              " Amet risus nullam eget felis. Odio pellentesque diam volutpat commodo sed "
              "egestas egestas. Platea dictumst quisque sagittis purus sit amet volutpat "
              "consequat mauris. Ultrices in iaculis nunc sed augue lacus."
              "consequat mauris. Ultrices in iaculis nunc sed augue lacus."
            ),
          )
        ),
      ),
    );
  }
}