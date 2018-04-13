import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'second.dart' show Todo;
import 'BarChartPainter.dart';
/*class ThirdPage extends StatelessWidget {
  final Todo todo;
  // This widget is the root of your application.
  ThirdPage({Key key, this.todo}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.teal,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page', todo: todo),
    );
  }
}*/

class ThirdPage extends StatefulWidget {
  ThirdPage({Key key, this.title, this.todo}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final Todo todo;

  @override
  _MyHomePageState createState() => new _MyHomePageState(todo);
}

class _MyHomePageState extends State<ThirdPage> {
  static const platform = const MethodChannel('samples.flutter.test/plugin');
  int _counter = 0;
  String _returnData = '';
  final Todo todo;
  int dataSet = 0;
  int cuper = 0;
  double opacityLevel = 1.0;
  Random random = new Random();
  
  _MyHomePageState(this.todo);

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter += 2;
    });
  }
  void _second(){
    setState((){
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text('third Page'),
        flexibleSpace: new Image.network('http://p1.pstatp.com/large/pgc-image/1523190216006bbb8185de9'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'third page ${todo.title} ${todo.description}',
              style: new TextStyle(fontSize: 40.0)
            ),
            new Text(
              _returnData,
              style: new TextStyle(fontSize: 30.0, color: Colors.teal)
            ),
            new Text(
              dataSet.toString()
            ),
            new CustomPaint(
              size: new Size(200.0, 100.0),
              painter: new BarChartPainter(dataSet.toDouble())
            ),
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            new Text('cupertino $cuper clicked'),
            new ImageBtn((){
              setState((){
                cuper++;
              });
              print('cupertino');
            }, (){
              setState(
                () => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0
              );
              // print('c2');
            }),
            new GestureDetector(
              onTap:_second,
              child:new AnimatedOpacity(// 使用一个AnimatedOpacity Widget
                opacity: opacityLevel,
                duration: new Duration(seconds: 1),//过渡时间：1
                child:new Image.network('http://p1.pstatp.com/large/pgc-image/1523190216006bbb8185de9')
              )
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _dataInteraction,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<Null> _dataInteraction() async {
    _incrementCounter();
    changeData();
    String returnData;
    try {
      final int result = await platform.invokeMethod('dataInteraction');
      returnData = '平台返回数据：$result';
    } on PlatformException catch (e) {
      returnData = '错误信息：${e.message}';
    }
    
    setState((){
      _returnData = returnData;
    });
  }
  void changeData() {
    setState(() {
      // print(random.nextInt(100));
      dataSet = random.nextInt(100);
    });
  }

}


class ImageBtn extends StatefulWidget{
  final Function callback;
  final Function callback2;

  ImageBtn(this.callback, this.callback2);
  ImageBtnState createState() => new ImageBtnState(callback, callback2);
}

class ImageBtnState extends State<ImageBtn>{
  final Function callback;
  final Function callback2;
  var value = false;
  ImageBtnState(this.callback, this.callback2);
  
  @override
  Widget build(BuildContext context){
    return new Column(
      children: <Widget>[
        // button
        new Container(
          child: new CupertinoButton(
            child: new Text('cupertino'),
            onPressed: callback,
            color: Colors.teal
          ),
        ),
        // switch
        new CupertinoSwitch(
          value: value,
          activeColor: Colors.yellow,
          onChanged: (e){
            callback2();
            print(e);
            setState((){
              value = !value;
            });
          },
        )
      ],
    );
  }

  @override
  initState(){
    super.initState();
    new Future(() => 21)
    .then((v) => v*2)
    .then((v) => print(v));

    print(new DateTime.now());
    new Future.delayed(const Duration(seconds:1), () {
      //任务具体代码
      print(new DateTime.now());
    });
  }
}
