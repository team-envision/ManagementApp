import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/my_team_page_controller.dart';

class MyTeamPageView extends GetView<MyTeamPageController> {
  const MyTeamPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A2239),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'MY TEAM',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              TeamTile(
                title: 'ORGANIZERS',
                members: 5,
                onTap: () {
                  Get.toNamed('/teamDetails', arguments: 'Organizers');
                },
              ),
              TeamTile(
                title: 'HEADS',
                members: 8,
                onTap: () {
                  Get.toNamed('/teamDetails', arguments: 'Heads');
                },
              ),
              TeamTile(
                title: 'MEMBERS',
                members: 11,
                onTap: () {
                  Get.toNamed('/teamDetails', arguments: 'Members');
                },
              ),
              TeamTile(
                title: 'VOLUNTEERS',
                members: 20,
                onTap: () {
                  Get.toNamed('/teamDetails', arguments: 'Volunteers');
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
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
        currentIndex: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class TeamTile extends StatelessWidget {
  final String title;
  final int members;
  final VoidCallback onTap;

  const TeamTile({
    super.key,
    required this.title,
    required this.members,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0D3C55),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: const Color(0xFF66C2FF), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(2, 3), // changes position of shadow
            ),
          ],
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.person, color: Color(0xFF66C2FF), size: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '$members members',
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const Icon(Icons.arrow_forward_ios, color: Color(0xFF66C2FF), size: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
