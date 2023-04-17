import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:students_app/model/data_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.add(value);
  studentListNotifier.value.add(value);

  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  studentListNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);

  // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int index) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.deleteAt(index);
  getAllStudents();
}
