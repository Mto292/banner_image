import 'dart:core';
import 'package:flutter/material.dart';
import 'banner_image_view.dart';

enum IndicatorPosition { none, on, under }

class BannerImage extends StatefulWidget {
  final double? aspectRatio;
  final ValueChanged<int>? onPageChanged;

  // PageView
  final List<Widget>? children;

  // PageView.builder
  final IndexedWidgetBuilder? itemBuilder;

  final List<String>? imageUrlList;
  final int itemLength;

  final IndicatorPosition indicatorPosition;
  final Color? selectedIndicatorColor;
  final Color? indicatorColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry indicatorPadding;
  final BoxFit? fit;
  final Duration? duration;
  final Duration? timerDuration;
  final Curve? curve;
  final double? indicatorRadius;
  final bool autoPlay;
  final Axis scrollDirection;
  final Function(int)? onTap;
  final BorderRadius? borderRadius;
  final Clip? clipBehavior;
  final ImageErrorWidgetBuilder? errorBuilder;
  final ImageLoadingBuilder? loadingBuilder;
  final ScrollPhysics? physics;
  final bool keepPage;
  final bool padEnds;
  final double viewportFraction;

  final bool isBuilder;
  final bool endlessPages;

  /// Normal constructor → PageView
  const BannerImage({
    Key? key,
    required this.itemLength,
    this.children,
    this.imageUrlList,
    this.aspectRatio,
    this.onPageChanged,
    this.indicatorPosition = IndicatorPosition.none,
    this.selectedIndicatorColor,
    this.indicatorColor,
    this.borderRadius,
    this.padding,
    this.indicatorPadding = const EdgeInsets.symmetric(vertical: 8),
    this.fit,
    this.duration,
    this.timerDuration,
    this.curve,
    this.indicatorRadius,
    this.autoPlay = false,
    this.scrollDirection = Axis.horizontal,
    this.onTap,
    this.clipBehavior,
    this.errorBuilder,
    this.loadingBuilder,
    this.physics,
    this.keepPage = true,
    this.padEnds = true,
    this.viewportFraction = 1.0,
  })  : isBuilder = false,
        endlessPages = false,
        itemBuilder = null,
        assert(children != null || imageUrlList != null),
        super(key: key);

  /// Builder constructor → PageView.builder
  const BannerImage.builder({
    Key? key,
    required this.itemLength,
    this.itemBuilder,
    this.children,
    this.imageUrlList,
    this.aspectRatio,
    this.onPageChanged,
    this.indicatorPosition = IndicatorPosition.none,
    this.selectedIndicatorColor,
    this.indicatorColor,
    this.borderRadius,
    this.padding,
    this.indicatorPadding = const EdgeInsets.symmetric(vertical: 8),
    this.fit,
    this.duration,
    this.timerDuration,
    this.curve,
    this.indicatorRadius,
    this.autoPlay = false,
    this.scrollDirection = Axis.horizontal,
    this.onTap,
    this.clipBehavior,
    this.errorBuilder,
    this.loadingBuilder,
    this.physics,
    this.keepPage = true,
    this.padEnds = true,
    this.viewportFraction = 1.0,
    this.endlessPages = true,
  })  : isBuilder = true,
        assert(itemBuilder != null || imageUrlList != null || children != null),
        super(key: key);

  @override
  State<BannerImage> createState() => BannerImageView();
}
