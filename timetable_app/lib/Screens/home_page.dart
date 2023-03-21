// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Timetable"),

      ),
      body: Container(

        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/back.png'),
                fit: BoxFit.cover)),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // page view
          SizedBox(
            height: 580,
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

          // dot indicators
          Center(
            child: SmoothPageIndicator(

              controller: _controller,
              count: 5,
              effect: SwapEffect (
                activeDotColor: Colors.deepPurple,
                dotColor: Colors.deepPurple.shade100,
                dotHeight: 20,
                dotWidth: 20,
                spacing: 13,

              ),
            ),
          ),
        ],
          ),
      ),
    );
  }
}