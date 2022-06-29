import 'package:flutter/material.dart';
import 'package:bmi_calculator/app_constants.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor :Color(0xFF4C4F5E) ,
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
              color: Colors.white,
              //color: Color(0xFF3F51B5),
              //fontWeight: FontWeight.bold,
              fontSize: 40,
              fontFamily: 'IndieFlower',
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        //backgroundColor: Colors.pinkAccent,
        elevation: 0,
        centerTitle: true,
      ),
       backgroundColor: mainHexColor,
      //backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: 250.0,
              height: 250.0,
              margin: const EdgeInsets.only(
                top: 20.0,
                right: 12.0,
                left: 12.0,
              ),
              decoration: BoxDecoration(
                  color: const Color(0xFF7349FE) ,
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(
                    color:Color(0xFF86829D),
                    width: 1.5,
                  )
              ),
              child: const Image(
                image: AssetImage(
                  'assets/bmmi.png',
                ),
              ),
            ),
            SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Height',
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Weight',
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = 'OverWeight';
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = 'Normal weight';
                  } else {
                    _textResult = 'Under weight';
                  }
                });
              },
              child: Container(
                padding: EdgeInsets.only(
                  right:20.0,
                  left: 20.0,
                  top: 5,
                  bottom:5,
                ),
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  "CALCULATE",
                  style: TextStyle(
                    fontSize: 34,
                    //fontWeight: FontWeight.bold,
                    //color: accentHexColor,
                    //color: Color(0xFF3F51B5),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Visibility(
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w400,
                    color: accentHexColor,
                    //color: Colors.lightBlueAccent,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50,),
            Container(
              child: const Text(
                'Made by: Himanshu Bansal(102103568)',
                style:TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
