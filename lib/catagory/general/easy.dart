import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/general_provider.dart';
import 'package:flutter_application_2/score_page.dart';
import 'package:provider/provider.dart';

import 'question_model.dart';

class Easy extends StatefulWidget {
  const Easy({super.key});

  @override
  State<Easy> createState() => _EasyState();
}

class _EasyState extends State<Easy> {
  int mark = 0;
  int index = 0;

  void answerQuestion(int indexOfAnswer) {
    if (questions[index].indexOfAnswer == indexOfAnswer) {
      mark++;
    }

    setState(() {
      if (index != questions.length - 1) {
        index++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Total(
              mark: mark,
            ),
          ),
        );
        // if (mark > 3) {
        //   print('win');
        // }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('easy');
    return Scaffold(
      //  backgroundColor: Color.fromARGB(255, 247, 247, 248),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: Container(
              height: 200,
              width: 300,
              child: Center(
                child: Text(
                  questions[index].question!,
                  style: TextStyle(
                    //  color: Color.fromARGB(255, 10, 10, 10),
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Column(
            children: List.generate(questions[index].options!.length, (i) {
              return Column(
                children: [
                  SizedBox(height: 15), // Add a 10-pixel space between buttons
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Color.fromARGB(255, 217, 217, 221),
                      fixedSize: Size(300, 50),
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      answerQuestion(i);
                    },
                    child: Text(
                      questions[index].options![i],
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        //color: Colors.black
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
