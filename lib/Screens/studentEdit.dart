import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_record/DB/dbfunctions/dbfunctions.dart';
import 'package:student_record/DB/model/datamodel.dart';

class StudentEdit extends StatefulWidget {
  StudentEdit({super.key, required this.student, required this.index});
  StudentModel student;
  int index;

  @override
  State<StudentEdit> createState() => _StudentEditState();
}

class _StudentEditState extends State<StudentEdit> {
  String imgPath = 'x';
  late final namecontroller = TextEditingController(text: widget.student.name);

  late final agecontroller = TextEditingController(text: widget.student.age);

  late final phonecontroller =
      TextEditingController(text: widget.student.phone);

  late final emailcontroller =
      TextEditingController(text: widget.student.email);

  @override
  Widget build(BuildContext context) {
    log(widget.student.image);

    if (imgPath == 'x') {
      imgPath = widget.student.image;
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
                  onTap: () async {
                    final pickedImg = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);

                    if (pickedImg != null) {
                      setState(() {
                        imgPath = pickedImg.path;
                      });
                    }
                  },
                  child: CircleAvatar(
                    backgroundImage: imgPath == 'x'
                        ? AssetImage('assets/profilePic.png')
                        : FileImage(File(imgPath)) as ImageProvider,
                    radius: 70,
                  ),
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
                                  image: imgPath,
                                  );
                              updateStudent(widget.index, student);

                              Navigator.of(context).pop();
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
                            Navigator.of(context).pop();
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

  // backImage() {
  //   if (imgPath == null && widget.student.image == 'x') {
  //     return const AssetImage('assets/profilePic.png');
  //   } else if (imgPath != null && widget.student.image != 'x') {
  //     return FileImage(File(imgPath));
  //   } else if (imgPath == null && widget.student.image != 'x') {
  //     return FileImage(File(widget.student.image!));
  //   } else {
  //     return FileImage(File(imgPath));
  //   }
  // }
}
