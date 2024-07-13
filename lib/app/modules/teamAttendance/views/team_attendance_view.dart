import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';

import '../controllers/team_attendance_controller.dart';

class TeamAttendanceView extends GetView<TeamAttendanceController> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {},
          ),
          backgroundColor: Color(0xFF002431),
          title: Text('MY TEAM',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                height: 1,
              )),
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFF002431),
                    Color(0xFF094454),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.2, 1.0]
              )
          ),
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child:  Container(
                            decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: ExpansionTile(
                                tilePadding: EdgeInsets.all(8.0),
                                collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                title: Text('Name : ', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white,height: 1,)),
                                backgroundColor: Colors.black87,
                                collapsedBackgroundColor: Colors.black87,
                                leading: CircleAvatar(backgroundColor: Colors.white,),
                                iconColor: Colors.white,
                                children: [
                                  ListTile(title: Text('ID No. :')),
                                  ListTile(title: Text('Domain :')),
                                  ListTile(title: Text('Total meets conducted :')),
                                  ListTile(title: Text('No. of meets attended :')),
                                  ListTile(title: Text('No. of absences :')),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },)
              )
            ],
          ),
        ),
    );
  }
}
