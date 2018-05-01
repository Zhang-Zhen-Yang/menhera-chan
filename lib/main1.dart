import 'package:flutter/material.dart';
import 'second.dart' show SecondPage;
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  initState(){

    super.initState();



    /*print('--------------------------------------------------------');
    int figureA = -93;
    // figureA是否为负数
    print(figureA.isNegative);
    // figureA是否是有限的
    print(figureA.isFinite);
    // figureA是否正无穷大或负无穷大
    print(figureA.isInfinite);

    print(figureA.abs());
    print(figureA.sign);
    print('--------------------------------------------------------');
    print(new Text('ddddd').runtimeType);

    String str = "86";
    print(str.padLeft(4, '0'));
    print(str.padRight(4, '0'));

    RegExp exp = new RegExp(r"(\w+)");
    // 返回正则表达式匹配项的可迭代对象
    print(exp.allMatches("abc def ghi"));
    // 搜索并返回第一个匹配项，没有则返回null
    print(exp.firstMatch(""));
    // 正则表达式是否找到匹配项
    print(exp.hasMatch("as"));
    // 从第几个字符开始匹配正则表达式
    print(exp.matchAsPrefix("ab cd", 3));
    // 返回正则表达式的第一个匹配字符串
    print(exp.stringMatch("abc de"));
    // 返回正则表达式的字符串表示
    print(exp.toString());

    print('手机----------------------------------------');
    RegExp mobile = new RegExp(r"(0|86|17951)?(13[0-9]|15[0-35-9]|17[0678]|18[0-9]|14[57])[0-9]{8}");
    Iterable<Match> mobiles = mobile.allMatches("13812345678 12345678901 17012345678");
    for (Match m in mobiles) {
        String match = m.group(0);
        print(match);
    }*/

    // List
    /*List growableList = new List.from([1, 2, 3, 3, 3, 4]);
    growableList.replaceRange(1,3,['apple', 'orange']);
    print(growableList.sublist(1));
    print(growableList);

    List grow2 = new List.generate(10, (int index){
      return 'apple$index';
    });
    grow2
    ..setAll(3, ['orange','lemon','phone'])
    ..shuffle();

    print(grow2);*/

    // Map
    Map<String, String> map1 = {'a':'apple','b': 'banana','o': 'orange'};
    print(map1.runtimeType);
    print(map1.keys);
    print(map1.values);
    print(map1.isEmpty);
    print(map1.length);

    map1.forEach((key, value){
      print('key: $key;value: $value');
    });

    print(map1.containsKey('a'));
    print(map1.containsValue('orange'));
    map1.putIfAbsent('l', (){
      return 'lemon';
    });

    map1['l']='linux';
    print(map1);

  
  }

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
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new SecondPage()));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            new GestureDetector(
              onTap:_second,
              child:new Image.network('http://p1.pstatp.com/large/pgc-image/1523190216006bbb8185de9')
            )
            
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
