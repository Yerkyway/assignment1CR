import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 1',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Column(
        children: <Widget>[
          // Displaying waves
          WaveWidget(
            config: CustomConfig(
              gradients: [
                [Colors.blue, Colors.blue.shade200],
                [Colors.blue.shade200, Colors.blue.shade100],
              ],
              durations: [19440, 10800],
              heightPercentages: [0.20, 0.25],
              blur: MaskFilter.blur(BlurStyle.solid, 10),
              gradientBegin: Alignment.bottomLeft,
              gradientEnd: Alignment.topRight,
            ),
            waveAmplitude: 0,
            size: Size(double.infinity, 200),
          ),
          // Page transition button
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => SecondScreen(),
                  transitionsBuilder: (context, animation1, animation2, child) {
                    return FadeTransition(
                      opacity: animation1,
                      child: child,
                    );
                  },
                  transitionDuration: Duration(milliseconds: 500),
                ),
              );
            },
            child: Text('Go to Second Screen'),
          ),
        ],
      ),
    );
  }
}



class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Column(
        children: <Widget>[
          // Displaying waves
          WaveWidget(
            config: CustomConfig(
              gradients: [
                [Colors.red, Colors.red.shade200],
                [Colors.red.shade200, Colors.red.shade100],
              ],
              durations: [19440, 10800],
              heightPercentages: [0.20, 0.25],
              blur: MaskFilter.blur(BlurStyle.solid, 10),
              gradientBegin: Alignment.bottomLeft,
              gradientEnd: Alignment.topRight,
            ),
            waveAmplitude: 0,
            size: Size(double.infinity, 200),
          ),
          // Page transition button
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => MainScreen(),
                  transitionsBuilder: (context, animation1, animation2, child) {
                    return FadeTransition(
                      opacity: animation1,
                      child: child,
                    );
                  },
                  transitionDuration: Duration(milliseconds: 500),
                ),
              );
            },
            child: Text('Return to Main Screen'),
          ),
        ],
      ),
    );
  }
}


