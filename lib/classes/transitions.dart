import 'package:flutter/material.dart';

// Enumeration is used to define named constant values
enum TransitionType {
  defaultTransition,
  none,
  size,
  scale,
  fade,
  rotate,
  slideDown,
  slideUp,
  slideLeft,
  slideRight
}

class Transitions<T> extends PageRouteBuilder<T> {
  final TransitionType transitionType;
  final Curve curve;
  final Curve reverseCurve;
  final Duration duration;
  final Widget widget;

  Transitions({
    this.transitionType,
    this.curve = Curves.elasticInOut,
    this.reverseCurve = Curves.easeOut,
    this.duration = const Duration(milliseconds: 500),
    this.widget}) : super(
    transitionDuration: duration,
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      //animation = CurvedAnimation(parent: animation, curve: curve, reverseCurve: reverseCurve);

      switch (transitionType) {
        case TransitionType.none:
          return child;
          break;
        case TransitionType.size:
          return Align(
            child: SizeTransition(
              sizeFactor: animation, //CurvedAnimation(parent: animation, curve: curve, reverseCurve: reverseCurve),
              child: child,
            ),
          );
          break;
        case TransitionType.scale:
          return ScaleTransition(
            scale: animation,
            alignment: Alignment.topRight,
            child: child,
          );
          break;
        case TransitionType.fade:
          return FadeTransition(
            opacity: animation,
            child: child,
          );
          break;
        case TransitionType.rotate:
          return RotationTransition(
            alignment: Alignment.center,
            turns: animation,
            child: ScaleTransition(
              alignment: Alignment.center,
              scale: animation,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
          );
          break;
        // SlideTransition position is an Animation<Offset> not Animation<double>
        // Use Tween<Offset>().animate(animation)
        case TransitionType.slideDown:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, -1.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation),
            child: child,
          );
          break;
        case TransitionType.slideUp:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation),
            //).animate(CurvedAnimation(parent: animation, curve: curve, reverseCurve: reverseCurve)),
            child: child,
          );
          break;
        case TransitionType.slideLeft:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation),
            //).animate(CurvedAnimation(parent: animation,curve: curve, reverseCurve: reverseCurve)),
            child: child,
          );
          break;
        case TransitionType.slideRight:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation),
            child: child,
          );
          break;
        default:
          return FadeTransition(opacity: animation, child: child);
      }
    },
  );
}

class SizeTransitionRoute extends PageRouteBuilder {
  final Widget widget;

  SizeTransitionRoute({this.widget}) : super(
    transitionDuration: Duration(milliseconds: 1000),
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return widget;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return Align(
          child: SizeTransition(
            sizeFactor: animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
            child: child,
          ),
        );
      },
  );
}

class ScaleTransitionRoute extends PageRouteBuilder {
  final Widget widget;

  ScaleTransitionRoute({this.widget}) : super(
    transitionDuration: Duration(milliseconds: 1000),
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
      return ScaleTransition(
        scale: animation,
        alignment: Alignment.topRight,
        child: child,
      );
    },
  );
}

class FadeTransitionRoute extends PageRouteBuilder {
  final Widget widget;

  FadeTransitionRoute({this.widget}) : super(
    transitionDuration: Duration(milliseconds: 1000),
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

class SlideUpRoute extends PageRouteBuilder {
  final Widget widget;

  SlideUpRoute({this.widget}) : super(
    transitionDuration: Duration(milliseconds: 1000),
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: const Offset(0.0, 0.0),
        ).animate(animation),
        //).animate(CurvedAnimation(parent: animation, curve: Curves.elasticInOut)),
        child: child,
      );
    },
  );
}