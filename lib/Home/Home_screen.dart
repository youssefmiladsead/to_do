import 'dart:js';

import 'package:flutter/material.dart';
import 'package:todo/List/task_List.dart';
import 'package:todo/List/add_task_bottom_sheet.dart';
import 'package:todo/settings/settings.dart';

class HomeScreen extends StatefulWidget {
  static const String rountname = 'Home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
          Text("ToDo List ", style: Theme
              .of(context)
              .textTheme
              .titleLarge),
        ),
        body: tabs[selectedindex],
        floatingActionButton: FloatingActionButton(
          shape: StadiumBorder(
            side: BorderSide(
                color: Colors.white,
                width: 5
            ),
          ),
          onPressed: () {
            ShowAddTaskBottomShett(context);
          },
          child: Icon(Icons.add, size: 30),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: BottomNavigationBar(
            currentIndex: selectedindex,
            onTap: (index) {
              // اللي المستخدم دايس عليه index
              selectedindex = index;
              setState(() {

              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        )
    );
  }


  List<Widget> tabs = [
    TaskListTab(),
    SettingsTab(),
  ];


  void ShowAddTaskBottomShett(BuildContext context) {
    showModalBottomSheet(
        context:context, builder: (context) => add_task_bottom_sheet()
    );
  }}


