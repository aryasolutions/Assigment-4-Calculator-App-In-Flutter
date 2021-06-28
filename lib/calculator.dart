import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  // const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";
  Widget btn(var textt) {
    return GestureDetector(
        onTap: () {
          setState(() {
            result = result + textt;
          });
        },
        child: new Container(
          width: 65.0,
          padding: new EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 18.0),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(100.0),
            color: Color.fromRGBO(221, 105, 105, 10),
            boxShadow: [
              BoxShadow(
                color: Colors.red.shade200.withOpacity(0.8),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(-1, 5), // changes position of shadow
              ),
            ],
          ),
          child: new Column(children: [
            new Text(
              textt,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ]),
        ));
  }

  clearr() {
    setState(() {
      result = "";
    });
  }

  del() {
    // var length0 = result.length;
    setState(() {
      result = result.substring(0, result.length - 1);
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double evel = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = evel.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: new EdgeInsets.only(top: 22),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromRGBO(221, 105, 105, 10),
        // decoration: BoxDecoration(
        //   borderRadius: new BorderRadius.circular(20.0),
        // ),
        child: Container(
          padding: new EdgeInsets.fromLTRB(8.0, 0, 8, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Text(
                  "Calculator",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      shadows: [
                        Shadow(
                            offset: Offset(-1, 5),
                            blurRadius: 4,
                            color: Colors.white)
                      ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width / 1.0,
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Color.fromRGBO(221, 105, 105, 10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.shade200.withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(-1, 5), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    result,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: clearr,
                      child: new Container(
                        width: 65.0,
                        padding:
                            new EdgeInsets.fromLTRB(22.0, 22.0, 22.0, 22.0),
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(100.0),
                          color: Color.fromRGBO(221, 105, 105, 10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.shade200.withOpacity(0.8),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(-1, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: new Column(children: [
                          new Text(
                            "C",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      )),
                  GestureDetector(
                      onTap: del,
                      child: new Container(
                        width: 65.0,
                        padding:
                            new EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(100.0),
                          color: Color.fromRGBO(221, 105, 105, 10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.shade200.withOpacity(0.8),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(-1, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: new Column(children: [
                          new Text(
                            "Del",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      )),
                  btn("%"),
                  btn("*"),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btn("1"),
                  btn("2"),
                  btn("3"),
                  btn("/"),
                ],
              ),
                SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btn("4"),
                  btn("5"),
                  btn("6"),
                  btn("-"),
                ],
              ),
               SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btn("7"),
                  btn("8"),
                  btn("9"),
                  btn("+"),
                 ],
              ),
  SizedBox(
                height: 15,
              ),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btn("."),
                  btn("0"),
                  btn("00"),
                  GestureDetector(
                      onTap: output,
                      child: new Container(
                        width: 65.0,
                        padding:
                            new EdgeInsets.fromLTRB(22.0, 22.0, 22.0, 22.0),
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(100.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.shade200.withOpacity(0.8),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(-1, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: new Column(children: [
                          new Text(
                            "=",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ]),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
