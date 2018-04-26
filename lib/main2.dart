import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'app',
      home: new HomePage(),
      theme: new ThemeData(
        primarySwatch: Colors.pink
      )
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  createState() => new HomeState();
}

class HomeState extends State<HomePage>{
  var images = [
    'http://wx4.sinaimg.cn/mw690/d6acdda5ly1firbi0351aj20m80vdn1z.jpg',
    'http://wx2.sinaimg.cn/mw690/d6acdda5ly1firbi2dx9ej20m80m8789.jpg',
    'http://wx3.sinaimg.cn/mw690/d6acdda5ly1firbi6bwzvj20m80v4wny.jpg',
    'http://wx2.sinaimg.cn/mw690/d6acdda5ly1firbi8oxypj20m80fp42f.jpg',
    'http://wx1.sinaimg.cn/mw690/d6acdda5ly1firbifszxdj20m80m8adv.jpg',
    'http://wx1.sinaimg.cn/mw690/d6acdda5ly1firbii15z9j20m80rsdju.jpg'
  ];

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      /* appBar: new AppBar(
        title: new Text('Comic girls'),
      ),*/
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            title: new Text('首页'),
            icon: new Icon(Icons.home)
          ),
          new BottomNavigationBarItem(
            title: new Text('分区'),
            icon: new Icon(Icons.alternate_email)
          ),
          new BottomNavigationBarItem(
            title: new Text('动态'),
            icon: new Icon(Icons.view_day)
          ),
          new BottomNavigationBarItem(
            title: new Text('消息'),
            icon: new Icon(Icons.message)
          ),
          
        ],
      ),
      floatingActionButton: new Builder(
        builder: (BuildContext context){
          return new FloatingActionButton(
            child: new Icon(Icons.favorite_border),
            onPressed: (){
              SnackBar sb = new SnackBar(
                content: new Text('snackbar'),
              );
              Scaffold.of(context).showSnackBar(sb);
            },
          );
        },
      ),
      /*body: new CustomScrollView(
        slivers:<Widget>[
          new SliverAppBar(
            pinned: false,
            // expandedHeight: 100.0,
            flexibleSpace: new FlexibleSpaceBar(
              title: new Text('home page'),
              background: new Image.network('http://p1.pstatp.com/large/2a3800035cc9a1d799f8',fit: BoxFit.cover,),
            ),
          ),

          new SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: new FlexibleSpaceBar(
              title: new Text('home page'),
              background: new Image.network('http://p1.pstatp.com/large/2a3800035cc9a1d799f8',fit: BoxFit.cover,),
            ),
          ),
          
          new SliverGrid(
            delegate: new SliverChildBuilderDelegate((BuildContext context, int index){
              return new Container(
                alignment: Alignment.center,
                color: Colors.pink[100 * (index % 9)],
                child: new Text('grid item $index'),
              );
            },childCount: 100),
            gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
          ),
          new SliverGrid(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: new SliverChildBuilderDelegate((BuildContext context, int index){
              return new Container(
                alignment: Alignment.center,
                child: new Text('grid item $index'),
                color: Colors.teal[100*(index%9)]
              );
            },childCount: 50),
          ),
          new SliverPersistentHeader(
            pinned: true,
            delegate: new _SliverStatusBarPaddingDelegate(height:100.0),
          ),
          new SliverFillRemaining(
            child: new Image.asset('image/c.jpg')
          ),
          new SliverFillViewport(
            delegate: new SliverChildBuilderDelegate((BuildContext context,int index){
              return new Image.asset('image/c.jpg'); 
            },childCount: 1),
          ),
          
          new SliverList(
            delegate: new SliverChildBuilderDelegate((BuildContext context, int index){
              return new Image.network(images[index]);
            },childCount: images.length),
          ),
          
        ]
      ),*/
      body: new NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            new SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: new SliverAppBar(
                pinned: false,
                expandedHeight: 250.0,
                flexibleSpace: new FlexibleSpaceBar(
                  title: new Text('home page'),
                  background: new Image.network('http://p1.pstatp.com/large/2a3800035cc9a1d799f8',fit: BoxFit.cover,),
                ),
                /*bottom: new PreferredSize(
                  child: new IconButton(
                    onPressed: (){},
                    icon: new Icon(Icons.headset)
                  ),
                  preferredSize: new Size(10.0,0.0)
                )*/
              ),
            )
          ];
        },
        body: new Builder(
          builder: (BuildContext mcontext){
            return new CustomScrollView(
              physics: new  BouncingScrollPhysics(),
              slivers: <Widget>[
                new SliverOverlapInjector(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(mcontext),
                  
                ),
                new SliverPersistentHeader(
                  pinned: true,
                  delegate: new _SliverStatusBarPaddingDelegate(height:100.0),
                ),
                new SliverList(
                  delegate: new SliverChildBuilderDelegate((BuildContext context, int index){
                    return new Image.network(images[index]);
                  },childCount: images.length),
                ),
              ],
            );
          },
        )
        /*body:new Builder(
          builder: (BuildContext mcontext){
            return  new SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(mcontext),
              child: new CustomScrollView(
                slivers: <Widget>[
                  new SliverPersistentHeader(
                    pinned: true,
                    delegate: new _SliverStatusBarPaddingDelegate(height:100.0),
                  ),
                  new SliverList(
                    delegate: new SliverChildBuilderDelegate((BuildContext context, int index){
                      return new Image.network(images[index]);
                    },childCount: images.length),
                  ),
                ],
              )
            );
          },
        )*/

      )
    );
  }
}

class _SliverStatusBarPaddingDelegate extends SliverPersistentHeaderDelegate {
  _SliverStatusBarPaddingDelegate({ @required this.height });

  final double height;

  @override double get minExtent => height;
  @override double get maxExtent => height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // print(['shrinkOffset:$shrinkOffset;overlapsContent:$overlapsContent']);
    return new SizedBox.expand(
      child: new Placeholder(color: Colors.orange),
    );
  }

  @override
  bool shouldRebuild(@checked _SliverStatusBarPaddingDelegate oldDelegate) {
    return height != oldDelegate.height;
  }
}