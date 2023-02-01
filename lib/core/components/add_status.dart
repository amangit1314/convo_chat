// import 'package:convo_chat/features/stories/presentation/create_new_story_screen.dart';
// import 'package:flutter/material.dart';

// class AddStatusItem extends StatelessWidget {
//   const AddStatusItem({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0),
//       child: Column(
//         children: [
//           GestureDetector(
//             onTap: () => Navigator.of(context).pushReplacement(
//               MaterialPageRoute(
//                 builder: (context) => const CreateNewStroyScreen(),
//               ),
//             ),
//             child: Container(
//               height: 60,
//               width: 60,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//                 border: Border.all(color: Colors.black, width: 1.0),
//               ),
//               child: const Center(
//                 child: Icon(
//                   Icons.add,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 5),
//           const Text(
//             "Add New",
//             style: TextStyle(
//               fontFamily: 'Poppins',
//               fontSize: 10,
//               color: Colors.black,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
