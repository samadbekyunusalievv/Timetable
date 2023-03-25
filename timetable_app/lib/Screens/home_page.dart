// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:timetable_app/Screens/page1.dart';
import 'package:timetable_app/Screens/page2.dart';
import 'package:timetable_app/Screens/page3.dart';
import 'package:timetable_app/Screens/page4.dart';
import 'package:timetable_app/Screens/page5.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
        icon: const Icon(Icons.menu), onPressed: () {  },
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Timetable"),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(DateFormat.yMd().format(DateTime.now()),style: TextStyle(fontSize: 17),)),
        )],
      ),
      body: Container(

        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/back.png'),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                  child: SizedBox(
                    height: 45.0,
                    child:  DecoratedBox(
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white30,
                      ),
                      child: Center(child: Text("Pazartesi",  style: TextStyle(
                          color: Colors.white70, fontSize: 23),)),

                    ),
                  ),
                ),
                // page view
                SizedBox(
                  height: 550,
                  child: PageView(
                    controller: _controller,
                    children: const [
                      Page1(),
                      Page2(),
                      Page3(),
                      Page4(),
                      Page5(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 5,
                      effect: SwapEffect(
                        activeDotColor: Colors.deepPurple,
                        dotColor: Colors.deepPurple.shade100,
                        dotHeight: 15,
                        dotWidth: 15,
                        spacing: 10,
                      ),
                    ),
                  ),
                ),

                // dot indicators
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: SizedBox(
                      height: 50.0,
                      child:  DecoratedBox(
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white30,
                        ),
                        child: Center(child: Text("Bilgisayar Muhendisligi",  style: TextStyle(
                            color: Colors.white70, fontSize: 23),)),

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
