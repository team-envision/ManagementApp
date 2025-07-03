import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_app/app/modules/home/views/home_view.dart';
import 'package:managment_app/app/routes/app_pages.dart';
import 'package:managment_app/utilities/constants/icons_const.dart';
import 'package:managment_app/utilities/constants/images_const.dart';
import '../../../../components/DatePickerField.dart';
import '../../../../components/Dropdown.dart';
import '../../../../components/TimePickerField.dart';
import 'package:managment_app/Themes/themes.dart';
import '../../../../utilities/constants/text_strings.dart';
import '../controllers/meetings_controller.dart';

class MeetingsView extends GetView<MeetingsController> {
  MeetingsView({super.key});

  @override
  final MeetingsController controller = Get.put(MeetingsController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.darkTeal,
      appBar: AppBar(
        title: Text(
          Text_string.meetsTitle,
          style: GoogleFonts.raleway(
            color: theme.fadedWhite,
            fontWeight: FontWeight.w600,
            fontSize: 26,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        backgroundColor: theme.darkBlue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(KIcons.iosBackArrow, color: theme.fadedWhite),
          onPressed: () {
            Get.offAllNamed(Routes.HOME);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [theme.darkBlue, theme.darkTeal],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Calendar Icon
                Container(
                  width: 150,
                  height: 150,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SvgPicture.asset(
                    KImages.calendar,
                    width: 100,
                    height: 100,
                    color: theme.brightCyan,
                  ),
                ),
                const SizedBox(height: 20),

                Container(
                  width: Get.width * 0.8,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Get.theme.darkTeal,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: theme.deepBlack,
                        spreadRadius: 2,
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomDropdownButton(
                        hintText: Text_string.domainHint,
                        options: domainOptions,
                        selectedValue: controller.domainSelectedValue,
                      ),
                      CustomDropdownButton(
                        hintText: Text_string.forHint,
                        options: forOptions,
                        selectedValue: controller.forSelectedValue,
                      ),
                      DatePickerField(
                        hintText: Text_string.dateHint,
                        selectedDate: controller.selectedDate,
                        onDateChanged: (date) =>
                            controller.selectedDate.value = date,
                      ),
                      TimePickerField(
                        hintText: Text_string.timeHint,
                        selectedTime: controller.selectedTime,
                        onTimeChanged: (time) =>
                            controller.selectedTime.value = time,
                      ),
                      CustomDropdownButton(
                        hintText: Text_string.modeHint,
                        options: modeOptions,
                        selectedValue: controller.modeSelectedValue,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    controller.showDescriptionDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.brightCyan,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    Text_string.addMeetingDescriptionButton,
                    style: theme.kSmallTextStyle,
                  ),
                ),
                const SizedBox(height: 20),

                Obx(() {
                  return controller.description.value.isEmpty
                      ? Container()
                      : Text(
                          controller.description.value,
                          textAlign: TextAlign.center,
                          style: theme.kSmallTextStyle.copyWith(fontSize: 16),
                        );
                }),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Get.snackbar(
                      'Reminder Sent',
                      'Meeting reminder has been sent successfully!',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Get.theme.lighterGrey,
                      colorText: Get.theme.pureBlack,
                      icon: Icon(KIcons.checkCircle, color: Get.theme.primaryGreen),
                      margin: const EdgeInsets.all(10),
                      duration: const Duration(seconds: 2),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Get.theme.lightBlue,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        Text_string.sendReminderButton,
                        style: GoogleFonts.raleway(
                          color: Get.theme.darkGrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(KIcons.activeNotification, color: Get.theme.darkGrey),
                    ],
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
