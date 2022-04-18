import 'dart:core';
import 'package:flutter/material.dart';
import 'banner_image_view.dart';

class BannerImage extends StatefulWidget {
  final double? aspectRatio;
  final ValueChanged<int>? onPageChanged;
  final List<Widget>? children;
  final List<String>? imageUrlList;
  final int itemLength;
  final bool withOutIndicator;
  final Color? selectedIndicatorColor;
  final Color? indicatorColor;
  final Decoration? cardDecoration;
  final EdgeInsetsGeometry? padding;
  final BoxFit? fit;
  final Duration? duration;
  final Duration? timerDuration;
  final Curve? curve;
  final double? indicatorRadius;
  final bool autoPlay;
  final Axis scrollDirection;
  final GestureTapCallback? onTap;

  const BannerImage({
    Key? key,
    required this.itemLength,
    this.aspectRatio,
    this.onPageChanged,
    this.children,
    this.imageUrlList,
    this.withOutIndicator = false,
    this.selectedIndicatorColor,
    this.indicatorColor,
    this.cardDecoration,
    this.padding,
    this.fit,
    this.duration,
    this.timerDuration,
    this.curve,
    this.indicatorRadius,
    this.autoPlay = false,
    this.scrollDirection = Axis.horizontal,
    this.onTap,
  }) : super(key: key);

  @override
  State<BannerImage> createState() => BannerImageView();
}
