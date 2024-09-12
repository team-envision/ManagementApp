import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_app/Themes/themes.dart';

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
          backgroundColor: theme.colorLevel1,
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
              'Logout',
              style: GoogleFonts.raleway(
                color: Colors.red,
                fontSize: 15,
              ),
            ),
            const SizedBox(width: 30),
            Image.asset(
              'assets/images/icon.png',
              height: 20,
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
