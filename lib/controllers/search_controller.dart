import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../DB/model/datamodel.dart';

class SearchController extends GetxController {
  List<StudentModel> studentList =
      Hive.box<StudentModel>('student_db').values.toList();

  late List<StudentModel> studentDisplay = List<StudentModel>.from(studentList);

  void searchStudent(String value) {
    // setState(() {

    studentDisplay = studentList
        .where((element) =>
            element.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    update();
    // });
  }
}
