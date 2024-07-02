import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Navigate to the home screen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image.asset('assets/logo.png'), 
            Icon(Icons.calculate_outlined),
            SizedBox(height: 24),
            Text(
              'BMI Calculator',
              style: Theme.of(context).textTheme.displayLarge, // Updated here
            ),
          ],
        ),
      ),
    );
  }
}
