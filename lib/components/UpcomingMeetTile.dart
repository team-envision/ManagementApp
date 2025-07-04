import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';
import 'package:managment_app/utilities/constants/icons_const.dart';

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
          color: Get.theme.lightBlue,
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
                  style: Get.theme.kAnnouncementTextStyle,
                ),
                Icon(
                  isExpanded ? KIcons.expandLess : KIcons.expandCircleDown,
                  color: theme.darkBlue,
                  size: 40,
                ),
              ],
            ),
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  widget.details,
                  style: Get.theme.kAnnouncementTextStyle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
