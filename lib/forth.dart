import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';
class ForthPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 2;
    });
  }
  void _second(){
    setState((){
      _counter = 0;
    });
    // Navigator.push(context, new MaterialPageRoute(builder: (context) => new SecondPage()));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'forth page',
              style: new TextStyle(fontSize: 30.0, color: Colors.teal)
            ),
            new CupertinoButton(
              child: new Text('cupertino'),
              onPressed: (){},
              color: Colors.teal
            ),
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            new Container(
              constraints: new BoxConstraints.expand(
                height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
              ),
              child: new Text('container'), 
              alignment: Alignment.center,
              color: Colors.yellow[600],
              foregroundDecoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage('http://p1.pstatp.com/large/pgc-image/1523190216006bbb8185de9'),
                  // centerSlice: new Rect.fromLTRB(20.0, 20.0, 20.0, 20.0),
                )
              ),
              transform: new Matrix4.rotationZ(0.02)
            ),
            new RichText(
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              text: new TextSpan(
                text: 'menhera'.toUpperCase(),
                style: new TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 50.0),
                children:<TextSpan>[
                  new TextSpan(text: ' 酱', style: new TextStyle(color: Colors.yellow[700])),
                  new TextSpan(
                    text: ' The RichText widget displays text that uses multiple different styles. The text to display is described using a tree of TextSpan objects, each of which has an associated style that is used for that subtree. The text might break across multiple lines or might all be displayed on the same line depending on the layout constraints.',
                    style: new TextStyle(
                      color: Colors.teal,
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal
                    )
                  ),

                ]
              ),
            ),
            new Wrap(
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 10.0, // gap between lines
              children: <Widget>[
                new Chip(
                  avatar: new CircleAvatar(backgroundColor: Colors.blue.shade900, child: new Text('AH')),
                  label: new Text('Hamilton'),
                ),
                new Chip(
                  avatar: new CircleAvatar(backgroundColor: Colors.blue.shade900, child: new Text('ML')),
                  label: new Text('Lafayette'),
                ),
                new Chip(
                  avatar: new CircleAvatar(backgroundColor: Colors.blue.shade900, child: new Text('HM')),
                  label: new Text('Mulligan'),
                ),
                new Chip(
                  avatar: new CircleAvatar(backgroundColor: Colors.blue.shade900, child: new Text('JL')),
                  label: new Text('Laurens'),
                ),
                new Chip(
                  avatar: new CircleAvatar(backgroundColor: Colors.teal, child: new Text('酱')),
                  label: new Text('Laurens'),
                ),
                new Chip(
                  avatar: new CircleAvatar(backgroundColor: Colors.teal, child: new Text('酱')),
                  label: new Text('Mehera'),
                ),
              ],
            ),
            new Transform(
              child: new Image.network('http://p1.pstatp.com/large/pgc-image/1523190216006bbb8185de9'),
              transform: new Matrix4.rotationZ(pi / 180 *180.0)..scale(0.5),
              alignment: Alignment.center
            )
            /*new GestureDetector(
              onTap:_second,
              child:new Image.network('http://p1.pstatp.com/large/pgc-image/1523190216006bbb8185de9')
            )*/
            
          ],
        ),
      ),
      
    );
  }
}
