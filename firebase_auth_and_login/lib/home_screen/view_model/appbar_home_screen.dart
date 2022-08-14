// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth_and_login/login_screen/view/login_screen.dart';
// import 'package:firebase_auth_and_login/services/auth_provider_signin.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//         stream: context.watch<AuthProvider>().stream(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) return LoginScreen();
//           return Scaffold(
            // appBar: AppBar(
            //   toolbarHeight: 80,
            //   elevation: 0,
            //   backgroundColor: Colors.transparent,
            //   leading: const Padding(
            //     padding: EdgeInsets.all(8.0),
            //     child: InkWell(
            //       child: CircleAvatar(
            //         radius: 40,
            //         backgroundColor: Colors.black,
            //       ),
            //       // onTap: () => ,
            //     ),
            //   ),
            //   actions: [
            //     IconButton(
            //         onPressed: () {
            //           context.read<AuthProvider>().signOut();
            //         },
            //         icon: const Icon(
            //           Icons.logout,
            //           color: Colors.black,
            //         )),
            //   ],
            // ),
//             body: SafeArea(
//               child: Stack(
//                 children: [
//                   Container(
//                     decoration: const BoxDecoration(color: Colors.white
//                         // image: DecorationImage(
//                         //   image: homeBackgroundImage, // <-- BACKGROUND IMAGE
//                         //   fit: BoxFit.cover,
//                         // ),
//                         ),
//                   ),
//                   // Column(
//                   //   children: [
//                   //     Container(
//                   //       height: 300,
//                   //       width: double.infinity,
//                   //       child: Center(
//                   //         child: CircleAvatar(
//                   //           radius: 80,
//                   //           backgroundColor: Colors.white,
//                   //         ),
//                   //       ),
//                   //     ),

//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16, vertical: 30),
//                     child: Container(
//                       height: 540,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(23),
//                         color: Colors.white.withOpacity(0.5),
//                       ),
//                     ),
//                   )
//                   //   ],
//                   // ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }
