import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:student_record/controllers/search_controller.dart';
import '../DB/model/datamodel.dart';
import 'StudentDetails.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final _searchController = TextEditingController();

  SearchController search = SearchController();

  //= List<StudentModel>.from(studentList);
  Widget expanded() {
    return GetBuilder(
        init: search,
        builder: (controller) {
          return Expanded(
            child: search.studentDisplay.isNotEmpty
                ? ListView.builder(
                    itemCount: search.studentDisplay.length,
                    itemBuilder: (context, index) {
                      File img = File(search.studentDisplay[index].image);
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: img.path == 'x'
                              ? AssetImage('assets/profilePic.png')
                              : FileImage(img) as ImageProvider,
                          radius: 22,
                        ),
                        title: Text(search.studentDisplay[index].name),
                        onTap: (() {
                          
                          Get.to(StudentDetails(studentdetails: search.studentDisplay[index]));
                        }),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'No results found',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
          );
        });
  }

  Widget searchTextField() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      decoration:
          InputDecoration(labelText: 'Search', suffixIcon: Icon(Icons.search)),
      onChanged: (value) {
        search.searchStudent(value);
      },
    );
  }


  void clearText() {
    _searchController.clear();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            searchTextField(),
            expanded(),
          ],
        ),
      ),
    );
  }
}
