import 'package:flutter/material.dart';

class Page5 extends StatelessWidget {
   Page5({super.key});

  late BuildContext localContext;

  Card customIconCard(IconData iconData) {

    return Card(
      color: Theme.of(localContext).colorScheme.primaryContainer,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.all(20),
      child: IconButton(
        iconSize: 80,
        onPressed: null,
        icon: Icon(
          iconData,
          color: Theme.of(localContext).colorScheme.primary,
          size: 80,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    localContext = context;

    return Scaffold(
      appBar: AppBar(
        // TODO: add a close button
        title: const Text("Settings"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          customIconCard(
            Icons.account_circle
          ),
          customIconCard(
              Icons.storage
          ),
          customIconCard(
              Icons.local_hospital
          ),
          customIconCard(
              Icons.settings
          ),
          customIconCard(
              Icons.add_shopping_cart_outlined
          ),
          customIconCard(
              Icons.run_circle
          ),
        ],
      ),
    );
  }
}
