import 'package:flutter/material.dart';
import 'package:students_app/functions/db_functions.dart';
import 'package:students_app/model/data_model.dart';
import 'package:students_app/screens/home/screen_home.dart';

class AddStudentWidget extends StatelessWidget {
  AddStudentWidget({super.key});

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _courseController = TextEditingController();
  final _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 52),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Name',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: _ageController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Age',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _courseController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Course',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: _mobileController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Phone',
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
              onAddStudentButtonClicked(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green[600]),
            ),
            icon: const Icon(Icons.check_rounded),
            label: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  Future<void> onAddStudentButtonClicked(BuildContext ctx) async {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    final course = _courseController.text.trim();
    final mobile = _mobileController.text.trim();
    if (name.isEmpty || age.isEmpty || course.isEmpty || mobile.isEmpty) {
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          backgroundColor: Colors.grey,
          content: Text('please enter a value'),
        ),
      );
      return;
    }
    final student =
        StudentModel(name: name, age: age, course: course, mobile: mobile);

    addStudent(student);

    ScaffoldMessenger.of(ctx).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        backgroundColor: Colors.grey,
        content: Text('Student details added'),
      ),
    );
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => const ScreenHome()),
        (route) => false);
  }
}
