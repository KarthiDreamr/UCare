import 'package:flutter/material.dart';
import 'package:ucare/page1.dart';
import 'package:ucare/page2.dart';
import 'carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF69F0E5),
        appBar: AppBar(
          title: const Text("UCare"),
          backgroundColor: const Color(0xDB6BFC0B),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),

                onTap: () {
                  setState(() {
                    currentPageIndex = 0;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  setState(() {
                    currentPageIndex = 1;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 3'),
                onTap: () {
                  setState(() {
                    currentPageIndex = 2;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 4'),
                onTap: () {
                  setState(() {
                    currentPageIndex = 3;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 5'),
                onTap: () {
                  setState(() {
                    currentPageIndex = 4;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: <Widget>[
          const Page1(),
          const Page2(),
          Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text('Page 3'),
          ),
          Container(
            color: Colors.yellow,
            alignment: Alignment.center,
            child: const Text('Page 4'),
          ),
          Container(
            color: Colors.pinkAccent,
            alignment: Alignment.center,
            child: const Text('Page 5'),
          ),
        ][currentPageIndex],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            NavigationDestination(
              icon: Icon(Icons.commute),
              label: 'Commute',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.bookmark),
              icon: Icon(Icons.bookmark_border),
              label: 'Saved',
            ),
            NavigationDestination(
              icon: Icon(Icons.call),
              label: 'Commute',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.more),
              icon: Icon(Icons.more_outlined),
              label: 'Saved',
            ),
          ],
        ));
  }
}