import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  final double result;
  final String state;

  BmiResultScreen({
    @required this.result,
    this.state,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0b0e21),
      appBar: AppBar(
        backgroundColor: Color(0xff0b0e21),
        centerTitle: true,
        title: Text(
          'BMI RESULT',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Expanded(
                child: Card(
                  color: Color(0xff353552),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${state}',
                          style: TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 25,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(height: 70),
                        Text(
                          '${result.toStringAsFixed(1)}',
                          style: TextStyle(
                            fontSize: 90,
                            fontWeight: FontWeight.w800,
                            color: Colors.white
                          ),
                        ),
                        SizedBox(height: 70),
                        Text(
                          'You have a normal body weight. Good job!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: MaterialButton(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  color: Color(0xffd93558),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text(
                    'RE-CALCULATE',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // A BMI of between 18.5 and 24.9 is ideal. A BMI of between 25 and 29.9 is overweight. A BMI over 30 indicates obesity.
}
