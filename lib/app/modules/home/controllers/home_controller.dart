import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PageController _pageController = PageController();
  RxInt currentIndex = 0.obs;
  final count = 0.obs;



  void increment() => count.value++;
}
