import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/utils/constants/app_route_names.dart';

class onBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulate a delay for splash screen


    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your logo or app name here
            Text(
              'Manzon',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
