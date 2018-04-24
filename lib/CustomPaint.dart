import 'package:flutter/material.dart';

class CustomPaintPage extends StatelessWidget{
  @override
  Widget build (BuildContext context) => new CustomPaintWidget();
}

class CustomPaintWidget extends StatefulWidget{

  @override
  createState()=> new CustomPaintState();
}

class CustomPaintState extends State<CustomPaintWidget>{

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('CustomPaintPage'),
      ),
      body: new ListView(
        children: <Widget>[
          new Center(
            child: new Container(
              child: new Image.network('http://img2.178.com/acg1/201312/181193085837/181196147567.jpg'),
              width: 200.0
            )
          ),
          new CustomPaint(
            size: new Size(200.0, 300.0),
            painter: new Sky(20.0),
          )
        ],
      ),
    );
  }
}

class Sky extends CustomPainter{
  double radius;
  Sky(this.radius);
  @override
  void paint(Canvas canvas, Size size){
    Paint p = new Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.fill;
    
    canvas
    ..drawColor(Colors.red,BlendMode.darken)
    ..drawCircle(
      new Offset(20.0, 30.0),
      radius,
      p
    );
  }

  @override
  bool shouldRepaint(Sky old){
    //return false;
    return radius != old.radius;
  }
}