import 'package:flutter/material.dart';
import 'package:managment_app/Themes/themes.dart';
import 'package:managment_app/utilities/constants/images_const.dart';
import 'package:managment_app/utilities/constants/text_strings.dart';

class Logoutbutton extends StatelessWidget {
  final VoidCallback onPressed;


  const Logoutbutton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          backgroundColor: theme.darkBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          elevation: 10,
          shadowColor: Colors.black,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              Text_string.logoutButton,
              style: theme.kBodyTextStyle.copyWith(
                color: Colors.red
              )
            ),
            const SizedBox(width: 30),
            Image.asset(
              KImages.backIcon,
              height: 20,
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
