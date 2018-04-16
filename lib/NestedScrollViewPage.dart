import 'package:flutter/material.dart';
import 'dart:async';

class Nested extends StatelessWidget{
  @override
  Widget build(BuildContext context) => new Page();
}

class Page extends StatefulWidget {

  @override
  createState()=> new PageState();
}

class PageState extends State<Page> with SingleTickerProviderStateMixin{
  var _tabs = ['apple', 'banana', 'lemon','orange'];
  var titleColors = [Colors.teal, Colors.white];
  bool centerTitle = false;
  var  customScrollViewController;
  TabController _tabcontroller;
  void initState(){
    super.initState();
    customScrollViewController = new ScrollController(
      initialScrollOffset: 0.0,
      keepScrollOffset: true,
      debugLabel: 'aaa'
    )..addListener(listen);
    _tabcontroller = new TabController(
      vsync: this,
      length: _tabs.length
    )..addListener((){
      
    });
  }

  void listen(){
    var offset = customScrollViewController.offset;
    if(offset > 10){
      setState((){
        centerTitle = true;
      });
    }else{
      setState((){
        centerTitle = false;
      });
    }
   
  }

  Future<Null>  scrollend() async{
    await customScrollViewController.animateTo(0.0,duration:new Duration(seconds: 1), curve: Curves.ease);
    print('end');
  }
  var images = [
    'http://wx4.sinaimg.cn/mw690/d6acdda5ly1firbi0351aj20m80vdn1z.jpg',
    'http://wx2.sinaimg.cn/mw690/d6acdda5ly1firbi2dx9ej20m80m8789.jpg',
    'http://wx3.sinaimg.cn/mw690/d6acdda5ly1firbi6bwzvj20m80v4wny.jpg',
    'http://wx2.sinaimg.cn/mw690/d6acdda5ly1firbi8oxypj20m80fp42f.jpg',
    'http://wx1.sinaimg.cn/mw690/d6acdda5ly1firbifszxdj20m80m8adv.jpg',
    'http://wx1.sinaimg.cn/mw690/d6acdda5ly1firbii15z9j20m80rsdju.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // floatingActionButton
      floatingActionButton: new Builder(
        builder: (BuildContext context){
          return new FloatingActionButton(
            child: new Icon(Icons.check),
            onPressed: () async{
              await scrollend();
              SnackBar sbar = new SnackBar(
                content: new Text('snackbar'),
                backgroundColor: Colors.teal,
                action: new SnackBarAction(
                    label: 'one tow three',
                    onPressed: () {print('dd');}
                ),
              );
              Scaffold.of(context).showSnackBar(sbar);
              //customScrollViewController.jumpTo(0.0);
            },
          );
        },
      ) ,
      // body
      body: new NestedScrollView(
        physics: const AlwaysScrollableScrollPhysics() ,
        controller: customScrollViewController,
        headerSliverBuilder: (BuildContext scontext, bool innerBoxIsScrolled) {
          return <Widget>[
            /*new SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(scontext),
              child: new SliverAppBar(
                pinned: true,
                //snap: true,
                //floating: true,
                //primary: true,
                elevation: 5.0,
                // forceElevated: true,
                expandedHeight: 250.0,
                // backgroundColor: Colors.blue,
                actions: <Widget>[
                  new IconButton(
                    icon: new Icon(Icons.share),
                    // color: Colors.grey,
                    onPressed: (){
                      print('share');
                    },
                  )
                ],
                flexibleSpace: new FlexibleSpaceBar(
                  title: new Text('Comic Girls'),
                  centerTitle: false,
                  background: new Image.network('http://p1.pstatp.com/large/2a3800035cc9a1d799f8', fit: BoxFit.cover),
                ),
                bottom: new TabBar(
                  // These are the widgets to put in each tab in the tab bar.
                  tabs: _tabs.map((String name) => new Tab(text: name)).toList(),
                  controller: _tabcontroller,
                ),
              )
            ),*/
            new SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(scontext),
              child:
                new SliverAppBar(
                  pinned: true,
                  /*snap: true,
                  floating: true,*/
                  title: new Text('girls'),
                  centerTitle: centerTitle,
                  elevation: 5.0,
                  expandedHeight: 250.0,
                  actions: <Widget>[
                    new IconButton(
                      icon: new Icon(Icons.share),
                      onPressed: (){
                        print('share');
                      },
                    )
                  ],
                  flexibleSpace: new FlexibleSpaceBar(
                    // title: new Text('Comic Girls'),
                    centerTitle: false,
                    background: new  Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        new Image.network('http://p1.pstatp.com/large/2a3800035cc9a1d799f8', fit: BoxFit.cover)
                      ],
                    ),
                  ),
                  /*bottom: new PreferredSize(
                    child:  new TabBar(
                      tabs: _tabs.map((String name) => new Tab(text: name)).toList(),
                      controller: _tabcontroller,
                    ),
                    preferredSize: new Size(10.0,20.0),
                  )*/
                  bottom: new TabBar(
                    tabs: _tabs.map((String name) => new Tab(text: name)).toList(),
                    controller: _tabcontroller,
                  )
                )
              )
          ];
        },
        /*body: new RefreshIndicator(
          onRefresh: () async{
            return new Future.delayed(const Duration(seconds: 2), (){
              setState((){});
            });
          },
          child: new ListView(
            children:
            images.map((String src) => new Image.network(src, fit: BoxFit.cover)).toList()
          )
        )*/
        /*body: new TabBarView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: _tabcontroller,
          children: <Widget>[
            new RefreshIndicator(
              onRefresh: () async{
                return new Future.delayed(const Duration(seconds: 2), (){
                  setState((){});
                });
              },
              child: new Scrollbar(
                child: new ListView(
                  children: images.map((String src) => new Image.network(src, fit: BoxFit.cover)).toList()
                )
              ) 
            ),
            new Center(
              child: new Text('second page')
            ),
            new Center(
              child: new Text('third page')
            ),
            new Center(
              child: new Text('4 page')
            ),
          ],
        )*/

        body: new TabBarView(
          controller: _tabcontroller,
          children: _tabs.map((String str) {
              return new Builder(
                builder: (BuildContext context) {
                  return new RefreshIndicator(
                    onRefresh: () async{
                      return new Future.delayed(const Duration(seconds: 2), (){
                        setState((){});
                      });
                    },
                    child:new CustomScrollView(
                      physics: new  BouncingScrollPhysics(),
                      slivers: <Widget>[
                        new SliverOverlapInjector(
                          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                        ),
                        new SliverList(
                          delegate: new SliverChildBuilderDelegate((BuildContext context, int index){
                            return new Image.network(images[index]);
                          },
                          childCount:5),
                          
                        )
                      ]
                    )
                  );
                }
              );
            }).toList()
    
        )
      )
    );
  }
}