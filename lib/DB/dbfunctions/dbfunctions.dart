import 'package:hive_flutter/adapters.dart';
import 'package:student_record/controllers/add_controller.dart';

import '../model/datamodel.dart';

getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  list.clear();
  list.addAll(studentDB.values);
}
