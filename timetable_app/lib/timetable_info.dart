import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:timetable_app/Screens/page_timetable.dart';
import 'package:timetable_app/models/lesson_entity.dart';
import 'package:timetable_app/models/timetable_department_course.dart';
import 'package:timetable_app/service/service.dart';

class TimetableInfo extends StatefulWidget {
  String studNum;
  DepartmentAndCourse departmentAndCourse;

  TimetableInfo(this.studNum,this.departmentAndCourse,{Key? key}) : super(key: key);

  @override
  State<TimetableInfo> createState() => _TimetableInfoState();
}

class _TimetableInfoState extends State<TimetableInfo> {

  late Future<List<LessonEntity?>?> lessonFuture;

  PageController _controller = PageController(initialPage: DateTime.now().weekday - 1);
  int _currentPageIndex = DateTime.now().weekday -1;
  List<String> _weekDays = ["Pazartesi", "Salı", "Çarşamba", "Perşembe", "Cuma","Pazartesi","Pazartesi"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setFuture();
  }

  void setFuture(){
    lessonFuture = ApiClient().getTimetable(widget.studNum);
  }
  void _onPageChanged(int pageIndex) {
    setState(() {
      _currentPageIndex = pageIndex;
    });
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: lessonFuture,
      builder:(context,snapshot)
    {
      if(snapshot.connectionState == ConnectionState.waiting){

        return const Center(child: CircularProgressIndicator(),);
      }
      else if(snapshot.hasError){
        return const Center(child: Text("Проблема в сервере"),);
      }
      else{
        List<LessonEntity?>? lessonList = snapshot.data;
        return SafeArea(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        constraints:
                        const BoxConstraints(maxWidth: 250, minWidth: 200),
                        height: 45.0.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black.withOpacity(0.6),
                        ),
                        child: Center(
                          child: Text(
                            _weekDays[_currentPageIndex],
                            style: TextStyle(fontSize: 23.sp, color: Colors
                                .white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ), // page view
                SafeArea(
                  child: SizedBox(
                    height: 566.h,
                    child: PageView(
                      controller: _controller,
                      onPageChanged: _onPageChanged,
                      children: [
                        PageTimetable(lessonList?.sublist(0, 12).cast<LessonEntity?>()),
                        PageTimetable(lessonList?.sublist(12, 24).cast<LessonEntity?>()),
                        PageTimetable(lessonList?.sublist(24, 36).cast<LessonEntity?>()),
                        PageTimetable(lessonList?.sublist(36, 48).cast<LessonEntity?>()),
                        PageTimetable(lessonList?.sublist(48, 60).cast<LessonEntity?>()),
                      ],
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 5,
                  effect: SwapEffect(
                    activeDotColor: Theme
                        .of(context)
                        .indicatorColor,
                    dotColor: Colors.white,
                    dotHeight: 15,
                    dotWidth: 15,
                    spacing: 10,
                  ),
                ),

                // dot indicators
                Center(
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: 50.h,
                      maxHeight: 65.h,
                      minWidth: 250.w,
                    ),
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black.withOpacity(0.6),
                          ),
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(15, 7, 15, 5),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 2, 10, 2),
                              child: AutoSizeText(
                                '${widget.departmentAndCourse.selectedDepartment} ${widget.departmentAndCourse.selectedCourse ?? ''}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 23.sp, color: Colors.white),
                                minFontSize: 17,
                                maxLines: 4,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
  }
    );
  }
}
