import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_record/DB/dbfunctions/dbfunctions.dart';
import 'package:student_record/DB/model/datamodel.dart';

class StudentAdd extends StatefulWidget {
  StudentAdd({super.key});

  @override
  State<StudentAdd> createState() => _StudentAddState();
}

class _StudentAddState extends State<StudentAdd> {
  final formkey1 = GlobalKey<FormState>();
  final formkey2 = GlobalKey<FormState>();
  final formkey3 = GlobalKey<FormState>();
  String imgPath = 'x';
  final namecontroller = TextEditingController();

  final agecontroller = TextEditingController();

  final phonecontroller = TextEditingController();

  final emailcontroller = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
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
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: imgPath == 'x'
                        ? AssetImage('assets/profilePic.png') as ImageProvider
                        : FileImage(File(imgPath)),
                  ),
                  onTap: () {
                    pickPhotoFromGallery();
                  },
                ),
                SizedBox(height: 30),
                Form(
                  key: formkey1,
                  child: TextFormField(
                    controller: namecontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the name';
                      }
                    },
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
                  key: formkey2,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          controller: agecontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter age';
                            }
                          },
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter the phone Number';
                            }
                          },
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
                  key: formkey3,
                  child: TextFormField(
                    controller: emailcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the email';
                      }
                    },
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
                            if (formkey1.currentState!.validate() &&
                                formkey2.currentState!.validate() &&
                                formkey3.currentState!.validate()) {
                              print('object');
                              final student = StudentModel(
                                  name: namecontroller.text.trim(),
                                  age: agecontroller.text.trim(),
                                  phone: phonecontroller.text.trim(),
                                  email: emailcontroller.text.trim(),
                                  image: imgPath,
                                 );
                              addStudent(student);
                              log(imgPath);
                              Navigator.of(context).pop();
                            }
                          }),
                          child: Text(
                            'Save',
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

  Future<void> pickPhotoFromGallery() async {
    final PickedImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (PickedImg != null) {
      setState(() {
        imgPath = PickedImg.path;
      });
    }
  }
}
