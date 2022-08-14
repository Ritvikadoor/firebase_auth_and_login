// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ListScreen extends StatelessWidget {
//   const ListScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//                       .collection("Student Management")
//                       .snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//                       return CircularProgressIndicator();
//                     }return Expanded(
//                       child: ListView(
//                         // Important: Remove any padding from the ListView.
//                         padding: EdgeInsets.zero,
//                         children: snapshot.data!.docs.map((document) {
//                           return
//                               //  DrawerHeader(

//                               //   decoration: const BoxDecoration(
//                               //     color: Colors.blue,
//                               //   ),
//                               //   child:
//                               ListTile(
//                             title: Text(document["title"]),
//                             subtitle: Text(document["place"]),
//                             // leading: Text(document["number"]),
//                             onTap: () {
//                               // Update the state of the app.
//                               // ...
//                             },
//                             // ),
//                           );
//                         }).toList(),
//                         //  DrawerHeader(
//                         //   decoration: const BoxDecoration(
//                         //     color: Colors.blue,
//                         //   ),
//                         //   child: Text('Drawer Header'),
//                         // ),

//                         // ListTile(
//                         //   title: const Text('Item 2'),
//                         //   onTap: () {
//                         //     // Update the state of the app.
//                         //     // ...
//                         //   },
//                         // ),
//                       ),
//                     );
//         });
//   }
// }
