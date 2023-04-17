import 'package:flutter/material.dart';
import 'package:students_app/screens/home/student_input.dart';
import 'package:students_app/screens/widgets/list_student_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.green[800],
        title: const Text(
          'Student List',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 20),
            iconSize: 30,
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const SafeArea(
        child: ListStudentWidget(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const StudentInput()),
          );
        },
        backgroundColor: Colors.green[800],
        child: const Icon(Icons.account_circle_sharp),
      ),
    );
  }
}
