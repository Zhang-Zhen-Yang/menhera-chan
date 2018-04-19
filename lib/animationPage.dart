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

// SingleTickerProviderStateMixin

class AnimationState extends State<AnimationStateful> with TickerProviderStateMixin{
  double imgOpacity = 1.0;
  AnimationController ac;
  double initValue = 0.0;

  AnimationController ac2;
  Animation a2;
  Animation a3;
  Animation reverseAnimation;
  Animation a4;
  Animation a5;
  

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

    ac2 = new AnimationController(duration: const Duration(seconds: 3), vsync: this);
    a2 = new Tween(begin: 200.0,end: 300.0).animate(ac2);

    final CurvedAnimation ca = new CurvedAnimation(parent: ac2, curve: Curves.easeIn);
    a3 = new Tween(begin: 200.0,end: 300.0).animate(ca);

    reverseAnimation = new ReverseAnimation(ac2);
    a4 = new Tween(begin: 200.0,end: 300.0).animate(reverseAnimation);

    a5 = new ColorTween(begin: Colors.teal,end: Colors.yellow).animate(ac2);
  }

  @override
  void dispose() {
    ac.dispose();
    ac2.dispose();
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
                ac2.forward(from: 0.0);
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
          ),
          new AnimatedRoundImage(animation: a2, fun: (){
            ac2.forward(from: 0.0);
          }),
          new Center(
            child: new AnimatedBuilder(
              child: new Text('AnimatedBuilder'),
              animation: a4,
              builder: (BuildContext context, Widget child){
                return new Container(
                  margin: new EdgeInsets.symmetric(vertical: 100.0),
                  color: a5.value,
                  child: child,
                  width: a4.value,
                  height: a4.value,
                );
              },
            )
          )
        ],
      ),
    );
  }
}

class AnimatedRoundImage extends AnimatedWidget{
  Function fun;
  AnimatedRoundImage({Key key, Animation<double> animation, Function fun}):super(key:key, listenable: animation){
    this.fun = fun;
  }

  @override
  Widget build(BuildContext context){
    final Animation<double> ani = listenable;
    return new Center(
      child: new GestureDetector(
        onTap: (){
          print('tap');
          fun();
        },
        child: new Container(
          decoration: new BoxDecoration(
            color: Colors.yellow[600],
            borderRadius: new BorderRadius.all(new Radius.circular(ani.value / 2)),
            image: new DecorationImage(
              image: new NetworkImage('http://p9.pstatp.com/large/9aa0003fa8213724981'),
              fit: BoxFit.cover
            ),
          ),
          /*foregroundDecoration: new BoxDecoration(
            image: new DecorationImage(
              image: new NetworkImage('http://p9.pstatp.com/large/9aa0003fa8213724981'),
              fit: BoxFit.cover
            ),
            borderRadius: new BorderRadius.all(new Radius.circular(ani.value / 2))
          ),*/
          //child: new Image.network('http://img2.178.com/acg1/201312/181193085837/181196147567.jpg'),
          width: ani.value,
          height: ani.value,
        )
      ), 
    ) ;
  }
}