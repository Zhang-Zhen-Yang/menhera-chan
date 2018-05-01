import 'package:flutter/material.dart';

class FlowPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => new FlowWidget();
}

class FlowWidget extends StatefulWidget{
  @override
  createState()=> new FlowState();
}

class FlowState extends State<FlowWidget>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('FlowPage'),
      ),
      /*body: new ListView(
        children: <Widget>[
          new Center(
            child: new Container(
              child: new Image.network('http://img2.178.com/acg1/201312/181193085837/181196147567.jpg'),
              width: 300.0
            )
          ),
          new Center(
            child: new Align(
              alignment: Alignment.bottomRight,
              child: new Row(
                children: <Widget>[
                  new Text('Align 1', style: new TextStyle(color: Colors.teal)),
                  new Text('Align 2', style: new TextStyle(color: Colors.teal, fontSize: 20.0)),
                  new Text('Align 3', style: new TextStyle(color: Colors.teal, fontSize: 30.0)),
                ],
              ),
            )
          )
        ],
      ),*/
      body: new GridView.count( 
        primary: false, 
        padding: const EdgeInsets.all(0.0),
        crossAxisSpacing: 10.0, 
        crossAxisCount: 2, 
        children: <Widget>[
          new Builder(
            builder: (BuildContext context){
              return new GestureDetector(
                child: new Stack(
                  children: <Widget>[
                    new Image.network('http://img2.178.com/acg1/201312/181193085837/181196147567.jpg',fit: BoxFit.cover),
                    new Positioned(
                      right: 10.0,
                      bottom: 10.0,
                      child: new IconButton(
                        icon: new Icon(Icons.plus_one,color: Colors.teal,),
                        onPressed: (){
                          print('+1');
                        }
                      ),
                    )
                    
                  ],
                ),
                onTap: (){
                  showBottomSheet(
                    context: context,
                    builder:(BuildContext context){
                      return new Container(
                        height: 200.0,
                        //color: Colors.transparent,
                        decoration: new BoxDecoration(
                          color: Colors.red
                        ),
                        padding: new EdgeInsets.only(bottom: 10.0),
                        child: new Column(
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new Text('已经添加为喜欢了。')
                              ],
                            ),
                            new Expanded(
                              child: new ListView(
                                scrollDirection: Axis.horizontal,
                                children: new List.generate(10, (int index){
                                  return new Image.network('http://wx3.sinaimg.cn/mw690/d6acdda5ly1firbi6bwzvj20m80v4wny.jpg');
                                })
                              ),
                              //child: new Text('ddd')
                            )
                          ],
                        )
                      );
                    }
                  );
                },
              );
            },
          ) , 
          new Image.network('http://wx2.sinaimg.cn/mw690/d6acdda5ly1firbi2dx9ej20m80m8789.jpg',fit: BoxFit.cover),
          new Image.network('http://wx3.sinaimg.cn/mw690/d6acdda5ly1firbi6bwzvj20m80v4wny.jpg',fit: BoxFit.cover),
          new Image.network('http://wx4.sinaimg.cn/mw690/d6acdda5ly1firbi0351aj20m80vdn1z.jpg',fit: BoxFit.cover), 
          new Image.network('http://wx2.sinaimg.cn/mw690/d6acdda5ly1firbi2dx9ej20m80m8789.jpg',fit: BoxFit.cover),
          new Image.network('http://wx3.sinaimg.cn/mw690/d6acdda5ly1firbi6bwzvj20m80v4wny.jpg',fit: BoxFit.cover),
          new Image.network('http://wx4.sinaimg.cn/mw690/d6acdda5ly1firbi0351aj20m80vdn1z.jpg',fit: BoxFit.cover), 
          new Image.network('http://wx2.sinaimg.cn/mw690/d6acdda5ly1firbi2dx9ej20m80m8789.jpg',fit: BoxFit.cover),
          new Image.network('http://wx3.sinaimg.cn/mw690/d6acdda5ly1firbi6bwzvj20m80v4wny.jpg',fit: BoxFit.cover),
          new Image.network('http://wx4.sinaimg.cn/mw690/d6acdda5ly1firbi0351aj20m80vdn1z.jpg',fit: BoxFit.cover), 
          new Image.network('http://wx2.sinaimg.cn/mw690/d6acdda5ly1firbi2dx9ej20m80m8789.jpg',fit: BoxFit.cover),
          new Image.network('http://wx3.sinaimg.cn/mw690/d6acdda5ly1firbi6bwzvj20m80v4wny.jpg',fit: BoxFit.cover),
          new Image.network('http://wx4.sinaimg.cn/mw690/d6acdda5ly1firbi0351aj20m80vdn1z.jpg',fit: BoxFit.cover), 
          new Image.network('http://wx2.sinaimg.cn/mw690/d6acdda5ly1firbi2dx9ej20m80m8789.jpg',fit: BoxFit.cover),
          new Image.network('http://wx3.sinaimg.cn/mw690/d6acdda5ly1firbi6bwzvj20m80v4wny.jpg',fit: BoxFit.cover),
          new Image.network('http://wx4.sinaimg.cn/mw690/d6acdda5ly1firbi0351aj20m80vdn1z.jpg',fit: BoxFit.cover), 
          new Image.network('http://wx2.sinaimg.cn/mw690/d6acdda5ly1firbi2dx9ej20m80m8789.jpg',fit: BoxFit.cover),
          new Image.network('http://wx3.sinaimg.cn/mw690/d6acdda5ly1firbi6bwzvj20m80v4wny.jpg',fit: BoxFit.cover),
          new Image.network('http://wx4.sinaimg.cn/mw690/d6acdda5ly1firbi0351aj20m80vdn1z.jpg',fit: BoxFit.cover), 
          new Text('Revolution is coming...'), 
          new Text('Revolution, they...'), 
          new Text('He\'d have you all unravel at the'), 
          new Text('Heed not the rabble'), 
          new Text('Sound of screams but the'), 
          new Text('Who scream'), 
          new Text('Revolution is coming...'), 
          new Text('Revolution, they...'), 
          new Text('He\'d have you all unravel at the'), 
          new Text('Heed not the rabble'), 
          new Text('Sound of screams but the'), 
          new Text('Who scream'), 
          new Text('Revolution is coming...'), 
          new Text('Revolution, they...'), 
          new Text('He\'d have you all unravel at the'), 
          new Text('Heed not the rabble'), 
          new Text('Sound of screams but the'), 
          new Text('Who scream'), 
          new Text('Revolution is coming...'), 
          new Text('Revolution, they...'), 
        ], 
      )

    );
  }
}