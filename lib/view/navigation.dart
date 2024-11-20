// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
// import 'package:video_player/view/mainpage.dart';
// import 'package:video_player/view/songs.dart';
//
// import 'homepage.dart';
//
// class NavigationMenu extends StatelessWidget{
//   const NavigationMenu ({super.key});
//   @override
//   Widget build(BuildContext context){
//     final controller = Get.put(NavigationController());
//     return Scaffold(
//       bottomNavigationBar: Obx(
//             ()=> NavigationBar(
//               backgroundColor: Color(0xFF1D1B3F),
//           height: 60,
//           elevation: 0,
//           selectedIndex: controller.selectedIndex.value,
//           onDestinationSelected: (index) => controller.selectedIndex.value = index,
//           destinations:[
//             NavigationDestination(icon: Icon(Icons.home), label:'Home',),
//             NavigationDestination(icon: Icon(Icons.call), label:'Musix'),
//             NavigationDestination(icon: Icon(Icons.person), label:'Profile'),
//           ],
//         ),
//       ),
//       body: Obx(() => controller.Screen[controller.selectedIndex.value]),
//
//     );
//   }
// }
//
// class NavigationController extends GetxController{
//   final Rx<int> selectedIndex = 0.obs;
//
//   final Screen = [MusicPlayerHome(),Songs(),MusicPlayerScreen(img: 'n',)];
// }