import 'package:flutter/material.dart';
import 'details.dart';
import 'package:pagenavigator/classes/transitions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class RouteTransitionType {
  String title;
  TransitionType transitionType;

  RouteTransitionType({this.title, this.transitionType});
}

class _HomeState extends State<Home> {
  List _routeTransitionTypeList = List<RouteTransitionType>();

  @override
  void initState() {
    super.initState();

    _routeTransitionTypeList
    ..add(RouteTransitionType(title: 'Default', transitionType: TransitionType.defaultTransition))
    ..add(RouteTransitionType(title: 'No Transition', transitionType: TransitionType.none))
    ..add(RouteTransitionType(title: 'Size Transition', transitionType: TransitionType.size))
    ..add(RouteTransitionType(title: 'Scale Transition', transitionType: TransitionType.scale))
    ..add(RouteTransitionType(title: 'Fade Transition', transitionType: TransitionType.fade))
    ..add(RouteTransitionType(title: 'Rotate Transition', transitionType: TransitionType.rotate))
    ..add(RouteTransitionType(title: 'Slide Up Transition', transitionType: TransitionType.slideUp))
    ..add(RouteTransitionType(title: 'Slide Down Transition', transitionType: TransitionType.slideDown))
    ..add(RouteTransitionType(title: 'Slide Left Transition', transitionType: TransitionType.slideLeft))
    ..add(RouteTransitionType(title: 'Slide Right Transition', transitionType: TransitionType.slideRight));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade50,
      appBar: AppBar(
        title: Text('Navigator - Transitions'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _routeTransitionTypeList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(_routeTransitionTypeList[index].title),
                onTap: () {
                  // MaterialPageRoute
//                  Navigator.of(context).push(
//                    MaterialPageRoute(
//                        builder: (BuildContext context) => Details(routeType: _routeTransitionTypeList[index].title)
//                    ),
//                  ).then((editedValue) {
//                    if (editedValue != null) _routeTransitionTypeList[index].title = editedValue;
//                  });

                  // PageRouteBuilder
//                Navigator.of(context).push(
//                  PageRouteBuilder(
//                    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
//                      return Details(routeType: _routeTransitionTypeList[index].title);
//                    },
//                    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
//                      return Align(
//                        child: SizeTransition(
//                          sizeFactor: animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
//                          child: child,
//                        ),
//                      );
//                    },
//                    transitionDuration: Duration(milliseconds: 500),
//                  ),
//                ).then((editedValue) {
//                  if (editedValue != null) _routeTransitionTypeList[index].title = editedValue;
//                });

                  // PageRouteBuilder Class
//                Navigator.of(context).push(
//                    SizeTransitionRoute(
//                        widget: Details(routeType: _routeTransitionTypeList[index].title))).then((editedValue) {
//                  if (editedValue != null) _routeTransitionTypeList[index].title = editedValue;
//                });

                  // Transition Class to handle multiple Animation Transitions
                  if (_routeTransitionTypeList[index].transitionType == TransitionType.defaultTransition) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context) => Details(routeType: _routeTransitionTypeList[index].title)
                      ),
                    ).then((editedValue) {
                      if (editedValue != null) _routeTransitionTypeList[index].title = editedValue;
                    });
                  }
                  else {
                    Navigator.of(context).push(
                      Transitions(
                          transitionType: _routeTransitionTypeList[index].transitionType,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.bounceInOut,
                          reverseCurve: Curves.fastOutSlowIn,
                          widget: Details(routeType: _routeTransitionTypeList[index].title)
                      ),
                    ).then((editedValue) {
                      if (editedValue != null) _routeTransitionTypeList[index].title = editedValue;
                    });
                    //print('ModalRoute: ${ModalRoute.of(context).animation}');
                  }

                },
              ),
            );
          },
        ),
      ),
    );
  }
}
