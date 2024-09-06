import 'package:flutter/material.dart';

class AnnouncementBox extends StatelessWidget {
  final String announcement;

  const AnnouncementBox({
    Key? key,
    required this.announcement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 120,
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        announcement,
        style: TextStyle(color: Colors.black, fontSize: 15),
      ),
    );
  }
}
