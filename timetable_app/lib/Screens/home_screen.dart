
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_app/Screens/sign_in_screen.dart';

import '../main.dart';
import '../models/timetable_department_course.dart';
import '../timetable_info.dart';

class HomePage extends StatefulWidget {
  String studNum;

  DepartmentAndCourse selectDepartmentAndCourse = DepartmentAndCourse();

  HomePage(this.studNum, {super.key}) {
    switch ((DateTime.now().year % 2000) - int.parse(studNum.substring(0, 2))) {
      case 2:
        selectDepartmentAndCourse.selectedCourse = "1";
        break;
      case 3:
        selectDepartmentAndCourse.selectedCourse = "2";
        break;
      case 4:
        selectDepartmentAndCourse.selectedCourse = "3";
        break;
      case 5:
        selectDepartmentAndCourse.selectedCourse = "4";
        break;
    }

    switch (studNum.substring(6, 8)) {
      case "01":
        selectDepartmentAndCourse.selectedDepartment =
            selectDepartmentAndCourse.departmentOptions.keys.elementAt(0);
        break;
      case "04":
        selectDepartmentAndCourse.selectedDepartment =
            selectDepartmentAndCourse.departmentOptions.keys.elementAt(1);
        break;
      case "03":
        selectDepartmentAndCourse.selectedDepartment =
            selectDepartmentAndCourse.departmentOptions.keys.elementAt(2);
        break;
      default:
        selectDepartmentAndCourse.selectedDepartment =
            selectDepartmentAndCourse.departmentOptions.keys.elementAt(0);
        break;

    }
  }

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  PageController _controller =
  PageController(initialPage: DateTime.now().weekday - 1);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  getTimetableInfo(){
    return TimetableInfo(widget.studNum, widget.selectDepartmentAndCourse,key: UniqueKey(),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        backgroundColor: Colors.black87,
        child: Column(
          children: [
            SizedBox(
              height: 150.0.h,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: (Theme.of(context).brightness == Brightness.light)
                        ? const AssetImage('assets/images/header4.png')
                        : const AssetImage('assets/images/header4.png'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.black87,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
            ),
            ListTile(
              leading: const Text(
                "Tema",
                style: TextStyle(fontSize: 23, color: Colors.white),
              ),
              title: DropdownButton<bool>(
                value: MyApp.themeManager.themeMode == ThemeMode.dark,
                onChanged: (newValue) async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setBool("isDarkTheme", newValue!);
                  MyApp.themeManager.toggleTheme(newValue!);
                },
                items: const [
                  DropdownMenuItem<bool>(
                    value: false,
                    child: Text('Gradient'),
                  ),
                  DropdownMenuItem<bool>(
                    value: true,
                    child: Text('Manas'),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Text(
                'Bölüm',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              onTap: () {
                // Log out the user
              },
              title: Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    style: TextStyle(
                      overflow: TextOverflow.clip
                    ),
                    value: widget.selectDepartmentAndCourse.selectedDepartment,
                    onChanged: (newValue) {
                      if(newValue != null) {
                        widget.selectDepartmentAndCourse.selectedDepartment = newValue;
                        setState(() {
                          widget.studNum = widget.selectDepartmentAndCourse.getStudNumber();
                        });
                      }
                    },
                    items: widget.selectDepartmentAndCourse.departmentOptions.keys
                        .map((String department) {
                      return DropdownMenuItem(
                        value: department,
                        child: Text(department),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Text(
                'Sınıf',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              onTap: () {
                // Do something when the course is tapped
              },
              title: Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: widget.selectDepartmentAndCourse.selectedCourse,
                    onChanged: (newValue) {
                      setState(() {
                        widget.selectDepartmentAndCourse.selectedCourse =
                        newValue!;

                        widget.studNum = widget.selectDepartmentAndCourse.getStudNumber();
                      });
                    },
                    items: const [
                      DropdownMenuItem<String>(
                        value: '1',
                        child: Text('1'),
                      ),
                      DropdownMenuItem<String>(
                        value: '2',
                        child: Text('2'),
                      ),
                      DropdownMenuItem<String>(
                        value: '3',
                        child: Text('3'),
                      ),
                      DropdownMenuItem<String>(
                        value: '4',
                        child: Text('4'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                size: 30,
                color: Colors.white,
              ),
              title: const Text(
                'Çıkış',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              onTap: () async{

                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove("isDarkTheme");
                prefs.remove("studNum");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignIn(),
                    ));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Icon(
                Icons.more_horiz_outlined,
                size: 50,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Timetable",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
                  DateFormat("yMd").format(DateTime.now()),
                  style: Theme.of(context).textTheme.displayMedium,
                )),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: (Theme.of(context).brightness == Brightness.light)
                ? const AssetImage('assets/images/manas8.jpg')
                : const AssetImage('assets/images/back.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: getTimetableInfo(),
      ),
    );
  }
}
