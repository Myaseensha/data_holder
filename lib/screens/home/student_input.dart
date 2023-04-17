import 'package:flutter/material.dart';
import 'package:students_app/functions/db_functions.dart';

import '../widgets/add_student_widget.dart';

class StudentInput extends StatelessWidget {
  const StudentInput({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AddStudentWidget(),
        ],
      )),
    );
  }
}
