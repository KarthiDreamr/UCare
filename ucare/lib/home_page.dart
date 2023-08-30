import 'package:flutter/material.dart';
import 'package:ucare/page1.dart';
import 'package:ucare/page3.dart';
import 'package:ucare/page2.dart';
import 'package:ucare/page4.dart';
import 'package:ucare/page5.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavigationDrawer(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Header',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const NavigationDrawerDestination(icon: Icon(Icons.explore), label: Text("Home")),
          const NavigationDrawerDestination(icon: Icon(Icons.settings), label: Text("Settings")),
          const NavigationDrawerDestination(icon: Icon(Icons.logout), label: Text("Logout")),
          const NavigationDrawerDestination(icon: Icon(Icons.monitor_heart_outlined), label: Text("Login")),
        ],
      ) ,
      backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text("UCare"),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: <Widget>[
          const Page1(),
          const Page2(),
          const Page3(),
          const Page4(),
          const Page5()
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
              icon: Icon(Icons.dashboard),
              selectedIcon: Icon(Icons.dashboard_outlined),
              label: 'Explore',
            ),
            NavigationDestination(
              icon: Icon(Icons.query_stats),
              selectedIcon: Icon(Icons.query_stats),
              label: 'Stats',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.monitor_heart),
              icon: Icon(Icons.monitor_heart_outlined),
              label: 'Health',
            ),
            NavigationDestination(
              icon: Icon(Icons.assistant),
              selectedIcon: Icon(Icons.assistant_outlined),
              label: 'Assistance',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.more_horiz),
              icon: Icon(Icons.more_horiz_outlined),
              label: 'More',
            ),
          ],
        ));
  }
}