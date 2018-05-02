import 'package:flutter/material.dart';
import 'dart:math' as math;

const double _kAppBarMinHeight = 90.0;
const double _kAppBarMidHeight = 256.0;

class PhysicPage extends StatefulWidget{
  @override
  createState()=> new PhysicPageState();
}

class PhysicPageState extends State<PhysicPage>{
  
  final ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new Builder(
        // Insert an element so that _buildBody can find the PrimaryScrollController.
        builder: _buildBody,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double statusBarHeight = mediaQueryData.padding.top;
    final double screenHeight = mediaQueryData.size.height;
    final double appBarMaxHeight = screenHeight - statusBarHeight;

    // The scroll offset that reveals the appBarMidHeight appbar.
    final double appBarMidScrollOffset = statusBarHeight + appBarMaxHeight - _kAppBarMidHeight;
    /*return new CustomScrollView(
      physics: new _SnappingScrollPhysics(midScrollOffset: appBarMidScrollOffset),
      slivers: <Widget>[
        new SliverAppBar(
          expandedHeight: 250.0,
          flexibleSpace: new FlexibleSpaceBar(
            title: new Text('physic'),
            background: new Image.network(
              'http://wx3.sinaimg.cn/mw690/d6acdda5ly1firbi6bwzvj20m80v4wny.jpg',
              fit: BoxFit.cover
            ),
          ),
        ),
        new SliverGrid(
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
          ),
          delegate: new SliverChildBuilderDelegate((BuildContext context, int index){
            return new AspectRatio(
              aspectRatio: 1.0,
              child: new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new NetworkImage('http://wx4.sinaimg.cn/mw690/d6acdda5ly1firbi0351aj20m80vdn1z.jpg'),
                    fit: BoxFit.cover
                  )
                ),
                child: new Text('${statusBarHeight.toString()};${screenHeight.toString()}'),
              )
              // child: new Image.network('http://wx4.sinaimg.cn/mw690/d6acdda5ly1firbi0351aj20m80vdn1z.jpg',fit: BoxFit.cover),
            );
          },childCount: 100),
        )
      ],
    );*/


    return new NotificationListener(
      onNotification: (ScrollNotification notify){
        // print(notify);
        if (notify.depth == 0 && notify is ScrollUpdateNotification) {
          print(_scrollController.position.pixels);
        }
      },
      child: new CustomScrollView(
        controller: _scrollController,
        physics: new _SnappingScrollPhysics(midScrollOffset: appBarMidScrollOffset),
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 250.0,
            flexibleSpace: new FlexibleSpaceBar(
              title: new Text('physic'),
              background: new Image.network(
                'http://wx3.sinaimg.cn/mw690/d6acdda5ly1firbi6bwzvj20m80v4wny.jpg',
                fit: BoxFit.cover
              ),
            ),
          ),
          new SliverGrid(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
            ),
            delegate: new SliverChildBuilderDelegate((BuildContext context, int index){
              return new AspectRatio(
                aspectRatio: 1.0,
                child: new Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new NetworkImage('http://wx4.sinaimg.cn/mw690/d6acdda5ly1firbi0351aj20m80vdn1z.jpg'),
                      fit: BoxFit.cover
                    )
                  ),
                  child: new Text('${statusBarHeight.toString()};${screenHeight.toString()}'),
                )
                // child: new Image.network('http://wx4.sinaimg.cn/mw690/d6acdda5ly1firbi0351aj20m80vdn1z.jpg',fit: BoxFit.cover),
              );
            },childCount: 100),
          )
        ],
      )
    );
  }
}


// Support snapping scrolls to the midScrollOffset: the point at which the
// app bar's height is _kAppBarMidHeight and only one section heading is
// visible.
class _SnappingScrollPhysics extends ClampingScrollPhysics {
  const _SnappingScrollPhysics({
    ScrollPhysics parent,
    @required this.midScrollOffset,
  }) : assert(midScrollOffset != null),
       super(parent: parent);

  final double midScrollOffset;

  @override
  _SnappingScrollPhysics applyTo(ScrollPhysics ancestor) {
    return new _SnappingScrollPhysics(parent: buildParent(ancestor), midScrollOffset: midScrollOffset);
  }

  Simulation _toMidScrollOffsetSimulation(double offset, double dragVelocity) {
    final double velocity = math.max(dragVelocity, minFlingVelocity);
    return new ScrollSpringSimulation(spring, offset, midScrollOffset, velocity, tolerance: tolerance);
  }

  Simulation _toZeroScrollOffsetSimulation(double offset, double dragVelocity) {
    final double velocity = math.max(dragVelocity, minFlingVelocity);
    return new ScrollSpringSimulation(spring, offset, 0.0, velocity, tolerance: tolerance);
  }

  @override
  Simulation createBallisticSimulation(ScrollMetrics position, double dragVelocity) {
    final Simulation simulation = super.createBallisticSimulation(position, dragVelocity);
    final double offset = position.pixels;

    if (simulation != null) {
      // The drag ended with sufficient velocity to trigger creating a simulation.
      // If the simulation is headed up towards midScrollOffset but will not reach it,
      // then snap it there. Similarly if the simulation is headed down past
      // midScrollOffset but will not reach zero, then snap it to zero.
      final double simulationEnd = simulation.x(double.infinity);
      if (simulationEnd >= midScrollOffset)
        return simulation;
      if (dragVelocity > 0.0)
        return _toMidScrollOffsetSimulation(offset, dragVelocity);
      if (dragVelocity < 0.0)
        return _toZeroScrollOffsetSimulation(offset, dragVelocity);
    } else {
      // The user ended the drag with little or no velocity. If they
      // didn't leave the offset above midScrollOffset, then
      // snap to midScrollOffset if they're more than halfway there,
      // otherwise snap to zero.
      final double snapThreshold = midScrollOffset / 2.0;
      if (offset >= snapThreshold && offset < midScrollOffset)
        return _toMidScrollOffsetSimulation(offset, dragVelocity);
      if (offset > 0.0 && offset < snapThreshold)
        return _toZeroScrollOffsetSimulation(offset, dragVelocity);
    }
    return simulation;
  }
}

