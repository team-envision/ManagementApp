import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controllers/meetings_controller.dart';


class MeetingsView extends GetView<MeetingsController> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    // Define the options for the Domain dropdown
    final List<String> domainOptions = [
      'Robogyan', 'Yuddhame', 'Online', 'Magefficie and Start-Ups', 'Fundaz',
      'Vimanaz', 'Konstruktion', 'Architecture', 'Bluebook', 'Praesentio',
      'Machination', 'Electrizite', 'Digital Design', 'X-Zone'
    ];

    // Define the options for the FOR dropdown
    final List<String> forOptions = ['Volunteer', 'Member', 'Head'];

    // Define the options for the Mode dropdown
    final List<String> modeOptions = ['Online', 'Offline'];

    return Scaffold(
      backgroundColor:Color(0xFF094454) ,
      appBar: AppBar(
        title: Text(
          'MEETS',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue[100],
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF002431),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF002431), Color(0xFF094454)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF002431), Color(0xFF094454)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    FontAwesomeIcons.solidCalendar,
                    size: 80,
                    color: Colors.blue[100],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: screenWidth * 0.8,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF094454),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildDropdown(
                        'DOMAIN',
                        domainOptions,
                        controller.dropdown1SelectedValue,
                            (value) => controller.dropdown1SelectedValue.value = value!,
                      ),
                      SizedBox(height: 8),
                      _buildDropdown(
                        'FOR',
                        forOptions,
                        controller.dropdown2SelectedValue,
                            (value) => controller.dropdown2SelectedValue.value = value!,
                      ),
                      SizedBox(height: 8),
                      _buildDropdown(
                        'MODE',
                        modeOptions,
                        controller.dropdown3SelectedValue,
                            (value) => controller.dropdown3SelectedValue.value = value!,
                      ),
                      SizedBox(height: 8),
                      _buildDatePicker(context),
                      SizedBox(height: 8),
                      _buildTimePicker(context),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('ADD MEETING DESCRIPTION', style: TextStyle(color: Colors.white, fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Send Reminder', style: TextStyle(color: Colors.grey[700])),
                      SizedBox(width: 8),
                      Icon(Icons.notifications, color: Colors.grey[700]),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[300],
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box, color: Colors.white,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white,),
            label: '',
          ),
        ],
        selectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle navigation on tap
        },
      ),
    );
  }

  Widget _buildDropdown(String title, List<String> options, RxString selectedValue, void Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.blue[100],
          ),
        ),
        SizedBox(height: 8),
        Obx(() => DropdownButtonFormField<String>(
          value: selectedValue.value.isEmpty ? null : selectedValue.value,
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: TextStyle(color: Colors.grey[700])),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
        )),
      ],
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DATE',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: controller.selectedDate.value,
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null && pickedDate != controller.selectedDate.value) {
              controller.updateSelectedDate(pickedDate);
            }
          },
          child: AbsorbPointer(
            child: TextFormField(
              controller: controller.dateController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.black),
              ),
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TIME',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: controller.selectedTime.value,
            );
            if (pickedTime != null && pickedTime != controller.selectedTime.value) {
              controller.updateSelectedTime(pickedTime);
            }
          },
          child: AbsorbPointer(
            child: TextFormField(
              controller: controller.timeController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.black),
              ),
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ),
      ],
    );
  }
}