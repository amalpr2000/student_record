import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:student_record/DB/model/datamodel.dart';
import 'package:student_record/controllers/edit_controller.dart';

class StudentEdit extends StatelessWidget {
  StudentEdit({super.key, required this.student, required this.index});
  StudentModel student;
  int index;

  EditController edit = EditController();

  late final namecontroller = TextEditingController(text: student.name);

  late final agecontroller = TextEditingController(text: student.age);

  late final phonecontroller = TextEditingController(text: student.phone);

  late final emailcontroller = TextEditingController(text: student.email);

  @override
  Widget build(BuildContext context) {
    log(student.image);

    if (edit.imgPath == 'x') {
      edit.imgPath = student.image;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {
                    edit.imgUpdate();
                  },
                  child: GetBuilder(
                      init: edit,
                      builder: (controller) {
                        return CircleAvatar(
                          backgroundImage: edit.imgPath == 'x'
                              ? AssetImage('assets/profilePic.png')
                              : FileImage(File(edit.imgPath)) as ImageProvider,
                          radius: 70,
                        );
                      }),
                ),
                SizedBox(height: 30),
                Form(
                  child: TextFormField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.person),
                        fillColor: Color.fromARGB(255, 239, 238, 238),
                        border: OutlineInputBorder(),
                        label: Text('Name'),
                        helperText: '',
                        hintText: 'Enter the name'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          controller: agecontroller,
                          maxLength: 2,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              counterText: "",
                              filled: true,
                              fillColor: Color.fromARGB(255, 239, 238, 238),
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.calendar_month_outlined),
                              label: Text('Age'),
                              helperText: '',
                              hintText: 'Age'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: phonecontroller,
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          decoration: InputDecoration(
                              counterText: "",
                              filled: true,
                              prefixIcon: Icon(Icons.phone),
                              fillColor: Color.fromARGB(255, 239, 238, 238),
                              border: OutlineInputBorder(),
                              label: Text('Phone'),
                              helperText: '',
                              hintText: 'Enter your number'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                  child: TextFormField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 239, 238, 238),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email_outlined),
                        label: Text('Email'),
                        helperText: '',
                        hintText: 'Enter your email'),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 80,
                      child: ElevatedButton(
                          onPressed: (() {
                            if (namecontroller.text != '' &&
                                agecontroller.text != '' &&
                                emailcontroller.text != '' &&
                                phonecontroller.text != '') {
                              final student = StudentModel(
                                name: namecontroller.text.trim(),
                                age: agecontroller.text.trim(),
                                phone: phonecontroller.text.trim(),
                                email: emailcontroller.text.trim(),
                                image: edit.imgPath,
                              );
                             
                              edit.updateStudent(index, student);

                              Get.back();
                            }
                          }),
                          child: Text(
                            'Update',
                          )),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    SizedBox(
                      width: 80,
                      child: ElevatedButton(
                          onPressed: (() {
                            Get.back();
                          }),
                          child: Text(
                            'Cancel',
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
