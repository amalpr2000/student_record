import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_record/DB/dbfunctions/dbfunctions.dart';

import '../DB/model/datamodel.dart';

RxList<StudentModel> list = <StudentModel>[].obs;

class AddController extends GetxController {
  final formkey1 = GlobalKey<FormState>();
  final formkey2 = GlobalKey<FormState>();
  final formkey3 = GlobalKey<FormState>();
  String imgPath = 'x';
  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final emailcontroller = TextEditingController();

  Future<void> pickPhotoFromGallery() async {
    final PickedImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (PickedImg != null) {
      imgPath = PickedImg.path;
    }
    update();
  }

  addStudent() async {
    if (formkey1.currentState!.validate() &&
        formkey2.currentState!.validate() &&
        formkey3.currentState!.validate()) {
      final student = StudentModel(
        name: namecontroller.text.trim(),
        age: agecontroller.text.trim(),
        phone: phonecontroller.text.trim(),
        email: emailcontroller.text.trim(),
        image: imgPath,
      );
      final studentDB = await Hive.openBox<StudentModel>('student_db');
      studentDB.add(student);
      getAllStudents();
    }
  }
}
