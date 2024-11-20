// import 'package:flutter/material.dart';
//
// import 'navigation.dart';
//
// class GettingStartedScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.deepPurple.shade900,
//               Colors.deepPurple.shade700,
//               Colors.deepPurple.shade500,
//             ],
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 100,),
//             Padding(
//               padding: const EdgeInsets.only(top: 80.0),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   height: 250,
//                   width: 250,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                     image: DecorationImage(fit: BoxFit.cover,image: AssetImage('assets/55f1a0c560ccab25d94b7db6d63553c2.jpg'))
//                       ,
//                   ),
//
//                 // Add your image asset here
//
//                   ),
//               ),
//               ),
//
//
//             SizedBox(height: 30),
//
//             // Title
//             Text(
//               'Getting Started',
//               style: TextStyle(
//                 fontSize: 28,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//
//             SizedBox(height: 10),
//
//             // Subtitle
//             Text(
//               'Getting Started Guide',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.white70,
//               ),
//             ),
//
//             SizedBox(height: 60),
//
//             // Button
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40),
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Button action
//                 },
//                 style: ElevatedButton.styleFrom(
//                 backgroundColor:   Colors.purpleAccent, // Background color
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
//                 ),
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => NavigationMenu(),));
//                   },child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         'Let\'s go',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.white,
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       Icon(
//                         Icons.music_note,
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//
//             Spacer(),
//
//             // Back button (Optional)
//             Padding(
//               padding: const EdgeInsets.only(bottom: 30.0),
//               child: TextButton(
//                 onPressed: () {
//                   // Back button action
//                 },
//                 child: Text(
//                   'Back',
//                   style: TextStyle(
//                     color: Colors.white70,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }