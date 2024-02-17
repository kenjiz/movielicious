import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movielicious/src/features/genres/domain/models/genre.dart';

extension MovieGenres on List<Genre> {
  String get getGenresAsString => map((g) => g.name).take(2).join('/');
}

// Gap extension on list of widget
extension GappedList on List<Widget> {
  List<Widget> addEqualGap({
    required Gap gap,
    bool addToLast = false,
    Gap? startGap,
    Gap? endGap,
  }) {
    final List<Widget> childrenWithGap = [];
    final children = this;
    for (int i = 0; i < length; i++) {
      childrenWithGap.add(children[i]);
      if (i < length - 1) {
        childrenWithGap.add(gap);
      }
    }

    if (startGap != null) {
      childrenWithGap.insert(0, startGap);
    }

    if (endGap != null && !addToLast) {
      childrenWithGap.add(endGap);
    }

    if (addToLast) {
      // if lastGap has value, use that instead
      Gap lastGap = endGap ?? gap;
      // making sure it's at last index
      childrenWithGap.add(lastGap);
    }

    return childrenWithGap;
  }
}
