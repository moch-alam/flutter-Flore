import 'package:flutter/material.dart';


class splashscreen extends StatelessWidget{
  const splashscreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFEEF2FF),
        body: Stack(
          children: [
            Center(
              child: Positioned(
                top: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/bunga ungu 1px.png',
                        width: 200,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'HELLO FELLAS.',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 100),
                    Container(
                      width: 199,
                      child: Text(
                        'Temukan segala jenis bunga dari berbagai belahan dunia!',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              // height: 474.5,
              child: Image.asset(
                'assets/images/Vector 4px.png',
                width: 500,
                // height: 200,
              ),
            ),
            Positioned(
                bottom: 0,
                child: Image.asset(
                  'assets/images/Vector 3px.png',
                  width: 500,
                )),
            Positioned(
                right: 0,
                child: Image.asset(
                  'assets/images/Vector 2px.png',
                  width: 135,
                )),
            Positioned(
                left: 0,
                top: 174,
                child: Image.asset(
                  'assets/images/Vector 1px.png',
                  width: 135,
                ))
          ],
        ),
      ),
    );
  }
}
