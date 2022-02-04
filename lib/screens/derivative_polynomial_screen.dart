import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:math';


class DerivatePage extends StatefulWidget {
  @override
  _DerivatePageState createState() => _DerivatePageState();
}

class _DerivatePageState extends State<DerivatePage> {
  String a = " ";
  double root1 = 0;
  int value = 0;
  final formKey = GlobalKey<FormState>();
  TextEditingController t1 = TextEditingController(text: '');
  TextEditingController t2 = TextEditingController(text: '');

  doGeneralQuadraticFormula() {
    setState(() {

      value = int.parse(t2.text);

      double derivativeTerm( pTerm, int val) {
        // Get coefficient
        String coeffStr = "";
        int i;
        for (i = 0; pTerm[i] != 'x'; i++) {
          if (pTerm[i] == ' ')continue;

          coeffStr += (pTerm[i]);
        }
        double coeff = double.parse(coeffStr);
        // Get Power (Skip 2 characters for x and ^)
        String powStr = "";
        for (i = i + 2; i != pTerm.length && pTerm[i] != ' '; i++){
          powStr += pTerm[i];
        }
        double power = double.parse(powStr);
        // For ax^n, we return a(n)x^(n-1)
        return coeff * power * pow(val, power - 1);
      }

      double derivativeVal(String poly, int val) {
        double ans = 0;
        int i = 0;
        List<String> stSplit = poly.split('+');

        while (i < stSplit.length){
          ans = ans + derivativeTerm(stSplit[i], val);
          i++;
        }
        return ans;
      }
      root1 = derivativeVal(t1.text,value);
      print(root1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Derivative of a Polynomial',
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
                        'The Result :',
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
                    'f: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(255, 255, 136, 34),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'polynomial',
                          labelStyle: TextStyle(fontSize: 15)),
                      controller: t1,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'x: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(255, 255, 136, 34),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'the value of x',
                          labelStyle: TextStyle(fontSize: 15)),
                      controller: t2,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
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
                      Text('Derivative of a Polynomial\nequations appear in the format',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.red),
                          textAlign: TextAlign.center),
                    ],
                  ),
                  Text('ax³ = ax^3',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.red),
                      textAlign: TextAlign.center),

                  Text('False -> x + 2  ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.red),
                      textAlign: TextAlign.center),

                  Text('  True -> 1x + 2',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
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
