import 'package:flutter/material.dart';
import 'dart:async';

class Sliver extends StatelessWidget{
  @override
  Widget build(BuildContext context) => new Page();
}

class Page extends StatefulWidget{

  @override
  createState()=> new PageState();
}

class PageState extends State<Page>{

  var  customScrollViewController;
  void initState(){
    super.initState();
    customScrollViewController = new ScrollController(
      initialScrollOffset: 0.0,
      keepScrollOffset: true,
      debugLabel: 'aaa'
    );
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
            child: new Icon(Icons.plus_one),
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
      body: new RefreshIndicator(
        onRefresh: () async{
          return new Future.delayed(const Duration(seconds:3), () {
            //任务具体代码
            print(new DateTime.now());
            print('refresh'); 
            setState((){});
          });
          
        },
        color: Colors.tealAccent,
        backgroundColor: Colors.white,
        child : new CustomScrollView(
          controller: customScrollViewController,
          // physics: const AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            new SliverAppBar(
              //pinned: true,
              snap: true,
              floating: true,
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
              /*bottom: new PreferredSize(
                child: new IconButton(
                  onPressed: (){},
                  icon: new Icon(Icons.headset)
                ),
                preferredSize: new Size(10.0,250.0)
              ),*/
            ),
            /*new RefreshIndicator(
              onRefresh: () async{print('refresh'); setState((){});},
              color: Colors.white,
              backgroundColor: Colors.yellow,
              
              child: // 列表 高度自定义
                new SliverList(
                  delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return new Container(
                        alignment: Alignment.center,
                        color: Colors.lightBlue[100 * (index % 9)],
                        child: new Image.network(images[index])
                      );
                    },
                    childCount: images.length
                  ),
                ),
            ),*/

            // GridView
            new SliverGrid(
              gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
            new SliverList(
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: new Image.network(images[index])
                  );
                },
                childCount: images.length
              ),
            ),
            // 列表 高度限定
            new SliverFixedExtentList(
              itemExtent: 500.0,
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: new Text('list item $index'),
                  );
                },
                childCount: 20
              ),
            ),
          ],
        )
      ) 
    );
  }
}