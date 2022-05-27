import 'package:bitmama/screens/dashboard.dart';
import 'package:bitmama/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'data/providers/bit_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return MultiProvider(
      providers: [
         ChangeNotifierProvider<BitProvider>(
            create: (context) => BitProvider()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 800),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
    
              // You can use the library anywhere in the app even in theme
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const SignUp(),
            );
          }),
    );
  }
}
