import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:students_app/functions/db_functions.dart';
import 'package:students_app/model/data_model.dart';

// ignore: must_be_immutable
class DisplayDetail extends StatefulWidget {
  DisplayDetail(
      {Key? key,
      required this.model,
      required this.index,
      required this.name,
      required this.age,
      required this.course,
      required this.mobile})
      : super(key: key);

  final StudentModel model;
  int index;
  final String name;
  final String age;
  final String course;
  final String mobile;

  @override
  State<DisplayDetail> createState() => _DisplayDetailState();
}

class _DisplayDetailState extends State<DisplayDetail> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController age;
  late TextEditingController course;
  late TextEditingController mobile;

  @override
  void initState() {
    name = TextEditingController(text: widget.name);
    age = TextEditingController(text: widget.age);
    course = TextEditingController(text: widget.course);
    mobile = TextEditingController(text: widget.mobile);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: const Text('Student Details'),
      ),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Name'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: age,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Age'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: course,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'course'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: mobile,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'mobile'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  update(context);
                },
                icon: const Icon(Icons.archive_rounded),
                label: const Text('Update'),
              )
            ],
          ),
        ),
      )),
    );
  }

  Future<void> update(ctx) async {
    final names = name.text.trim();
    final ages = age.text.trim();
    final courses = course.text.trim();
    final mobiles = mobile.text.trim();

    final student =
        StudentModel(name: names, age: ages, course: courses, mobile: mobiles);
    updateStudent(widget.index, student);

    ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        backgroundColor: Colors.grey,
        content: Text('Your data Succsesfully updated ')));
    Navigator.of(ctx).pop();
  }
}

Future<void> updateStudent(int index, StudentModel model) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  studentDb.putAt(index, model);
  await getAllStudents();
}
