import 'package:flutter/material.dart';
import 'package:managment_app/Themes/themes.dart';

class Settingbutton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const Settingbutton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        backgroundColor: theme.colorLevel1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: Colors.black,
            width: 1.0
          )
        ),
      ),

      onPressed: () {},
      child: Text(
       title,
       style: theme.kSubTitleTextStyle,
      ),

    );
  }
}
