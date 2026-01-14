import 'package:flutter/material.dart';
import 'banner_image.dart';
import 'banner_image_view_model.dart';

class BannerImageView extends BannerImageViewModel {
  @override
  Widget build(BuildContext context) {
    if (widget.itemLength == 0) {
      return const SizedBox.shrink();
    }

    final banner = ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.zero,
      clipBehavior: widget.clipBehavior ?? Clip.antiAlias,
      child: AspectRatio(
        aspectRatio: widget.aspectRatio ?? 24 / 9,
        child: _buildPageView(),
      ),
    );

    if (widget.indicatorPosition == IndicatorPosition.none) {
      return Padding(
        padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 15),
        child: banner,
      );
    }

    final indicator = Padding(
      padding: widget.indicatorPadding,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            widget.itemLength,
            (index) => Padding(
              padding: const EdgeInsets.all(2),
              child: ValueListenableBuilder(
                valueListenable: valueListenable,
                builder: (_, value, __) {
                  return AnimatedContainer(
                    height: (widget.indicatorRadius ?? 15) / 2,
                    width: (widget.indicatorRadius ?? 15) / 2,
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: valueListenable.value == index
                          ? widget.selectedIndicatorColor
                          : widget.indicatorColor ?? Colors.black12,
                      shape: BoxShape.circle,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );

    if (widget.indicatorPosition == IndicatorPosition.under) {
      return Column(
        children: [
          Padding(
            padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 15),
            child: banner,
          ),
          indicator
        ],
      );
    }

    /// Indicator ON banner
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 15),
      child: AspectRatio(
        aspectRatio: widget.aspectRatio ?? 24 / 9,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Positioned(right: 0, left: 0, child: banner),
            indicator,
          ],
        ),
      ),
    );
  }

  Widget _buildPageView() {
    if (widget.isBuilder) {
      return PageView.builder(
        itemCount: widget.endlessPages ? null : widget.itemLength,
        controller: controller,
        physics: widget.physics,
        scrollDirection: widget.scrollDirection,
        padEnds: widget.padEnds,
        onPageChanged: onPageChange,
        itemBuilder: (context, index) {
          index = getIndex(index);
          return GestureDetector(
            onTap: widget.onTap == null ? null : () => widget.onTap!(index),
            child: getItem(context, index),
          );
        },
      );
    }

    return PageView(
      controller: controller,
      physics: widget.physics,
      scrollDirection: widget.scrollDirection,
      padEnds: widget.padEnds,
      onPageChanged: onPageChange,
      children: List.generate(widget.itemLength, (index) {
        return GestureDetector(
          onTap: widget.onTap == null ? null : () => widget.onTap!(index),
          child: getItem(context, index),
        );
      }),
    );
  }
}
