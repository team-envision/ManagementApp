import 'package:flutter/material.dart';
import 'package:managment_app/Themes/themes.dart';

class UpcomingMeetTile extends StatefulWidget {
  final String title;
  final String details;
  const UpcomingMeetTile({
    Key? key,
    required this.title,
    required this.details,
  }) : super(key: key);

  @override
  _UpcomingMeetTileState createState() => _UpcomingMeetTileState();
}

class _UpcomingMeetTileState extends State<UpcomingMeetTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(top: 8.0),
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_circle_down,
                  color: theme.colorLevel1,
                  size: 40,
                ),
              ],
            ),
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  widget.details,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
