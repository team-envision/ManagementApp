import 'package:flutter/material.dart';

class MeetsConductedTile extends StatelessWidget {
  final String title;
  final VoidCallback OnUpdateAttendance;


  const MeetsConductedTile({
    Key?key,
    required this.title,
    required this.OnUpdateAttendance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     width: double.infinity,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius:  BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.black,
              fontSize: 15,
            ),
          ),
          ConstrainedBox(constraints: BoxConstraints.tightFor(
           width: 101,
            height: 40,
          ),
          child : ElevatedButton(onPressed: OnUpdateAttendance,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
                ),
                side: BorderSide(width: 1, color: Colors.black),
                backgroundColor: Colors.blue[100],
              ),
              child: Center(
              child: Text('Update\nAttendance', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 10))),))
        ],
      )

    );
  }



}