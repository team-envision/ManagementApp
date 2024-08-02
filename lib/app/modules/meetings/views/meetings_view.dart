import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/DatePickerField.dart';
import '../components/Dropdown.dart';
import '../components/TimePickerField.dart';
import '../controllers/meetings_controller.dart';
import 'package:managment_app/Themes/themes.dart';


class MeetingsView extends GetView<MeetingsController> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Color(0xFF094454),
      appBar: AppBar(
        title: Text(
          'MEETS',
          style: GoogleFonts.raleway(
            color: theme.colorLevel4,
            fontWeight: FontWeight.w600,
            fontSize: 26,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        backgroundColor: theme.colorLevel1,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [theme.colorLevel1, theme.colorLevel2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SvgPicture.asset(
                    'lib/app/modules/meetings/assets/calender.svg',
                    width: 100,
                    height: 100,
                    color: theme.colorPrimary,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: screenWidth * 0.8,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF094454),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(color: theme.colorLevel0, spreadRadius: 2, blurRadius: 4)],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomDropdownButton(
                        hintText: 'DOMAIN',
                        options: domainOptions,
                        selectedValue: controller.domainSelectedValue,
                      ),
                      CustomDropdownButton(
                        hintText: 'FOR',
                        options: forOptions,
                        selectedValue: controller.forSelectedValue,
                      ),
                      DatePickerField(
                        hintText: 'DATE',
                        selectedDate: controller.selectedDate,
                        onDateChanged: (date) => controller.selectedDate.value = date,
                      ),
                      TimePickerField(
                        hintText: 'TIME',
                        selectedTime: controller.selectedTime,
                        onTimeChanged: (time) => controller.selectedTime.value = time,
                      ),
                      CustomDropdownButton(
                        hintText: 'MODE',
                        options: modeOptions,
                        selectedValue: controller.modeSelectedValue,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 5.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'ADD MEETING DESCRIPTION',
                      style: theme.kSmallTextStyle,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorPrimary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 5.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Send Reminder', style: GoogleFonts.raleway(color: Colors.grey[700], fontSize: 12,fontWeight: FontWeight.w600)),
                        SizedBox(width: 8),
                        Icon(Icons.notifications_active, color: Colors.grey[700]),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[100],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


