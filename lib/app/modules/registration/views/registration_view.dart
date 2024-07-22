import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managment_app/Themes/themes.dart';
import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
const RegistrationView({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    backgroundColor: Get.theme.colorLevel1,
    centerTitle: true,
    title: Text(
      'REGISTRATION',
        style: Get.theme.kTitleTextStyle ),
    elevation: 0,
      ),
       body :Container(
         decoration: BoxDecoration(
             gradient: LinearGradient(
                 colors: [
                   Get.theme.colorLevel1,
                   Get.theme.colorLevel2,
                 ],
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 stops: [0.5, 1.0]
             )
         ),
         child: Column(
           children: [
             SingleChildScrollView(
               child: Padding(
               padding: const EdgeInsets.all(16.0),
               child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
               SizedBox(height: 10),
               Center(
               child: Text(
               'STUDENT DETAILS',
               style: Get.theme.kSubTitleTextStyle,
               ),
               ),
               SizedBox(height: 20),
               Container(
               padding: const EdgeInsets.all(16.0),
               decoration: BoxDecoration(
                 boxShadow: [
                   BoxShadow(
                     blurRadius: 11,
                     color: Get.theme.colorLevel0,
                     spreadRadius: 5,
                   )
                 ],
               color: Get.theme.colorLevel2, // Match the container background color
               borderRadius: BorderRadius.circular(15),
               ),
               child: Column(
               children: [
               _buildTextField('NAME:'),
               SizedBox(height: 10),
               _buildTextField('REGISTRATION NO:'),
               SizedBox(height: 10),
               _buildDropdownButtonFormField('DESIGNATION:', ['VOLUNTEER', 'COMMITTEE MEMBER ', 'COMMITTEE HEAD','ORGANIZER']),
               SizedBox(height: 10),
               _buildTextField('DEPARTMENT:'),
               SizedBox(height: 10),
               _buildDropdownButtonFormField('DIVISION:', ['A', 'B', 'C']),//IDK what to put in designation
               SizedBox(height: 10),
               _buildTextField('NET ID:'),
               SizedBox(height: 10),
               _buildTextField('Ph no:'),
               SizedBox(height: 20),

               ],
               ),
               ),
               ],
               ),
               ),
               ),
             ElevatedButton.icon(
               onPressed: () {},
               label: Text('ENROLL', style: Get.theme.kSmallTextStyle,),
               style: ElevatedButton.styleFrom(
                 backgroundColor: Get.theme.colorLevel1,
               ),
               icon: Icon(Icons.arrow_circle_right_rounded,
                   color: Get.theme.colorLevel4,
                 )
             ),
           ],
         ),
       ),
  bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add_box_outlined),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: '',
      ),
    ],
    currentIndex: 0, // Set the current index for the selected item
    selectedItemColor: Get.theme.colorLevel4,
    unselectedItemColor: Get.theme.colorLevel3,
    backgroundColor: Get.theme.colorLevel0, // Match the bottom navigation background color
    type: BottomNavigationBarType.fixed,
  ),


);
}

Widget _buildTextField(String labelText) {
return TextField(
decoration: InputDecoration(
labelText: labelText,
labelStyle: TextStyle(color: Colors.black),
filled: true,
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10),
),
),
);
}

Widget _buildDropdownButtonFormField(String labelText, List<String> items) {
return DropdownButtonFormField<String>(
decoration: InputDecoration(
labelText: labelText,
labelStyle: TextStyle(color: Colors.black),
filled: true,
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10),
),
),
items: items
    .map((item) => DropdownMenuItem(
value: item,
child: Text(item),
))
    .toList(),
onChanged: (value) {},
);
}
}