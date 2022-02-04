import 'package:flutter/material.dart';
import 'package:work_sample/main.dart';
import 'package:work_sample/screens/derivative_polynomial_screen.dart';
import 'package:work_sample/screens/linear_screen.dart';
import 'package:work_sample/screens/quadratic_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
     TabController tabController;


  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Material(
        color: Colors.indigo[500],
        shadowColor: Colors.black.withOpacity(0.5),
        child: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(
              icon: Icon(
                Icons.home,
                color: Colors.white,
                size: 35,
              ),
            ),
            new Tab(
              icon: Icon(
                Icons.exit_to_app_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Polynomial Solver',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.indigo[500],
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            }),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {
            },
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2 - 40,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      blurRadius: 20,
                      spreadRadius: 10,
                    )
                  ],
                  color: Colors.indigo[500],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  )),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 83),
                        child: Container(
                          height: 120,
                          width: 240,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/main.png'),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.rectangle,
                              color: Colors.white70,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.deepPurple,
                                  spreadRadius: 2,
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Do not leave your questions unanswered!',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 18),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30, right: 34, left: 34),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LinearPage()));
                          },
                          child: Container(
                            height: 80,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.indigo[500],
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 6,
                                      blurRadius: 4)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                children: <Widget>[
                                  Icon(Icons.close_rounded,
                                      color: Colors.white),
                                  Text(
                                    'Linear Roots',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuadraticPage()));
                          },
                          child: Container(
                            height: 80,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.indigo[500],
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 6,
                                      blurRadius: 4)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.looks_two_rounded,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Quadratic Roots',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 20, color: Colors.black87),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DerivatePage()));
                          },
                          child: Container(
                            height: 80,
                            width: 340,
                            decoration: BoxDecoration(
                                color: Colors.indigo[500],
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 6,
                                      blurRadius: 4)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.calculate,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'derivative of the polynomial',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
