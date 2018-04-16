import 'package:flutter/material.dart';
import 'dart:async';

class Five extends StatelessWidget{
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
  var tabTitles = [
    'one',
    'two',
    'three'
  ];
  /* buildListTile(context,value){
    return new ListTile(
      title: value
    );
  }*/
  
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: tabTitles.length,
      child: new Scaffold(
        backgroundColor: Colors.grey,
        drawer: new Drawer(),
        body: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: new SliverAppBar(
                  backgroundColor: Colors.white,
                  expandedHeight: 250.0,
                  flexibleSpace: new FlexibleSpaceBar(
                    title: new Text('Comic Girls'),
                    centerTitle: false,
                    background: new Image.network('http://p1.pstatp.com/large/2a3800035cc9a1d799f8', fit: BoxFit.cover),
                  ),
                  /*leading: new Builder(builder: (BuildContext context) {
                    return new IconButton(
                        color: Colors.black,
                        icon: new Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        });
                  }),*/
                  iconTheme: Theme.of(context).iconTheme,
                  textTheme: Theme.of(context).textTheme,
                  centerTitle: true,
                  title: new Text('Test'),
                  // expandedHeight: 96.0,
                  pinned: true,
                  forceElevated: innerBoxIsScrolled,
                  bottom: new TabBar(
                    unselectedLabelColor: Colors.grey,
                    // unselectedLabelStyle: Font.medium(size: 14.0),
                    labelColor: Colors.black,
                    // labelStyle: Font.medium(size: 14.0),
                    indicatorColor: Colors.black,
                    tabs: tabTitles.map(
                          (String str) => new Tab(text: str),
                    ).toList(),
                  ),
                ),
              ),
            ];
          },
          body: new TabBarView(
            children: images.map((String str) {
              return new Builder(
                  builder: (BuildContext context) {
                    return new RefreshIndicator(
                      onRefresh: () async{
                        return new Future.delayed(new Duration(seconds: 3),(){
                          setState((){});
                        });
                      },
                      child: new CustomScrollView(
                      physics: new  BouncingScrollPhysics(),
                      slivers: <Widget>[
                        new SliverOverlapInjector(
                          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                        ),
                        new SliverPadding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 0.0,
                            horizontal: 0.0,
                          ),
                          sliver: new SliverFixedExtentList(
                            itemExtent: 92.0,
                            delegate: new SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                return new Container(
                                  decoration: new BoxDecoration(
                                      color: Colors.white,
                                      border: new Border(bottom: new BorderSide(color: Colors.grey))
                                    //borderRadius: new BorderRadius.circular(10.0),
                                  ),
                                  child: new Text(index.toString())
                                );
                              },
                              childCount: 200,
                            ),
                          ),
                        ),
                      ],
                    ),
                    );
                  },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
