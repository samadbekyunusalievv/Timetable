import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

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
                  onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => const AlertDialog(
                      title: Text(
                          'BIL-304 VERİ TABANI YÖNETİM SİSTEMLERİ II ÇINARA CUMABAYEVA MFFB 523'),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Column(
                          children: const [
                            Text(
                              '8:00',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 23),
                            ),
                            Text(
                              '8:45',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 23),
                            ),
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
                return const Divider(
                  color: Colors.purpleAccent,
                  height: 12,
                );
              },
              itemCount: 12,
            ),
          ),
        ),
      ),
    );
  }
}
