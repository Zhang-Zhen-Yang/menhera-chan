import 'package:flutter/material.dart';

class DraggablePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => new DraggableWidget();
}

class DraggableWidget extends StatefulWidget{
  @override
  createState() => new DraggableState();
}

class DraggableState extends State<DraggableWidget>{

  @override
  initState(){
    super.initState();
    
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('DraggablePage'),
      ),
      body: new ListView(
        children: <Widget>[
          new Center(
            child: new Container(
              child: new Draggable(
                child: new Image.network('http://p1.pstatp.com/large/2a3800035cc9a1d799f8'),
                childWhenDragging: new Image.network('http://wx4.sinaimg.cn/mw690/d6acdda5ly1firbi0351aj20m80vdn1z.jpg'),
                feedback: new Image.network('http://p1.pstatp.com/large/2a3800035cc9a1d799f8'),
                /*onDragCompleted: (){
                  print('onDragCompleted');
                },*/
              ), 
              width: 200.0
            ) 
          ),
          new Center(
            child: new Container(
              child: new DragTarget(
                builder:(BuildContext context, List l1, List l2){
                  /*print(l1);
                  print(l2);*/
                  return new Text('ddd');
                },
                onWillAccept: (d){

                },
                onAccept: (d){
                  print('accept');
                  print(d);
                },
              ),
              width: 200.0,
              height: 200.0,
              color: Colors.teal
            ),
          ),
          new Center(
            child: new Dismissible(
              key: new Key('apple'),
              child: new Container(
                child: new Text('dismissible'),
                width: 500.0,
                height: 100.0,
                color: Colors.yellow[600]
              ),
              dismissThresholds: {DismissDirection.horizontal: 300.0},
            )
          ),
          new Center(
            child: new Container(
              child: new Image.network('http://wx4.sinaimg.cn/mw690/d6acdda5ly1firbi0351aj20m80vdn1z.jpg',fit: BoxFit.cover, alignment: Alignment.bottomLeft,),
              width: 200.0,
              height: 200.0,
              color: Colors.teal
            )
          ),
          // clipOval
          new Center(
            child: new Container(
              child: new ClipRRect(
                borderRadius: new BorderRadius.all(new Radius.circular(80.0)),
                child: new Image.network('http://wx4.sinaimg.cn/mw690/d6acdda5ly1firbi0351aj20m80vdn1z.jpg', fit: BoxFit.cover,),
              ),
              width: 200.0,
              height: 200.0
            )
          ),
          new Center(
            child: new Container(
              child: new Card(
                elevation: 2.0,
                child: new Ink(
                  child: new InkWell(
                    child: null,
                    onTap: (){},
                  ),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new NetworkImage('http://p1.pstatp.com/large/2a3800035cc9a1d799f8'),
                    )
                  ),
                  width: 200.0,
                  height: 200.0
                )
              ),
              width: 300.0
            )
          ),
          
          new Center(
            child: new Row(
              children: <Widget>[
                new Checkbox(value: true,activeColor: Colors.red,onChanged: (val){
                  print(val);
                }),
                new Checkbox(value: true,onChanged: (val){
                  print(val);
                }),
                new Checkbox(value: true,onChanged: (val){
                  print(val);
                }),
              ],
            )
          ),
          new Center(
            child: new Row(
              children: <Widget>[
                new Radio(value: 'one',groupValue: 'one',onChanged: (val){print(val);}),
                new Radio(value: 'two',groupValue: 'fruit',onChanged: (val){}),
                new Radio(value: 'three',groupValue: 'fruit',onChanged: (val){}),
              ],
            ),
          ),
          new Center(
            child: new Row(
              children: <Widget>[
                new Switch(
                  value: true,
                  onChanged: (val){
                    print(val);
                  },
                )
              ],
            )
          ),
          new Divider(
            //height: 30.0,
          ),
          new Center(
            child: new ShaderMask(
              shaderCallback: (Rect bounds) {
                return new RadialGradient(
                  center: Alignment.topLeft,
                  radius: 1.0,
                  colors: <Color>[Colors.yellow, Colors.deepOrange.shade900],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: new Text('I’m burning the memories'),
            )
          ),
          
          /*new LinearProgressIndicator(
            backgroundColor: Colors.amber,
          ),*/
          new Center(
            child: new Row(
              children: <Widget>[
                new Slider(
                  value:10.0,
                  max:100.0,
                  label: 'dd',
                  divisions: 10,
                  onChanged: (val){
                    print(val);
                  },
                )
              ],
            ),
          ),
          new ExpansionPanelList(
            expansionCallback: (int index, bool show){
              print([index, show]);
            },
            children: <ExpansionPanel>[
              new ExpansionPanel(
                headerBuilder: (BuildContext context, bool show){
                  return new Text('one');
                },
                isExpanded: false,
                body:new Container(
                  child: new Image.network('http://wx4.sinaimg.cn/mw690/d6acdda5ly1firbi0351aj20m80vdn1z.jpg'),
                  height: 300.0,
                  color: Colors.yellow
                )
              ),
              new ExpansionPanel(
                headerBuilder: (BuildContext context, bool show){
                  return new Text('two');
                },
                isExpanded: false,
                body:new Container(
                  child: new Image.network('http://p1.pstatp.com/large/2a3800035cc9a1d799f8'),
                  height: 300.0,
                  color: Colors.yellow
                )
              ),
            ],
          ),
          new Center(
            child: new Tooltip(
              message: 'hello world',
              child: new SizedBox(
                child: new Image.network('http://p1.pstatp.com/large/2a3800035cc9a1d799f8'),
                width: 200.0,
                height: 200.0
              ),
            ),
          ),
          new Center(
            child: new Container(
              decoration: new BoxDecoration(
                color: Colors.teal,
                /*gradient: new RadialGradient(
                  center: new Alignment(0.0, 0.0),
                  radius: 0.55,
                  colors: <Color>[
                    //const Color(0xFFEEEEEE),
                    Colors.teal,
                    //const Color(0xFF111133),
                    Colors.yellow,
                    Colors.red
                  ],
                  stops: <double>[0.01, 0.5, 1.0],
                ),*/
                gradient: new LinearGradient(
                  colors: <Color>[
                    //const Color(0xFFEEEEEE),
                    Colors.teal,
                    //const Color(0xFF111133),
                    Colors.yellow,
                    Colors.red
                  ],
                  begin: new Alignment(0.0, 0.0),
                  end: new Alignment(1.0, 1.0),
                  stops: <double>[0.01, 0.3, 1.0],

                )
              ),
              child: new Text('gradient'),
              width: 300.0,
              height: 300.0,
              alignment: Alignment.center,
              
            )
          )
          /*new GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20.0),
            crossAxisSpacing: 10.0,
            crossAxisCount: 2,
            children: <Widget>[
              new Text('He\'d have you all unravel at the'),
              new Text('Heed not the rabble'),
              new Text('Sound of screams but the'),
              new Text('Who scream'),
              new Text('Revolution is coming...'),
              new Text('Revolution, they...'),
            ],
          )*/
          
          
        ],
      ),
    );
  }
}