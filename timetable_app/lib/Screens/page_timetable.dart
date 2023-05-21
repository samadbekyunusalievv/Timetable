import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/lesson_entity.dart';

class PageTimetable extends StatelessWidget {
  PageTimetable(this.lessons, {Key? key}) : super(key: key) {
    lessons?.insert(5, LessonEntity());
  }

  List<LessonEntity?>? lessons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: const EdgeInsets.fromLTRB(30, 20, 30, 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  // Calculate the time for each row
                  final startTime = DateTime(2023, 1, 1, 8, 0)
                      .add(Duration(minutes: index * 55));
                  final endTime = startTime.add(Duration(minutes: 45));

                  final startTimeOfDay = TimeOfDay.fromDateTime(startTime);
                  final endTimeOfDay = TimeOfDay.fromDateTime(endTime);

                  // Check if it's lunch break
                  if ((startTimeOfDay.hour == 12 &&
                          startTimeOfDay.minute >= 25) ||
                      (endTimeOfDay.hour == 13 && endTimeOfDay.minute <= 30)) {
                    return const SizedBox(height: 0); // Adjust the height to 0
                  } else {
                    return GestureDetector(
                      onTap: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(lessons?.elementAt(index)?.lessons ?? ""),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(lessons?.elementAt(index)?.teacher ?? ""),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(lessons?.elementAt(index)?.classroom ?? ""),
                            ],
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Column(
                              children: [
                                Text(
                                  '${startTimeOfDay.hour.toString().padLeft(2, '0')}:${startTimeOfDay.minute.toString().padLeft(2, '0')}',
                                  style: TextStyle(
                                      fontSize: 23.sp, color: Colors.white),
                                ),
                                Text(
                                  '${endTimeOfDay.hour.toString().padLeft(2, '0')}:${endTimeOfDay.minute.toString().padLeft(2, '0')}',
                                  style: TextStyle(
                                      fontSize: 23.sp, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                  checkLessonName(index),
                                  style: TextStyle(
                                      fontSize: 23.sp, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: Colors.white,
                    height: 0,
                  );
                },
                itemCount: lessons?.length ?? 0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  checkLessonName(int index) {
    if ((lessons?.elementAt(index)?.lessons?.length ?? 0) > 7) {
      return lessons
              ?.elementAt(index)
              ?.lessons
              ?.substring(8)
              .replaceAll('_', '(Secmeli) ') ??
          "";
    }
    return "";
  }
}
