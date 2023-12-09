import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ucare/authentication/auth_screen.dart';
import 'package:ucare/bottom_nav_screens/explore_page1.dart';
import 'package:ucare/bottom_nav_screens/stats_page2.dart';
import 'package:ucare/bottom_nav_screens/health_page3.dart';
import 'package:ucare/bottom_nav_screens/assistance_page4.dart';
import 'package:ucare/bottom_nav_screens/settings_overlay_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 2;

  void firebaseSignOut()  {
     FirebaseAuth.instance.signOut();
  }

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
          const NavigationDrawerDestination(
              icon: Icon(Icons.explore), label: Text("Home")
          ),
          const NavigationDrawerDestination(
              icon: Icon(Icons.settings), label: Text("Settings")
          ),
          const NavigationDrawerDestination(
              icon: Icon(Icons.logout), label: Text("Logout")
          ),
          const NavigationDrawerDestination(
              icon: Icon(Icons.monitor_heart_outlined), label: Text("Login")
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("UCare"),
          actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: ()
                {
                  firebaseSignOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const AuthScreen()
                      ),
                          (route) => false);
                },
              )
            ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SafeArea(
          child: <Widget>[
        const Page1(),
        const Page2(),
        const Page3(),
        const Page4(),
            Page5()
      ][currentPageIndex]),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), // Adjust the value as needed
            topRight: Radius.circular(15), // Adjust the value as needed
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), // Adjust the value as needed
            topRight: Radius.circular(15), // Adjust the value as needed
          ),
          child: NavigationBar(
            onDestinationSelected: (int index) {
              if(index==4){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Page5(),
                  ),
                );
                return;
              }
              setState(() {
                currentPageIndex = index;
              });
            },
            backgroundColor: Theme.of(context).colorScheme.primary,
            surfaceTintColor: Theme.of(context).colorScheme.primaryContainer,
            indicatorColor: Theme.of(context).colorScheme.onPrimary,
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
          ),
        ),
      ),
    );
  }
}
