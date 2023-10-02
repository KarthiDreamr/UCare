import 'package:flutter/material.dart';

class Page5 extends StatelessWidget {
  const Page5({super.key});

  Card customIconCard(IconData iconData) {
    return Card(
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
          color: Colors.red,
          size: 80,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              Icons.rectangle
          ),
          customIconCard(
              Icons.local_hospital
          ),
          customIconCard(
              Icons.rectangle
          ),
        ],
      ),
    );
  }
}
