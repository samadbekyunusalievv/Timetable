import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_app/Screens/home_screen.dart';
import 'package:timetable_app/theme_constants.dart';
import 'package:timetable_app/theme_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Screens/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
  MyApp.themeManager = ThemeManager();
  MyApp.themeManager.toggleTheme(isDarkTheme);
  runApp(MyApp(prefs: prefs));
}


class MyApp extends StatefulWidget {
  final prefs;
  MyApp({Key? key,required this.prefs}) : super(key: key);

  static ThemeManager themeManager = ThemeManager();
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    MyApp.themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    MyApp.themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: GradientTheme,
          darkTheme: ManasTheme,
          themeMode: MyApp.themeManager.themeMode,
          debugShowCheckedModeBanner: false,
          home: widget.prefs.getString('studNum')!=null ? HomePage(widget.prefs.getString('studNum')) : SignIn(),
        );
      },
    );
  }
}
