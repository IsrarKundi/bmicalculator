import 'package:bmi_calculator/Result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_content.dart';
import 'reusable_container.dart';
import 'package:flutter/gestures.dart';
import 'package:bmi_calculator/Result.dart';


const activeCardColor = Color(0xFF1D1E33);
const inActiveCardColor = Color(0xFF111328);
Color maleCardColor = inActiveCardColor;
Color feMaleCardColor = inActiveCardColor;
int height = 180;
int weight = 60;
int age = 18;
void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21)
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/first': (context) => Result()
      },
    );
  }
}



class InputPage extends StatefulWidget {
  InputPage({super.key});



  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {



  void updateCardColor(int gender){
    if(gender == 1){
      if(maleCardColor == inActiveCardColor){
      maleCardColor = activeCardColor;
      feMaleCardColor = inActiveCardColor;
      } else {
      maleCardColor = inActiveCardColor;
      }
    }
    else{
      if(feMaleCardColor == inActiveCardColor){
        feMaleCardColor = activeCardColor;
        maleCardColor = inActiveCardColor;
      }
      else{
        feMaleCardColor = inActiveCardColor;
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      updateCardColor(1);
                    });
                  },
                  child: reusableContainer(
                    maleCardColor,
                    CardContent(FontAwesomeIcons.mars, 'MALE'),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      updateCardColor(2);
                    });
                  },
                  child: reusableContainer(
                    feMaleCardColor,
                    CardContent(FontAwesomeIcons.venus, 'FEMALE'),
                  ),
                ),
              ),
            ],
          ),
          ),

              Expanded(child:
              reusableContainer(
                activeCardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFF8D8E98),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: const TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Text('cm',
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTickMarkColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],

                ),

        ),
              ),

          Expanded(child: Row(
            children: <Widget>[
              Expanded(child:
              reusableContainer(
                activeCardColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT',
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                      Text(
                        weight.toString(),
                          style: const TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // First button (Plus)
                          IconButton(
                            icon: Icon(Icons.add),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color(0xFF4C4F5E)),
                            ),
                            constraints: BoxConstraints.tightFor(
                              width: 56.0,
                              height: 56.0,
                            ),
                            iconSize: 40.0, // Adjust size as needed
                            color: Colors.white, // Adjust color as needed
                            onPressed: () {
                              setState(() {
                                weight = weight + 1;
                              });
                            },
                          ),
                          SizedBox(width: 12.0), // Add spacing between buttons

                          // Second button (Minus)
                          IconButton(
                            icon: Icon(Icons.remove),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color(0xFF4C4F5E)),
                              // foregroundColor: MaterialStateProperty.all(Color(0xFFE57373)),
                            ),
                            constraints: BoxConstraints.tightFor(
                              width: 56.0,
                              height: 56.0,
                            ),
                            iconSize: 40.0, // Adjust size as needed
                            color: Colors.white, // Adjust color as needed
                            onPressed: () {
                              setState(() {
                                weight = weight - 1;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  )
    ),
              ),
              Expanded(child:
              reusableContainer(
                activeCardColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE',
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                      Text(
                        age.toString(),
                        style: const TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // First button (Plus)
                          IconButton(
                            icon: Icon(Icons.add),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color(0xFF4C4F5E)),
                            ),
                            constraints: BoxConstraints.tightFor(
                              width: 56.0,
                              height: 56.0,
                            ),
                            iconSize: 40.0, // Adjust size as needed
                            color: Colors.white, // Adjust color as needed
                            onPressed: () {
                              setState(() {
                                age = age + 1;
                              });
                            },
                          ),
                          SizedBox(width: 12.0), // Add spacing between buttons

                          // Second button (Minus)
                          IconButton(
                            icon: Icon(Icons.remove),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color(0xFF4C4F5E)),
                              // foregroundColor: MaterialStateProperty.all(Color(0xFFE57373)),
                            ),
                            constraints: BoxConstraints.tightFor(
                              width: 56.0,
                              height: 56.0,
                            ),
                            iconSize: 40.0, // Adjust size as needed
                            color: Colors.white, // Adjust color as needed
                            onPressed: () {
                              setState(() {
                                age = age - 1;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  )
              ),
              ),
            ],
          ),
          ),

          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/first');
            },
            child: Container(
              color: const Color(0xFFEB1555),
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
              alignment: Alignment.center,
              child: Text(
                'CALCULATE',
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
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






