import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => new ContainerStateFull();
}

class ContainerStateFull extends StatefulWidget{
  @override
  ContainerState createState() => new ContainerState();
}

class ContainerState extends State<ContainerStateFull>{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('container')
      ),
      body: new ListView(
        children: <Widget>[

          // container
          new Center(
            child: new Container(
              child: new Text('container'),
              // color: Colors.teal,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                color: Colors.teal,
                image: new DecorationImage(
                  image: new NetworkImage('http://p1.so.qhimgs1.com/bdr/_240_/t01b80d9363ae8329c1.jpg'),
                  // repeat: ImageRepeat.repeatY,
                  alignment: Alignment.center
                  // centerSlice: new Rect.fromLTRB(20.0, 10.0, 10.0, 70.0),
                ),
                /*border: new Border(
                  top: new BorderSide(color: Colors.red,width: 10.0),
                )*/
                // border: new Border.all(color: new Color.fromARGB(100, 255, 255, 0),width: 10.0),
              ),
              /*foregroundDecoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage('http://www.005.tv/uploads/allimg/180225/42-1P225110T1211.jpg'),

                )
              ),*/
              width: 300.0,
              height: 300.0
            ),
          ),
          // row
          new InkWell(
            child: new Text('ddddddddddddd'),
            onTap: (){},
          ),
          new InkWell(
            onTap: (){},
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: new Image.network('http://p1.so.qhimgs1.com/bdr/_240_/t011b84dd7d06b27251.jpg'),
                  width: 150.0
                ),
                new Expanded(
                  child: new Container(
                    padding: new EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text('卡利古拉', style: new TextStyle(fontSize: 20.0,color: Colors.teal)),
                        new Text('盖乌斯·凯撒·奥古斯都·日耳曼尼库斯(12年8月31日-41年1月24日)，为罗马帝国第三任皇帝，后世史学家常称其为"卡利古拉"。卡利古拉是他自童年起的外号，意为"小军靴"，源于他儿时随其父屯驻日尔曼前线时士兵为他穿上的小军靴。卡利古拉被认为是罗马帝国早期的典型暴君。他建立恐怖统治，神化王权，行事荒唐。 ', softWrap: true,),
                      ],
                    )
                  ),
                )
                
              ],
            ),
          ),

          new Center(
            child: new Container(
              alignment: Alignment.center,
              child: new Text('Ink.image', style: new TextStyle(color: Colors.teal)),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage('http://p1.so.qhimgs1.com/bdr/_240_/t01b80d9363ae8329c1.jpg'),
                )
              ),
              width: 300.0,
              height: 300.0
            )
          ),
          new Center(
           child: new Ink(
            child: new InkWell(
                child: new Center(
                  child: new Text('dddddddddddddddddd'),
                ),
                onTap: (){},
              ),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage('http://img2.178.com/acg1/201312/181193085837/181196147567.jpg'),
                )
              ),
              width: 300.0,
              height: 200.0,
            )
          )
          
        ],
      )
    );
  }
}