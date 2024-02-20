import 'dart:math';

import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //for 1st animated container
  late double _width=100;
  late double _height=100;
  Color _color=Colors.red;

  //for 2nd animated container
  late double _widths=50;
  late double _heights=50;
  Color _colors=Colors.green;

  //border radius for both animated container
  BorderRadius _radius=BorderRadius.circular(15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          setState((){

            final rand=Random();

            //for 1st animated container
            _width=rand.nextInt(300).toDouble();
            _height=rand.nextInt(300).toDouble();
            _color=Color.fromRGBO(
              rand.nextInt(256),
              rand.nextInt(256),
              rand.nextInt(256),
              1
            );

            //for 2nd animated container
            _widths=rand.nextInt(300).toDouble();
            _heights=rand.nextInt(300).toDouble();
            _colors=Color.fromRGBO(
                rand.nextInt(256),
                rand.nextInt(256),
                rand.nextInt(256),
                1
            );

            //for both animated container
            _radius=BorderRadius.circular(rand.nextInt(100).toDouble());
          });
        },
        child: const Icon(Icons.play_arrow),

      ),
      body: SafeArea(
        child: Center(

          //for 1st animated container
        child: AnimatedContainer(
            duration: const Duration(seconds: 3),
            height: _height,
            width: _width,
            decoration: BoxDecoration(
              borderRadius: _radius,
              color: _color,
              boxShadow: [BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius:  7,
                offset: const Offset(3,5)
              )]
            ),
            curve: Curves.linearToEaseOut,

            //for 2nd animated container
            child:  Center(child: AnimatedContainer(
              duration: const Duration(seconds: 3),
              height: _heights/2,
              width: _widths/2,
              decoration: BoxDecoration(
                  borderRadius: _radius,
                  color: _colors,
              ),
              curve: Curves.linearToEaseOut,
            )),
          ),
        ),
      ),
    );
  }
}

