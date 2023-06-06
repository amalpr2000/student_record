import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_record/controllers/add_controller.dart';

class StudentAdd extends StatelessWidget {
  StudentAdd({super.key});

  AddController ad = AddController();

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
                  child: GetBuilder(
                      init: ad,
                      builder: (controller) {
                        return CircleAvatar(
                          radius: 75,
                          backgroundImage: ad.imgPath == 'x'
                              ? AssetImage('assets/profilePic.png')
                                  as ImageProvider
                              : FileImage(File(ad.imgPath)),
                        );
                      }),
                  onTap: () {
                    ad.pickPhotoFromGallery();
                  },
                ),
                SizedBox(height: 30),
                Form(
                  key: ad.formkey1,
                  child: TextFormField(
                    controller: ad.namecontroller,
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
                  key: ad.formkey2,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          controller: ad.agecontroller,
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
                          controller: ad.phonecontroller,
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
                  key: ad.formkey3,
                  child: TextFormField(
                    controller: ad.emailcontroller,
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
                            ad.addStudent();
                            Get.back();
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
