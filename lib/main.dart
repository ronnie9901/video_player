import 'package:flutter/material.dart';
import 'package:video_player/view/songs.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Songs(),
    );
  }
}

//
// class CategoryController extends GetxController {
//
//   var selectedValue = 'Default'.obs;
//   var txtController = TextEditingController();
//
//   final categoryItems = <String, List<String>>{
//     'Clothes': [],
//     'Ice Cream': [],
//   }.obs;
//
//   // Dropdown items list
//   List<DropdownMenuItem<String>> dropItems = [
//     const DropdownMenuItem(
//       value: 'Default',
//       child: Text('Default'),
//     ),
//     const DropdownMenuItem(
//       value: 'Clothes',
//       child: Text('Clothes'),
//     ),
//     const DropdownMenuItem(
//       value: 'Ice Cream',
//       child: Text('Ice Cream'),
//     ),
//   ];
//
//   void addItemToCategory() {
//     if (txtController.text.isNotEmpty) {
//       if (selectedValue.value == 'Default') {
//         categoryItems.addAll({txtController.text: []});
//         dropItems.add(
//           DropdownMenuItem(
//             value: txtController.text,
//             child: Text(txtController.text),
//           ),
//         );
//         categoryItems[selectedValue.value]!.add(txtController.text);
//       } else {
//         categoryItems[selectedValue.value]!.add(txtController.text);
//       }
//       txtController.clear();
//       update();  // Trigger UI update
//     }
//   }
// }
//
//
// class InterviewHome extends StatelessWidget {
//
//   final CategoryController categoryController = Get.put(CategoryController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Interview Practice'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.list),
//             onPressed: () {
//               // Navigate to the list display page
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => CategoryItemsPage(categoryController.categoryItems),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Obx(() {
//               return DropdownButton<String>(
//                 value: categoryController.selectedValue.value, // Current selected value
//                 items: categoryController.dropItems,
//                 onChanged: (value) {
//                   categoryController.selectedValue.value = value!;
//                 },
//               );
//             }),
//             const SizedBox(height: 16),
//             TextField(
//               controller: categoryController.txtController,
//               decoration: InputDecoration(
//                 labelText: 'Enter some text',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: const BorderSide(
//                     color: Colors.black,
//                     width: 1.5,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextButton(
//               onPressed: categoryController.addItemToCategory,
//               child: const Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// class CategoryItemsPage extends StatelessWidget {
//   final Map<String, List<String>> categoryItems;
//
//   const CategoryItemsPage(this.categoryItems, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Category Items'),
//         ),
//         body: ListView(
//             padding: const EdgeInsets.all(16.0),
//             children: categoryItems.entries.map((entry) {
//               return ExpansionTile(
//                 title: Text(entry.key),
//                 children: entry.value.map((item) {
//                   return ListTile(
//                     title: Text(item),
//                   );
//                 }).toList(),
//               );
//             }).toList(),
//             ),
//         );
//     }
// }



