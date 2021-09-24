import 'package:flutter/material.dart';

class IamRich extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'I\'Am Rich',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/30147-1-diamond-vector-clip-art.png'),
            ],
          ),
        ),
      ),
    );
  }
}
