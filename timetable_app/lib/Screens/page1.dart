import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colors.white30,
            child: ListView.separated(

              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onLongPressUp: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(40.0)), //this right here
                          child: SizedBox(
                            // height: 150,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'BIL-304 VERİ TABANI YÖNETİM SİSTEMLERİ II ÇINARA CUMABAYEVA MFFB 523',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 23),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Column(
                          children: const [
                            Text('8:00',style: TextStyle(color: Colors.white70 ,fontSize: 23),),
                            Text('8:45',style:  TextStyle(color: Colors.white70 ,fontSize: 23),),
                          ],
                        ),
                      ),
                       const Expanded(
                       child: Padding(
                       padding: EdgeInsets.all(7.0),
                            child: Text(
                              'VERİ TABANI YÖNETİM SİSTEMLERİ II',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 23),
                            )),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(color: Colors.purpleAccent,height: 12,);
              },
              itemCount: 12,
            ),
          ),
        ),
      ),
    );
  }
}


