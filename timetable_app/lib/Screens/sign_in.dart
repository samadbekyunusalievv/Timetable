import 'package:flutter/material.dart';
import 'package:timetable_app/Screens/home_page.dart';
class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/back.png'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ogrenci Numara',
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: ()=> Navigator.push(context,MaterialPageRoute(builder: (context)=>const HomePage(),)),
              child: Container(
                height: 70,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.all(20),
                alignment: AlignmentDirectional.center,

                child:  const Center(

                  child: Text("Giris",
                    style: TextStyle(color: Colors.black45,fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

