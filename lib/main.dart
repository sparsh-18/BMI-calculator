import 'package:flutter/material.dart';

void main() => runApp(Bmi());

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {

  final TextEditingController _age = new TextEditingController();
  final TextEditingController _height = new TextEditingController();
  final TextEditingController _weight = new TextEditingController();
  String _st="";
  double _res=0;
  void _press() {
    setState(() {
      _res = calculate(_height.text, _weight.text);

      if(_res>0&&_res<18.5)
        _st="Underweight";
      else if(_res>=18.5&&_res<=24.9)
        _st="Normal";
      else if(_res>=25.0&&_res<=29.9)
        _st="Overweight";
      else if(_res>=30.0)
        _st="Obese";
      else
        _st="";
    });
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: new Text("BMI"),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
        ),

        body: new Container(
          padding: EdgeInsets.all(18.0),
          child: ListView(

            children: <Widget>[
              new Image.asset("images/bmi.png",
              height: 100.0,
              width: 100.0,),

              new TextFormField(
                controller: _age,
                decoration: new InputDecoration(
                  labelText: "Age",
                  icon: new Icon(Icons.person),
                ),
              ),

              new TextFormField(
                controller: _height,
                decoration: new InputDecoration(
                  labelText: "Height",
                  icon: new Icon(Icons.insert_chart),
                ),
              ),

              new TextFormField(
                controller: _weight,
                decoration: new InputDecoration(
                  labelText: "Weight",
                  icon: new Icon(Icons.line_weight),
                ),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: new RaisedButton(
                      child: new Text("Calculate"),
                      onPressed: () {
                        setState(() {
                          _press();
                        });
                      },

                      color: Colors.pink,
                  ),
                ),
              ),
              Center(
                child: new Text(
                  _st.isEmpty?"":"Your BMI is $_res",
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: new Text(
                    _st.isEmpty?"":"$_st",
                    style: new TextStyle(
                      fontSize: 25.0,
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static double calculate(String text, String text2) {
    if(text.isNotEmpty && text2.isNotEmpty) {
      double h = double.parse(text);
      double w = double.parse(text2);

      double r = w / (h * h);
      return r;
    }
    else
      return 0.0;
  }
}
