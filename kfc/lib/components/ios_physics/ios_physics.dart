import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/physics.dart';

import 'package:flutter/cupertino.dart';

class iOSPhysics extends BouncingScrollPhysics {
  /// Creates scroll physics that bounce back from the edge.
  const iOSPhysics({ScrollPhysics parent}) : super(parent: parent);

  @override
  iOSPhysics applyTo(ScrollPhysics ancestor) {
    return iOSPhysics(parent: buildParent(ancestor));
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    final Tolerance tolerance = this.tolerance;
    if (velocity.abs() >= tolerance.velocity || position.outOfRange) {
      return BouncingScrollSimulation(
        spring: spring,
        position: position.pixels,
        velocity: velocity *
            0.998, // https://reactnative.dev/docs/scrollview#decelerationrate
        leadingExtent: position.minScrollExtent,
        trailingExtent: position.maxScrollExtent,
        tolerance: tolerance,
      );
    }
    return null;
  }
}
