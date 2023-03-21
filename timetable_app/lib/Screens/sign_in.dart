import 'package:flutter/material.dart';
import 'package:timetable_app/Screens/home_page.dart';
class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: ()=> Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage(),)),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,

              ),
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.all(20),
              alignment: AlignmentDirectional.center,

              child: const Center(
                child: Text("Giris",
                  style: TextStyle(color: Colors.black45),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

