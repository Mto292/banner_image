import 'package:flutter/material.dart';
import 'banner_image.dart';
import 'package:async/async.dart';

abstract class BannerImageViewModel extends State<BannerImage> {
  late final PageController controller;
  late int previousIndex;
  late final Widget Function(BuildContext context, int index) getItem;

  RestartableTimer? _timer;
  final ValueNotifier<int> valueListenable = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    if (widget.itemBuilder != null) {
      getItem = (context, index) => widget.itemBuilder!.call(context, index);
    } else if (widget.children != null) {
      getItem = (context, index) => widget.children![index];
    } else {
      getItem = (context, index) => Image.network(
            widget.imageUrlList![index],
            fit: widget.fit ?? BoxFit.cover,
            errorBuilder: widget.errorBuilder,
            loadingBuilder: widget.loadingBuilder,
          );
    }

    final length = widget.endlessPages ? 1000 * widget.itemLength : 0;
    controller = PageController(
      initialPage: length,
      keepPage: widget.keepPage,
      viewportFraction: widget.viewportFraction,
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
    final valuee = getIndex(value);
    valueListenable.value = getIndex(valuee);
    if (_timer != null) _timer?.reset();
    if (widget.onPageChanged != null) {
      widget.onPageChanged!(valueListenable.value);
    }
  }

  void nextPage() {
    if (controller.page == widget.itemLength - 1) {
      controller.animateTo(
        0,
        duration: widget.duration ?? const Duration(milliseconds: 300),
        curve: widget.curve ?? Curves.linear,
      );
    } else {
      controller.nextPage(
        duration: widget.duration ?? const Duration(milliseconds: 300),
        curve: widget.curve ?? Curves.linear,
      );
    }
  }

  int getIndex(int value) {
    final a = value / widget.itemLength;
    final c = (a - a.toInt()) * widget.itemLength;
    final d = c.round();
    return d == -1 ? 0 : d;
  }
}
