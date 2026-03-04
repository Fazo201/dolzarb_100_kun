import 'package:dolzarb_100_kun/src/feature/home/view/firebase_desktop_view.dart';
import 'package:dolzarb_100_kun/src/feature/home/view/windows_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
  designSize: const Size(1920, 1080),
  minTextAdapt: true,
  builder: (_, child) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: child,
    );
  },
  child: const FirebaseDesktopView(),
  // child: const WindowsView(),
  // child: const DraftView(),
);
  }
}
