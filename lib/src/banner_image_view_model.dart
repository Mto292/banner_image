import 'package:flutter/material.dart';
import 'banner_image.dart';
import 'package:async/async.dart';

abstract class BannerImageViewModel extends State<BannerImage> {
  late final PageController controller;
  late int previousIndex;
  RestartableTimer? _timer;
  final ValueNotifier<int> valueListenable = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    final length = 1000 * widget.itemLength;
    controller = PageController(
      initialPage: length,
      viewportFraction: widget.viewportFraction,
      keepPage: widget.keepPage,
    );
    previousIndex = length;
    if (widget.autoPlay) {
      _timer = RestartableTimer(
        widget.timerDuration ?? const Duration(seconds: 5),
        nextPage,
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    if (_timer != null) _timer?.cancel();
    valueListenable.dispose();
    super.dispose();
  }

  void onPageChange(int value) {
    valueListenable.value = getIndex(value);
    if (_timer != null) _timer?.reset();
    if (widget.onPageChanged != null) {
      widget.onPageChanged!(valueListenable.value);
    }
  }

  void nextPage() {
    controller.nextPage(
      duration: widget.duration ?? const Duration(milliseconds: 300),
      curve: widget.curve ?? Curves.linear,
    );
  }

  int getIndex(int value) {
    final a = value / widget.itemLength;
    final c = (a - a.toInt()) * widget.itemLength;
    final d = c.round();
    return d == -1 ? 0 : d;
  }
}
