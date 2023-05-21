
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController studentNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: (Theme.of(context).brightness == Brightness.light)
                ? const AssetImage('assets/images/manasss.png')
                : const AssetImage('assets/images/back.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150.h,
              width: 150.w,
              child: Center(
                  child: Image(
                    image: (Theme.of(context).brightness == Brightness.light)
                        ? const AssetImage('assets/images/logowhite.png')
                        : const AssetImage('assets/images/logo.png'),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                  child: Text(
                    "Timetable",
                    style: TextStyle(fontSize: 35.sp, color: Colors.white),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Kendi numaranizi yaziniz';
                      }
                      // Regex pattern to match arXiv identifier format (e.g., "1904.01002")
                      RegExp regex = RegExp(r'^\d{4}\.\d{5}$');
                      if (!regex.hasMatch(value!)) {
                        return 'Oqrenji Numara Hata!';
                      }
                      return null; // Return null if the value is valid
                    },
                    controller: studentNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      hoverColor: Colors.black54,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Öğrenci Numara',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18.sp),
                      prefixIcon: Icon(
                        Icons.person,
                        size: 30.sp,
                        color: Colors.grey,
                      ),
                    ),
                    style: const TextStyle(color: Colors.black87),

                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async{
                if (_formKey.currentState!.validate()) {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setString('studNum', studentNumberController.text);
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      HomePage(studentNumberController.text)), (Route<dynamic> route) => false);
                }

              },
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                // padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.all(20),
                alignment: AlignmentDirectional.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Giriş",
                      style: TextStyle(color: Colors.grey, fontSize: 30.sp),
                    ),
                    const Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}