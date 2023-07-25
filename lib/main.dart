import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/providers/Signup_provider.dart';
import 'package:social/providers/drawerprovider.dart';
import 'package:social/providers/homeprovider.dart';
import 'package:social/providers/login_provider.dart';
import 'package:social/providers/personaldetail.dart';
import 'package:social/screens/splash.dart';
  import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) => LoginProvider(),),
        ChangeNotifierProvider(create:(context) => SignupProvider(),),
        ChangeNotifierProvider(create:(context) => HomeProvider(),),
        ChangeNotifierProvider(create:(context) => PersonalProvider(),),
        ChangeNotifierProvider(create:(context) => drawerProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(
          useMaterial3: true,
          
        ),
        home: const  SplashView(),
      ),
    );
  }
}
