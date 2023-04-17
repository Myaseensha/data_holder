import 'package:hive_flutter/hive_flutter.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String age;

  @HiveField(2)
  final String course;

  @HiveField(3)
  final String mobile;

  StudentModel({
    required this.name,
    required this.age,
    required this.course,
    required this.mobile,
  });
}
