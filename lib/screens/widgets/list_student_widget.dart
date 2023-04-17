import 'package:flutter/material.dart';
import 'package:students_app/functions/db_functions.dart';
import 'package:students_app/screens/widgets/update.dart';
import '../../model/data_model.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            return Card(
              color: Colors.green[600],
              margin: const EdgeInsets.only(
                right: 10,
                left: 10,
                top: 10,
              ),
              shadowColor: Colors.grey[50],
              elevation: 10,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('lib/image/p.png'),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DisplayDetail(
                                index: index,
                                model: data,
                                age: data.age,
                                course: data.course,
                                name: data.name,
                                mobile: data.mobile,
                              )));
                },
                title: Text(
                  data.name,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                trailing: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      deleteStudent(index);
                    },
                    icon: const Icon(
                      Icons.delete_rounded,
                    )),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: studentList.length,
        );
      },
    );
  }
}
