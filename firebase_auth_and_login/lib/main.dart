import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_and_login/home_screen/view/home_screen.dart';
import 'package:firebase_auth_and_login/login_screen/provider/login_provider.dart';
import 'package:firebase_auth_and_login/services/auth_provider.dart';
import 'package:firebase_auth_and_login/sign_up_screen/provider/signup_screen_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => AuthProvider(FirebaseAuth.instance)),
        StreamProvider(
            create: (context) => context.watch<AuthProvider>().stream(),
            initialData: null),
        ChangeNotifierProvider(create: (context) => LoginScreenProvider()),
        ChangeNotifierProvider(create: (context) => SignupScreenProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
