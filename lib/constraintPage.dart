import 'package:flutter/material.dart';

class ConstraintPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) => new ConstraintWidget();
}

class ConstraintWidget extends StatefulWidget{
  @override
  createState() => new ConstraintState();
}

class ConstraintState extends State<ConstraintWidget>{

@override
  Widget build(BuildContext context) {
    return new  Scaffold(
      appBar: new AppBar(
        title: new Text('constraint'),
      ),
      body: new ListView(
        children: <Widget>[
          // Ink
          new Center(
            child: new Ink(
              child: new InkWell(
                child:  new Text('sima kaze'),
                onTap: (){},
              ),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage('https://b-ssl.duitang.com/uploads/item/201405/22/20140522025312_3fdyF.thumb.700_0.jpeg'),
                  fit: BoxFit.cover
                )
              ),
              // alignment: Alignment.center,
              width:300.0,
              height: 300.0  
            )
          ),
          // ConstrainedBox
          new Center(
            child: new ConstrainedBox(
              child: new Container(
                color: Colors.teal,
                margin: new EdgeInsets.symmetric(vertical: 10.0),
                child: new Image.network('https://b-ssl.duitang.com/uploads/item/201405/22/20140522025312_3fdyF.thumb.700_0.jpeg'),
              ),
              constraints: new BoxConstraints(
                maxWidth: 300.0,
                maxHeight: 300.0
              ),
            )
          ),
          // row
          new Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              new Container(
                child: new Image.network('https://b-ssl.duitang.com/uploads/item/201405/22/20140522025312_3fdyF.thumb.700_0.jpeg'),
                constraints: new BoxConstraints(
                  maxHeight: 100.0
                ),
              ),
              new Text('row'),
            ],
          )
        ],
      ),
    );
  }
}