import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel/carousel.dart';
import 'package:image_carousel/image_carousel.dart';
import 'dart:async';
import 'third.dart' show ThirdPage;
import 'forth.dart' show ForthPage;
import 'sliver.dart' show Sliver;
import 'NestedScrollViewPage.dart' show Nested;
import 'five.dart' show Five;
import 'buttons.dart' show ButtonPage;
import 'containerPage.dart' show ContainerPage;
import 'animationPage.dart' show AnimationPage;
import 'constraintPage.dart' show ConstraintPage;
import 'gesturePage.dart' show GesturePage;
import 'netWorkPage.dart' show NetWorkPage;
import 'draggablePage.dart' show DraggablePage;
import 'CustomPaint.dart' show CustomPaintPage;
import 'flowpage.dart' show FlowPage;
import 'pageviewpage.dart' show PageViewPage;
import 'physicsPage.dart' show PhysicPage;

class Todo{
  String title;
  String description;
  Todo(this.title, this.description);
}

class SecondPage extends StatelessWidget {
  // This widget is the root of your application.
  String tag = 'SecondPage';
  @override
  Widget build(BuildContext context) {
    /*return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      // debugShowMaterialGrid: true,
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(title: 'Flutter Demo Second Page'),
    );*/
    return new MyHomePage(title: 'Flutter Demo Second Page');
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  String tag = 'StatefulWidget';
  int count = 0;
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  int _counter = 0;
  String results = '';
  String tag = '_MyHomePageState';
  final TextEditingController controller = new TextEditingController();
  TabController imgTabController;

  @override
  initState(){
    super.initState();
    imgTabController = new TabController(
      vsync: this,
      length: 4
    )..addListener((){
      // print(imgTabController.index);
    });
    print(widget.tag);
    new Timer.periodic(new Duration(seconds: 1), (Timer timer){
      setState((){
        widget.count++; 
      });
    });
  }

  void _incrementCounter(BuildContext context) {
    setState(() {
      _counter += 2;
    });
    // 显示alertDialog
    /*showDialog(
      context: context,
      barrierDismissible: true,
      child: new AlertDialog(
        title: new Text('Select assignment'),
        content: new Text('hello world'),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Regret1'),
            onPressed: () {
              // Navigator.of(context).pop();
            },
          ),
          new RaisedButton(
            child: new Text('Regret3'),
            color: Colors.blue[500],
            textColor: Colors.white,
            onPressed: () {},
          )
        ]
      ),
    );*/
    SnackBar sbar = new SnackBar(
      content: new Text('snackbar'),
      backgroundColor: Colors.teal,
      action: new SnackBarAction(
          label: 'one tow three',
          onPressed: () {print('dd');}
      ),
    );
    Scaffold.of(context).showSnackBar(sbar);
  }
  void _reset(){
    setState((){
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        //leading: new Icon(Icons.home),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.playlist_play),
            tooltip: 'one',
            onPressed: (){}
          ),
          new PopupMenuButton(
            itemBuilder: (BuildContext context)=><PopupMenuItem<String>>[
              new PopupMenuItem<String>(
                value: 'one',
                child: new Text('one item')
              ),
              new PopupMenuItem<String>(
                value: 'two',
                child: new Text('two item')
              ),
            ],
            onSelected: (action){
              switch(action){
                case 'one':print('one');break;
                case 'two':print('two');break;
              }
            },
          )
        ]
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('User Name'),
              accountEmail: new Text('email@example.com'),
              currentAccountPicture:
                new CircleAvatar(
                  //backgroundImage: new AssetImage('image/a.jpg')
                  child: new GestureDetector(
                    onTap: (){
                      print('tap');
                    },
                    child: new Container(
                      decoration: new BoxDecoration(
                        borderRadius:  new BorderRadius.all(const Radius.circular(10.0)),
                        color: Colors.teal[500]
                      ),
                      child: new Image.network('http://p1.pstatp.com/large/pgc-image/152319026115627d7325d4c'),
                      padding: new EdgeInsets.all(10.0)
                    )
                  ) 
                ),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(backgroundImage: new AssetImage('image/b.png')),
                new CircleAvatar(backgroundImage: new AssetImage('image/c.jpg')),
              ],
              onDetailsPressed: () {
                print('dddddddddd');
              },
            ),
            new ListTile(    //第二个功能项
              title: new Text('Second Page'),
              trailing: new Icon(Icons.arrow_right),
            ),
            new Divider(), 
            new ListTile(    //退出按钮
              title: new Text('Close'),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),    //点击后收起侧边栏
            ),
            // 
            new ListTile( 
              title: new Text('Third page'),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>new ThirdPage(todo: new Todo('番号', 'mehera酱'))));
              }
            ),
            // sliver
            new ListTile( 
              title: new Text('sliver page'),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>new Sliver()));
              }
            ),
            // nested
            new ListTile( 
              title: new Text('nested page'),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>new Nested()));
              }
            ),
            // nested
            new ListTile( 
              title: new Text('five page'),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>new Five()));
              }
            ),
            // buttons
            new ListTile( 
              title: new Text('button page'),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>new ButtonPage()));
              }
            ),
            // containerPage
            new ListTile( 
              title: new Text('container page'),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>new ContainerPage()));
              }
            ),
            // animationPage
            new ListTile( 
              title: new Text('animation page'),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>new AnimationPage()));
              }
            ),
            // ConstraintPage
            new ListTile( 
              title: new Text('Constraint Page'),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>new ConstraintPage()));
              }
            ),
            // GesturePage
            new ListTile( 
              title: new Text('Gesture Page'),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>new GesturePage()));
              }
            ),
            // NetWorkPage
            new ListTile( 
              title: new Text('NetWork page'),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>new NetWorkPage()));
              }
            ),
            // DraggablePage
            new ListTile( 
              title: new Text('DraggablePage'),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>new DraggablePage()));
              }
            ),
            // CustomPaintPage
            new ListTile( 
              title: new Text('CustomPaintPage'),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>new CustomPaintPage()));
              }
            ),
            // FlowPage
            new ListTile( 
              title: new Text('FlowPage'),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>new FlowPage()));
              }
            ),
            // PageViewPage
            new ListTile( 
              title: new Text('PageViewPage'),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                /*Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>new PageViewPage()));*/
                Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(builder: (context)=>new PageViewPage()),
                  (Route route){return true;}
                );
              }
            ),
            // PageViewPage
            new ListTile( 
              title: new Text('PhysicPage'),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                /*Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>new PageViewPage()));*/
                Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(builder: (context)=>new PhysicPage()),
                  (Route route){return true;}
                );
              }
            ),
            new ClipRect(
              child: new GestureDetector(
                child: new Text('cupertino', style: new TextStyle(fontSize: 30.0)),
                onTap: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context)=>new ForthPage()));
                },
              ) 
            ),
            new Image.network('http://p1.pstatp.com/large/pgc-image/152319026115627d7325d4c'),
            new Image.network('http://p1.pstatp.com/large/pgc-image/152319026115627d7325d4c'),
            new Image.network('http://p1.pstatp.com/large/pgc-image/152319026115627d7325d4c'),
            new Image.network('http://p1.pstatp.com/large/pgc-image/152319026115627d7325d4c'),
          ],
        )
      ),
      body: new Center(
        child: new ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*new Slider(
              value: 2.0,
              label: 'apple',
              onChanged: (e){

              },
            ),*/
            /* new CarouselSlider(
              viewportFraction: 1.0,
              items: [1,2,3,4,5].map((i) {
                return new Builder(
                  builder: (BuildContext context) {
                    return new Container(
                      width: MediaQuery.of(context).size.width,
                      margin: new EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: new BoxDecoration(
                        color: Colors.amber
                      ),
                      child: new Text('text $i', style: new TextStyle(fontSize: 16.0),)
                    );
                  },
                );
              }).toList(),
              height: 400.0
            ),*/
            /*new SizedBox(
              height: 240.0,
              child: new Carousel(
                children: [
                  new NetworkImage('https://p1.ssl.qhmsg.com/dmfd/177_99_80/ss/40_130/t0188968f68891aa78e.jpg'),
                  new NetworkImage('https://p1.ssl.qhmsg.com/dmfd/177_99_80/ss/40_130/t01730d78d390e5e3de.jpg')
                ].map((netImage) => new Image(image: netImage)).toList(),
               
              ),
            ),*/
            new Center(
              child: new ImageCarousel(
                <ImageProvider>[
                  new NetworkImage('http://p4.so.qhmsg.com/bdr/200_200_/t01f11ddc3b90c6aaf9.png'),
                  new NetworkImage('http://pic3.178.com/594/5944654/month_1407/110dfaae1ac91217f5dc4d7e312b92c8.jpg'),
                  new NetworkImage('http://ww1.sinaimg.cn/mw690/be5be7f9jw1ecgj14r7uvj215o0wcnfi.jpg'),
                  new NetworkImage('http://img5.duitang.com/uploads/item/201407/28/20140728101936_ABajk.thumb.700_0.jpeg'),
                ],
                interval: new Duration(seconds: 1),
                height: 350.0,
                tabController: imgTabController,
                allowZoom: true,
              ),
            ),
            new Text(
              '${widget.count}'
            ),
            new Text(
              'You have pushed the button this many times rrr:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            new Container(
              /*foregroundDecoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage('http://p1.pstatp.com/large/pgc-image/152319026115627d7325d4c'),
                  centerSlice: new Rect.fromLTRB(20.0, 10.0, 30.0, 20.0),
                ),
              ),*/
              width: 200.0,
              height: 200.0,
              padding: const EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0),
              decoration: new BoxDecoration(
                color: Colors.blue[500],
                border: new Border.all(width: _counter.toDouble()),
                borderRadius: new BorderRadius.circular(5.0)
              ), 
              child: new Image.network('http://p3.pstatp.com/large/pgc-image/15231902324431c7e3eab16'),
              //child: new Text('Hello World', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
            ),
            new Row(
              children: <Widget>[
                new GestureDetector(
                  onTap: _reset,
                  child: new Container(
                    width: 200.0,
                    child: new Image.network('http://p1.pstatp.com/large/pgc-image/15231902422872a72b06f2b')
                  ),
                ),
                new Expanded(child: new Text('apple')),
                new Container(
                  width: 200.0,
                  child: new Image.network('http://p1.pstatp.com/large/pgc-image/15231902514328d0f2baec9')
                )
              ],
            ),
            new TextField(
              decoration: new InputDecoration(hintText: "Enter text here..."),
              onSubmitted: (String str) {
                setState(() {
                  results = results + "\n" + str;
                  // controller.text = "";
                });
              },
              controller: controller,
            ),
            new Image.network('http://p9.pstatp.com/large/pgc-image/15231903016633705337670'),
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

            )
          ],
        ),
      ),
      floatingActionButton: new Builder(
        builder: (BuildContext context){
          return new FloatingActionButton(
            onPressed:(){
              /*Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text('Hello!'),
              ));*/
              _incrementCounter(context);
            },
            tooltip: 'Increment',
            child: new Icon(Icons.add),
          );
        }
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
