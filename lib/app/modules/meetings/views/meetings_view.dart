import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managment_app/app/modules/home/views/home_view.dart';
import 'package:managment_app/utilities/constants/images_const.dart';
import '../../../../components/DatePickerField.dart';
import '../../../../components/Dropdown.dart';
import '../../../../components/TimePickerField.dart';
import 'package:managment_app/Themes/themes.dart';
import '../../../../utilities/constants/strings.dart';
import '../controllers/meetings_controller.dart';

class MeetingsView extends GetView<MeetingsController> {
  MeetingsView({super.key});

  @override
  final MeetingsController controller = Get.put(MeetingsController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorLevel2,
      appBar: AppBar(
        title: Text(
          KStrings.meetsTitle,
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: theme.colorLevel4),
          onPressed: () {
            Get.offAll(() => const HomeView());
          },
        ),
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
                    color: theme.colorPrimary,
                  ),
                ),
                const SizedBox(height: 20),

                Container(
                  width: Get.width * 0.8,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF094454),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorLevel0,
                        spreadRadius: 2,
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomDropdownButton(
                        hintText: KStrings.domainHint,
                        options: domainOptions,
                        selectedValue: controller.domainSelectedValue,
                      ),
                      CustomDropdownButton(
                        hintText: KStrings.forHint,
                        options: forOptions,
                        selectedValue: controller.forSelectedValue,
                      ),
                      DatePickerField(
                        hintText: KStrings.dateHint,
                        selectedDate: controller.selectedDate,
                        onDateChanged: (date) =>
                            controller.selectedDate.value = date,
                      ),
                      TimePickerField(
                        hintText: KStrings.timeHint,
                        selectedTime: controller.selectedTime,
                        onTimeChanged: (time) =>
                            controller.selectedTime.value = time,
                      ),
                      CustomDropdownButton(
                        hintText: KStrings.modeHint,
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
                    backgroundColor: theme.colorPrimary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    KStrings.addMeetingDescriptionButton,
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
                      backgroundColor: Colors.grey[300],
                      colorText: Colors.black,
                      icon: const Icon(Icons.check_circle, color: Colors.green),
                      margin: const EdgeInsets.all(10),
                      duration: const Duration(seconds: 2),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[100],
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        KStrings.sendReminderButton,
                        style: GoogleFonts.raleway(
                          color: Colors.grey[700],
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.notifications_active, color: Colors.grey[700]),
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
