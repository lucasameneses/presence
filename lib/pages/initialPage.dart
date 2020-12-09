import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence/pages/exitPage.dart';
import 'calendarPage.dart';
import 'entryPage.dart';
import 'insertPage.dart';
import '../stores/controller.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  RxInt indexWidget = Get.find<PresenceController>().indexWidget;
  final List<Widget> pages = [EntryPage(), CalendarPage(), ExitPage()];

  void onTabTapped(int index) {
    setState(() {
      indexWidget.value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Get.to(InsertPage());
              })
        ],
        title: Text('Presence'),
      ),
      body: pages[indexWidget.value],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: indexWidget.value,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Chegada',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Saida',
          )
        ],
      ),
    );
  }
}
