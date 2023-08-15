import 'package:flutter/material.dart';
import 'package:habiter/pages/create_plan_page.dart';
import 'package:habiter/pages/notifications_page.dart';
import 'package:habiter/pages/progress_page.dart';
import 'package:habiter/pages/settings_page.dart';
import 'package:habiter/pages/today_plan_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const TodayTab(),
    const ProgressPage(),
    const NotificationsPage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreatePage()));
        },
        tooltip: 'Add Plan',
        backgroundColor: const Color(0xffFFBD59),
        child: const Icon(Icons.add, color: Colors.black),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 4,
        shape: const CircularNotchedRectangle(),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          TextButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              child: const Text(
                "Today",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          IconButton(
              padding: const EdgeInsets.only(right: 40),
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
              icon: const Icon(
                Icons.electric_bolt,
                color: Colors.black26,
              )),
          IconButton(
              padding: const EdgeInsets.only(left: 20),
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.black26,
              )),
          IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.black26,
              )),
        ]),
      ),
      body: _pages[_currentIndex],
    );
  }
}
