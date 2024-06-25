import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';



class Result extends StatefulWidget {
  const Result({super.key});


  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String text1 = 'Overweight';
  String text2 = 'You are in the overweight range. Consider consulting a healthcare professional for personalized advice on improving your health.';



  @override
  Widget build(BuildContext context) {
    int bmi = calculateBMI(weight, height).round();
    if(bmi > 24){
      text2 = 'You are in the overweight range. Consider consulting a healthcare professional for personalized advice on improving your health.';
    } if(bmi < 18) {
      text2 = 'You are in the underweight range. Consult a healthcare professional for guidance on healthy weight gain.';
    } else{
      text2 = 'You are in the healthy weight range. Keep up the good work!';
    }

    if(bmi > 24){
      text1 = 'OVERWEIGHT';
    } if(bmi < 24) {
      text1 = 'HEALTHY';
    } if(bmi < 18){
      text1 = 'UNDERWEIGHT';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
          children: [
            Spacer(),
            Text(
              'YOUR RESULT',
              style: const TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Container(
              constraints: BoxConstraints.tightFor(width: 310), height: 390,
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  Spacer(),
                  Text(text1 ,style: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.green,
                  ),
                  ),
                  Spacer(),
                  Text(
                      '${calculateBMI(weight, height).round()}',
                      style: const TextStyle(
                        fontSize: 78.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white
                        ,
                      ),
                    ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 0, 12, 0),
                    child: Text(text2,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),


                  ),
                  Spacer(),
                ],
              ),
            ),
            Spacer(),

            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: Container(
                color: const Color(0xFFEB1555),
                margin: const EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 80.0,
                alignment: Alignment.center,
                child: Text(
                  'RE-CALCULATE',
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
double calculateBMI(int weightInKg, int heightInCm) {
  if (heightInCm <= 0 || weightInKg <= 0) {
    throw Exception('Height and weight must be positive values.');
  }

  // Convert height from centimeters to meters
  double heightInMeters = heightInCm / 100.0;  // 1 centimeter = 0.01 meter

  return weightInKg / (heightInMeters * heightInMeters);
}

