import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_record/DB/model/datamodel.dart';

class StudentDetails extends StatelessWidget {
  StudentDetails({super.key, required this.studentdetails});
  StudentModel studentdetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              backgroundImage: studentdetails.image == 'x'
                  ? AssetImage('assets/profilePic.png')
                  : FileImage(File(studentdetails.image)) as ImageProvider,
              radius: 120,
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    'Name',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    ':',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: Text(
                    studentdetails.name,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    'Age',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    ':',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: Text(
                    studentdetails.age,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    'Phone',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    ':',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: Text(
                    studentdetails.phone,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    'Email',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    ':',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: Text(
                    studentdetails.email,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                )
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
