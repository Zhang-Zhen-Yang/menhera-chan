import 'package:flutter/material.dart';

class GesturePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) => new GestureWidget();
}

class GestureWidget extends StatefulWidget{
  @override
  createState() => new GestureState();
}

class GestureState extends State<GestureWidget>{
  double startX = 0.0;
  double currentX = 0.0;
  double translateDistance = 0.0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('gesture page'),
      ),
      body: new ListView(
        children: <Widget>[

          /*new GestureDetector(
            child: new Center(
              child: new Container(
                child: new Transform(
                  transform: new Matrix4.translationValues(translateDistance + currentX - startX, 0.0, 0.0),
                  child: new Image.network('https://b-ssl.duitang.com/uploads/item/201405/22/20140522025312_3fdyF.thumb.700_0.jpeg'),
                ),
                constraints: new BoxConstraints(
                  maxWidth: 200.0
                ),
              )
            ) ,
            onHorizontalDragStart: (DragStartDetails e){
              print(e.globalPosition.dx);
              setState((){
                startX = e.globalPosition.dx;
                currentX = e.globalPosition.dy;
              });
            },
            onHorizontalDragUpdate: (DragUpdateDetails e){
              setState((){
                currentX = e.globalPosition.dx;
              });
            },
          ),*/
          new Center(
            child: new Container(
              child: new Transform(
                transform: new Matrix4.translationValues(translateDistance + currentX - startX, 0.0, 0.0),
                child: new Image.network('https://b-ssl.duitang.com/uploads/item/201405/22/20140522025312_3fdyF.thumb.700_0.jpeg'),
              ),
              constraints: new BoxConstraints(
                maxWidth: 200.0
              ),
            )
          ),
          new Stack(
            children: <Widget>[
              new Text('Stack'),
              new Image.network('http://p2.so.qhimgs1.com/bdr/200_200_/t0134f3c0e3be03a342.jpg'),
              new Positioned(
                child: new GestureDetector(
                  child: new Image.network('https://b-ssl.duitang.com/uploads/item/201405/22/20140522025312_3fdyF.thumb.700_0.jpeg'),
                  onHorizontalDragStart: (DragStartDetails e){
                    print(e.globalPosition.dx);
                    setState((){
                      startX = e.globalPosition.dx;
                      currentX = e.globalPosition.dy;
                    });
                  },
                  onHorizontalDragUpdate: (DragUpdateDetails e){
                    setState((){
                      currentX = e.globalPosition.dx;
                    });
                  },
                  onHorizontalDragEnd: (DragEndDetails e){
                    setState((){
                      translateDistance = translateDistance + currentX - startX;
                      currentX = 0.0;
                      startX = 0.0;
                    });
                  },
                ),
                left: translateDistance + currentX - startX,
                width: 200.0,
                height: 200.0,
                top: 0.0,
              ),
            ],
          ),
          new Text('apple')
        ],
      ),

    );
  }
}