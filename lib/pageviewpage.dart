import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';
// import 'package:scheduled_notifications/scheduled_notifications.dart';

class PageViewPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => new PageViewWidget();
}

class PageViewWidget extends StatefulWidget{
  @override
  createState() => new PageViewState();
}

class PageViewState extends State<PageViewWidget> with SingleTickerProviderStateMixin{
  PageController ac;
  @override
  initState(){
    super.initState();
    ac = new PageController();
    print('ac: ac $ac');

  }


  bool _onNotifycation<Notification>(Notification notify) {
    
    if (notify is! OverscrollNotification) {
      return true;
    } else {
      // print('notify:$notify');
      return false;

    }
    setState(() {
      // pageIndex++;
    });
    return true;
  }




  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('PageView'),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.undo),
        onPressed: () async{
          // ac.animateToPage(0,duration: new Duration(seconds: 1),curve: Curves.ease);
          print('ac:$ac');
          await ac.animateToPage(0,duration: new Duration(seconds: 1),curve: Curves.ease);
          print('end');
        },
      ),
      body: new PageView(
        // physics: new NeverScrollableScrollPhysics(),
        controller: ac,
        onPageChanged: (index){
          print(index);
        },
        
        children: <Widget>[
          new ListView(
            children:<Widget>[
              new Image.network('http://wx4.sinaimg.cn/mw690/d6acdda5ly1firbi0351aj20m80vdn1z.jpg'),
              new Image.network('http://wx4.sinaimg.cn/mw690/d6acdda5ly1firbi0351aj20m80vdn1z.jpg'),
              new Image.network('http://wx4.sinaimg.cn/mw690/d6acdda5ly1firbi0351aj20m80vdn1z.jpg')
            ],
          ),
          new ListView(
            children: <Widget>[
              new Text('width: ${MediaQuery.of(context).size.width.toString()}'),
              new Text('height: ${MediaQuery.of(context).size.height.toString()}'),
              new Text('height: ${MediaQuery.of(context).devicePixelRatio.toString()}'),
              new Ink(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new NetworkImage('http://wx4.sinaimg.cn/mw690/d6acdda5ly1firbi0351aj20m80vdn1z.jpg'), 
                  )
                ),
                child: new InkWell(
                  child:new Text('kkkkkkkkk'),
                  onTap:(){},
                ),
                height: 300.0
              ),
              new RichText(
                text: new TextSpan(
                  text: 'dd',
                  children:<TextSpan>[
                    new TextSpan(
                      text:'oddd'
                    ),
                    new TextSpan(
                      text: 'dddd'
                    )
                  ]
                )
              ),
              new Center(
                child: new RaisedButton(
                  color: Colors.teal,
                  textColor: Colors.white,
                  child: new Text('notification'),
                  onPressed: (){},
                )
              ),
              new Container(
                child: new Image.network('http://wx2.sinaimg.cn/mw690/d6acdda5ly1firbi2dx9ej20m80m8789.jpg'),
                width:MediaQuery.of(context).size.width / 2,
              )
            ],
          ),
          new NotificationListener(
            onNotification: _onNotifycation,
            child: new ListView(
              children: <Widget>[
                new BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                  child: new Image.network('http://wx3.sinaimg.cn/mw690/d6acdda5ly1firbi6bwzvj20m80v4wny.jpg'),
                ),
                new Image.network('http://wx3.sinaimg.cn/mw690/d6acdda5ly1firbi6bwzvj20m80v4wny.jpg'),
                new Image.network('http://wx3.sinaimg.cn/mw690/d6acdda5ly1firbi6bwzvj20m80v4wny.jpg'),
                new Image.network('http://wx3.sinaimg.cn/mw690/d6acdda5ly1firbi6bwzvj20m80v4wny.jpg'),
                new Image.network('http://wx3.sinaimg.cn/mw690/d6acdda5ly1firbi6bwzvj20m80v4wny.jpg'),
                new Image.network('http://wx3.sinaimg.cn/mw690/d6acdda5ly1firbi6bwzvj20m80v4wny.jpg'),
                new Image.network('http://wx3.sinaimg.cn/mw690/d6acdda5ly1firbi6bwzvj20m80v4wny.jpg'),
              ],
            )
          ),
        ],
      ),
    );
  }
}


