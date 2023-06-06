import 'dart:io';

import 'package:flutter/material.dart';

import 'package:student_record/DB/dbfunctions/dbfunctions.dart';

import 'package:student_record/Screens/StudentAdd.dart';
import 'package:student_record/Screens/Studentdetails.dart';
import 'package:student_record/Screens/search.dart';
import 'package:student_record/Screens/studentEdit.dart';
import 'package:get/get.dart';

import 'package:student_record/controllers/add_controller.dart';
import 'package:student_record/controllers/delete_controller.dart';

class homePage extends StatelessWidget {
  homePage({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();

    return Scaffold(
        appBar: AppBar(
          title: Text('Student List'),
          actions: [
            IconButton(
                onPressed: (() {
                  Get.to(SearchScreen());
                }),
                icon: Icon(Icons.search))
          ],
        ),
        body: StudentListView(),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            Get.to(StudentAdd());
          }),
          tooltip: 'Add Student',
          child: const Icon(Icons.person_add),
        ));
  }
}

class StudentListView extends StatelessWidget {
  StudentListView({super.key});

  final obj = AddController();
  final del = DeleteController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                contentPadding: EdgeInsets.all(15),
                tileColor: Colors.indigo.shade100,
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: ((context) => StudentDetails(
                  //           studentdetails: list[index],
                  //         ))));
                  Get.to(StudentDetails(studentdetails: list[index]));
                },
                title: Text(list[index].name),
                leading: GestureDetector(
                  onTap: () => showprofile(context, list[index].image),
                  child: CircleAvatar(
                    backgroundImage: list[index].image == 'x'
                        ? AssetImage('assets/profilePic.png') as ImageProvider
                        : FileImage(File(list[index].image)),
                    radius: 30,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: (() {
                        
                        Get.to(StudentEdit(student: list[index], index: index));
                      }),
                      icon: Icon(
                        Icons.edit,
                        color: Colors.indigo,
                        size: 25,
                      ),
                    ),
                    IconButton(
                      onPressed: (() {
                        del.deleteStudent(index);
                      }),
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 25,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
          separatorBuilder: ((context, index) {
            return SizedBox(
              height: 0,
            );
          }),
          itemCount: list.length),
    );
  }

  showprofile(BuildContext context, String studentImage) {
    showDialog(
        context: context,
        builder: ((ctx) {
          return AlertDialog(
              title: Image(
            image: studentImage == 'x'
                ? AssetImage('assets/profilePic.png') as ImageProvider
                : FileImage(File(studentImage)),
          ));
        }));
  }
}
