import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';
import 'dart:io';
import 'dart:async';
import 'dart:convert' hide Codec;
import 'package:flutter/services.dart';

class CustomPaintPage extends StatelessWidget{
  @override
  Widget build (BuildContext context) => new CustomPaintWidget();
}

class CustomPaintWidget extends StatefulWidget{

  @override
  createState()=> new CustomPaintState();
}

class CustomPaintState extends State<CustomPaintWidget>{
  var radius = 20.0;
  var imageInfo;
  var networkImageInfo;


  @override
  initState(){
    super.initState();
    testJSON();
    new Timer(new Duration(seconds: 2),(){
      setState((){
        radius = 30.0;
      });
    });

    var sunImage = new ExactAssetImage("image/a.jpg");
    //var networkImage = new NetworkImage('http://img2.178.com/acg1/201312/181193085837/181196147567.jpg');

    // 本地图片
    sunImage.obtainKey(new ImageConfiguration()).then((AssetBundleImageKey key){
      print('-----------------------------------------------------------------');
      print(key);
      _loadImage(key).then((Codec codec){
        print("frameCount: ${codec.frameCount.toString()}");
        codec.getNextFrame().then((info){
          print("image: ${info.image.toString()}");
          print("duration: ${info.duration.toString()}");
          imageInfo = info.image;
          
          print('set imageInfo');
          // canvas.drawImage(info.image, size.center(Offset.zero), p);
        });
      });
    });

    loadNetWorkImage().then((res){
      print('res:$res');
      res.getNextFrame().then((info){
        this.setState((){
          this.networkImageInfo = info.image;
        });
      });
      
    });

    // 网络图片
    /*networkImage.obtainKey(new ImageConfiguration()).then((NetworkImage key){
      print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
      print(key);
    });*/

  }

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
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: new Image.network('http://img2.178.com/acg1/201312/181193085837/181196147567.jpg'),
                // child: new Text('ddddddddddddddd', style: new TextStyle(color: Colors.teal,fontSize: 50.0)),
              ),
              width: 200.0
            )
          ),
          new Center(
            child: new Container(
              /*constraints: new BoxConstraints.expand(
                height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
              ),*/
              // padding: const EdgeInsets.all(8.0),
              // color: Colors.teal.shade700,
              alignment: Alignment.center,
              child: new Text('Hello World', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
              foregroundDecoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage('http://img2.178.com/acg1/201312/181193085837/181196147567.jpg'),
                  // centerSlice: new Rect.fromLTRB(0.0, 0.0, 100.0, 730.0),
                ),
              ),
              color: Colors.teal,
              width: 400.0,
              height: 400.0
              // transform: new Matrix4.rotationZ(0.1),
            )
          ),
          new Center(
            child: new Offstage(
              child: new Image.asset('image/c.jpg'),
              offstage: true,
            )
          ),
          /*new Center(
            child: new IndexedStack(
              children: <Widget>[
                new Text('one'),
                new Text('two'),
                new Image.network('http://img2.178.com/acg1/201312/181193085837/181196147567.jpg'),
              ],
              index: 2,
            )
          ),*/
          new Center(
            child: new Table(
              children: <TableRow>[
                new TableRow(
                  children: [
                    new Text('one'),
                    new Text('two'),
                    new Text('three'),
                  ]
                ),
                new TableRow(
                  children: [
                    new Text('one 1'),
                    new Text('two 1'),
                    new Text('three 1'),
                  ]
                ),
              ],
            )
          ),
          new CustomPaint(
            size: new Size(200.0, 300.0),
            painter: new Sky(radius, imageInfo, networkImageInfo),
          )
        ],
      ),
    );
  }


  Future<Codec> _loadImage(AssetBundleImageKey key) async {
    final data = await key.bundle.load(key.name);
    if (data == null)
    throw 'Unable to read data';
    return await instantiateImageCodec(data.buffer.asUint8List());
  }


  testJSON(){
    var jsons = [
      {'name': 'apple'},
      {'name': 'banana'}
    ];
    JsonEncoder encoder = new JsonEncoder();
    print(jsons);
    print(encoder.convert(jsons));
  }

  loadNetWorkImage() async{
    print('loadNetWorkImage------------------------------------------------------');
    NetworkAssetBundle nb = new NetworkAssetBundle(new Uri());
    var result = await nb.load('http://img2.178.com/acg1/201312/181193085837/181196147567.jpg');
    print('result:$result');
    return await instantiateImageCodec(result.buffer.asUint8List());
  }


}



class Sky extends CustomPainter{
  double radius;
  var imageInfo;
  var networkImageInfo;
  Sky(this.radius, this.imageInfo, this.networkImageInfo);


  @override
  void paint(Canvas canvas, Size size){
    
    Paint p = new Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.fill;
    
    canvas
    //..drawColor(Colors.red,BlendMode.darken)
    ..drawCircle(
      new Offset(20.0, 30.0),
      radius,
      p
    );

    if(networkImageInfo != null){
      print('dddddddddddddddddddddddnetworkImageInfo');
      canvas.drawImage(networkImageInfo, new Offset(10.0, 10.0), p);
    }
    if(imageInfo != null){
      print('ddddddddddddddddddddddddddddddddddddddddd');
      canvas.drawImage(imageInfo, size.center(Offset.zero), p);
    }
    
  }

  @override
  bool shouldRepaint(Sky old){
    //return false;
    return radius != old.radius || imageInfo != old.imageInfo || networkImageInfo != old.networkImageInfo;
  }

  


}