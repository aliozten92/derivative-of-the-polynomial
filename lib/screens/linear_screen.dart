import 'package:flutter/material.dart';
import 'dart:math';

class LinearPage extends StatefulWidget {
  @override
  _LinearPageState createState() => _LinearPageState();
}

class _LinearPageState extends State<LinearPage> {
  double a = 0,
      b = 0,
      c = 0,
      discr = 0,
      root1 = 0,
      res = 0,
      real = 0,
      imag = 0; //res = Result...................
  final formKey = GlobalKey<FormState>();
  TextEditingController t1 = TextEditingController(text: '');
  TextEditingController t2 = TextEditingController(text: '');

  doGeneralQuadraticFormula() {
    setState(() {
      a = double.parse(t1.text);
      b = double.parse(t2.text);

      root1 = ((-1 * b) / a);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Linear Solver',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.indigo[500],
      ),
      body: Container(
        child: SingleChildScrollView(
          key: formKey,
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                color: Colors.indigo[500],
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 35, 15.0, 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'The Roots is:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '$root1',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(height: 20, color: Colors.red),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'a:  ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(255, 255, 136, 34),
                    ),
                  ),
                  SizedBox(
                    width: 270,
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'coefficent of x',
                          labelStyle: TextStyle(fontSize: 15)),
                      controller: t1,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'b:  ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(255, 255, 136, 34),
                    ),
                  ),
                  SizedBox(
                    width: 299,
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'the constant',
                          labelStyle: TextStyle(fontSize: 15)),
                      controller: t2,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    elevation: 8,
                    onPressed: () {
                      //TODO:
                      doGeneralQuadraticFormula();
                      print('$root1');
                    },
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    textColor: Colors.white,
                    color: Color.fromARGB(255, 255, 136, 34),
                  ),
//                  SizedBox(height: 90),
                ],
              ),
              Divider(height: 30, color: Colors.red),
              SizedBox(height: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Quadratic equations appear in the format',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.red),
                          textAlign: TextAlign.center),
                    ],
                  ),
                  Text('ax + b = 0',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.red),
                      textAlign: TextAlign.center),
                  Text('where a, b and c are real numbers and a != 0.',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.red),
                      textAlign: TextAlign.center),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
