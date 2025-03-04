import 'dart:core';
import 'package:flutter/material.dart';
import 'banner_image_view.dart';

enum IndicatorPosition { none, on, under }

class BannerImage extends StatefulWidget {
  final double? aspectRatio;
  final ValueChanged<int>? onPageChanged;
  final List<Widget>? children;
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

  const BannerImage({
    Key? key,
    required this.itemLength,
    this.aspectRatio,
    this.onPageChanged,
    this.children,
    this.imageUrlList,
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
  })  : assert(imageUrlList != null || children != null,
            'At least one of the imageUrlList or children parameters must be filled.'),
        super(key: key);

  @override
  State<BannerImage> createState() => BannerImageView();
}
