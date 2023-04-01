import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../model/datamodel.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

addStudent(StudentModel student) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentDB.add(student);
  // studentListNotifier.value.add(student);
  // studentListNotifier.notifyListeners();
  getAllStudents();
}

deleteStudent(int index) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentDB.deleteAt(index);
  // studentListNotifier.value.removeAt(index);
  // studentListNotifier.notifyListeners();
  getAllStudents();
}

updateStudent(int index, StudentModel student) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentDB.putAt(index, student);
  // studentListNotifier.value.removeAt(index);
  // studentListNotifier.value.insert(index, student);
  // studentListNotifier.notifyListeners();
  getAllStudents();
}

getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}
