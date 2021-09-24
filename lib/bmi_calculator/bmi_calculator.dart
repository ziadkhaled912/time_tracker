import 'dart:math';

import 'package:flutter/material.dart';
import 'package:time_tracker_app/bmi_calculator/bmi_result_screen.dart';

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {

  @override
  void initState() {
    super.initState();
  }

  bool isMale = true;
  double height = 120.0;
  int weight = 30;
  int age = 18;
  String state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0b0e21),
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        backgroundColor: Color(0xff0b0e21),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xff1d1e30),
                          border: Border.all(
                            width: 5,
                            color: isMale ? Color(0xffd93558) : Color(0xff1d1e30),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/44483.png'),
                              height: 60,
                              color: Colors.white,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'MALE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xff1d1e30),
                          border: Border.all(
                            width: 5,
                            color: !isMale ? Color(0xffd93558) : Color(0xff1d1e30),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/Untitled-1.png'),
                              height: 60,
                              color: Colors.white,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xff1d1e30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'HEIGHT',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${height.round()}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 50,
                              letterSpacing: 3,
                            ),
                          ),
                          SizedBox(width: 2),
                          Text(
                            'cm',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                          value: height,
                          max: 220.0,
                          min: 80.0,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                          },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                vertical: 10
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xff1d1e30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '${weight}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 50,
                              letterSpacing: 3,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                heroTag: 'weight-',
                                backgroundColor: Color(0xFF636574),
                                child: Icon(
                                  Icons.remove,
                                  size: 30,
                                ),
                              ),
                              SizedBox(width: 10),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                heroTag: 'weight+',
                                backgroundColor: Color(0xFF636574),
                                child: Icon(
                                  Icons.add,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xff1d1e30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '${age}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 50,
                              letterSpacing: 3,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                heroTag: 'age-',
                                backgroundColor: Color(0xFF636574),
                                child: Icon(
                                  Icons.remove,
                                  size: 30,
                                ),
                              ),
                              SizedBox(width: 10),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                heroTag: 'age+',
                                backgroundColor: Color(0xFF636574),
                                child: Icon(
                                  Icons.add,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: MaterialButton(
              padding: EdgeInsets.symmetric(
                vertical: 15,
              ),
              color: Color(0xffd93558),
                onPressed: (){
                  var bmi = weight / pow(height /100, 2);
                  if(bmi <= 24.9){
                    state = 'Normal';
                   } else {
                    state = 'Over Weight';
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BmiResultScreen(
                            result: bmi,
                            state: state,
                          )),
                  );
                },
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                ),
          ),
        ],
      )
    );
  }
}
