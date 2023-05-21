
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timetable_app/Screens/page_timetable.dart';
import 'package:timetable_app/models/lesson_entity.dart';
import 'package:timetable_app/service/service.dart';
class TimetableInfoFuture extends StatefulWidget {
  String studNum;
  TimetableInfoFuture(this.studNum,{Key? key});

  @override
  State<TimetableInfoFuture> createState() => _TimetableInfoFutureState();
}

class _TimetableInfoFutureState extends State<TimetableInfoFuture> {

  late Future<List<LessonEntity?>?> lessonFuture;

  PageController _controller = PageController(initialPage: DateTime.now().weekday - 1);

  int _currentPageIndex = DateTime.now().weekday -1;
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
          if(snapshot.hasData) {
            List<LessonEntity?>? lessonList = snapshot.data;
            return // page view
                    SizedBox(
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
                    );
          }
          else if(snapshot.hasError){
            return const Center(child: Text("Hata Var"),);
          }
          else {
            return const Center(child: CircularProgressIndicator(),);
          }
        }
    );
  }
}
