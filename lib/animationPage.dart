import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/animation.dart';
import 'dart:ui' show lerpDouble;

class AnimationPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => new AnimationStateful();
}

class AnimationStateful extends StatefulWidget{
  AnimationStateful({Key key}):super(key: key);

  @override
  createState() => new AnimationState();
}

class AnimationState extends State<AnimationStateful> with TickerProviderStateMixin{
  double imgOpacity = 1.0;
  AnimationController ac;
  double initValue = 0.0;

  @override
  void initState(){
    super.initState();
    ac = new AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..addListener((){
      setState((){
        initValue = ac.value;
      });
    });
    // ac.forward();
  }

  @override
  void dispose() {
    ac.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Animation'),
      ),
      body: new ListView(
        children: <Widget>[
          new Center(
            child: new RaisedButton(
              child: new Text('opacity'),
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: (){
                setState((){
                  imgOpacity == 1.0 ? (imgOpacity = 0.0 ) : (imgOpacity = 1.0 );
                });
              },
            ),
          ),
          new Center(
            child: new AnimatedContainer(
              child: new AnimatedOpacity(
                opacity: imgOpacity,
                child: new Image.network('http://img2.178.com/acg1/201312/181193085837/181196147567.jpg'),
                duration: new Duration(seconds: 3),
                curve: Curves.ease,
              ), 
              duration: new Duration(seconds: 3),
              curve: Curves.ease,
            )
          ),
          new Center(
            child: new RaisedButton(
              color: Colors.teal,
              textColor: Colors.white,
              child: new Text('animation controller'),
              onPressed: (){
                print('22');
                ac.forward(from: 0.0);
              },
            )
          ),
          new Center(
            child: new Container(
              child: new Center(
                child: new Text(initValue.toString(), style: new TextStyle(color: Colors.white)),
              ),
              width: initValue * 100 + 10.0,
              color: Colors.teal,
              height: 50.0
            ) 
          )
        ],
      ),
    );
  }
}