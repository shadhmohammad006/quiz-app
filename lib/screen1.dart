// ignore_for_file: depend_on_referenced_packages, must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/history.dart';
//import 'package:flutter_application_2/widgets/theme.dart';

import 'color.dart';

import 'catagory/general/easy.dart';
import 'catagory/Sports/sports.dart';
import 'catagory/Technology/technology.dart';
import 'main.dart';

class Screen1 extends StatefulWidget {
  Screen1({
    super.key,
  });
  int mark = 0;

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  set mark(int mark) {}
  bool showIcons = false;

  void toggleIcons() {
    setState(() {
      showIcons = !showIcons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: background,
      body: Center(
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),

            Row(
              children: [
                Container(
                  height: 50,
                  width: 200,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.chevron_right_sharp),
                        onPressed: toggleIcons,
                      ),
                      // IconButton(
                      //     icon: Icon(
                      //         MyApp.themeNotifier.value == ThemeMode.light
                      //             ? Icons.dark_mode
                      //             : Icons.light_mode),
                      //     onPressed: () {
                      //       MyApp.themeNotifier.value =
                      //           MyApp.themeNotifier.value == ThemeMode.light
                      //               ? ThemeMode.dark
                      //               : ThemeMode.light;
                      //     })
                      Visibility(
                        visible: showIcons,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  MyApp.themeNotifier.value =
                                      MyApp.themeNotifier.value ==
                                              ThemeMode.light
                                          ? ThemeMode.dark
                                          : ThemeMode.light;
                                },
                                icon: Icon(
                                    MyApp.themeNotifier.value == ThemeMode.light
                                        ? Icons.dark_mode
                                        : Icons.light_mode)),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.settings)),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.settings)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        width: 82,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            // color: Color.fromARGB(255, 217, 217, 221),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(children: [
                          Container(
                            height: 30,
                            width: 50,
                            child: Center(
                                child: Text(
                              '${widget.mark}',
                            )),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        "asset/images/images-removebg-preview (1).png"),
                                    fit: BoxFit.cover)),
                          )
                        ]),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Result(),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 217, 217, 221),
                              shape: BoxShape.circle),
                          child: Image.asset(
                            'asset/images/images__1_-removebg-preview.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 125),
              height: 100,
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Let's Play",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Be the first",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            CatagoryCard(
              first: first,
              title: 'General  ',
              subtitle: 'gk',
              image: 'asset/images/sports.png',
              ontap: () {
                mark = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Easy(),
                  ),
                );
              },
            ),

            CatagoryCard(
              first: first,
              title: 'Technology',
              subtitle: 'ert',
              image: 'asset/images/images-removebg-preview.png',
              ontap: () {
                mark = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => technology(),
                  ),
                );
              },
            ),
            CatagoryCard(
              first: first,
              title: 'Sports',
              subtitle: 'st',
              image: 'asset/images/sports.png',
              ontap: () {
                mark = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => sports(),
                  ),
                );
              },
            ),
            // ElevatedButton(
            //   onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => Easy(),
            //   ),
            // );
            //   },
            //   child: Text('Start Quiz'),
            // ),
          ],
        ),
      ),
    );
  }
}

class CatagoryCard extends StatelessWidget {
  final Color first;
  final String title;
  final String subtitle;
  final String image;
  final void Function() ontap;
  const CatagoryCard(
      {super.key,
      required this.first,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Stack(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
              height: 148,
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(),
                // gradient: LinearGradient(
                //     begin: Alignment.topLeft,
                //     end: Alignment.bottomLeft,
                //     // colors: [
                //     //   Color.fromARGB(255, 217, 217, 221),
                //     //   Color.fromARGB(255, 247, 247, 248),
                //     // ]
                //     ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 60,
                        width: 150,
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 120.7,
                  ),
                  Stack(
                    children: [
                      Container(
                        //  color: const Color.fromARGB(255, 59, 255, 101),
                        height: 148,
                        width: 110,
                      ),
                      Positioned(
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // child: Stack(
              //   children: [
              //     Positioned.fill(
              //         left: 200,
              //         child: Image.asset(
              //           image,
              //         )),
              //   ],
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
