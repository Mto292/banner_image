import 'package:banner_image/banner_image.dart';
import 'package:flutter/material.dart';
import 'banner_image_view_model.dart';

class BannerImageView extends BannerImageViewModel {
  @override
  Widget build(BuildContext context) {
    if (widget.itemLength == 0) return const SizedBox.shrink();
    final banner = ClipRRect(
      borderRadius: widget.borderRadius ?? const BorderRadius.only(),
      clipBehavior: widget.clipBehavior ?? Clip.antiAlias,
      child: AspectRatio(
        aspectRatio: widget.aspectRatio ?? 24 / 9,
        child: PageView.builder(
          controller: controller,
          physics: widget.physics,
          scrollDirection: widget.scrollDirection,
          onPageChanged: onPageChange,
          itemBuilder: (BuildContext context, int index) {
            index = getIndex(index);
            return GestureDetector(
              onTap: widget.onTap == null ? null : () => widget.onTap!(index),
              child: widget.children?[index] ??
                  Image.network(
                    widget.imageUrlList![index],
                    fit: widget.fit ?? BoxFit.cover,
                    errorBuilder: widget.errorBuilder,
                    loadingBuilder: widget.loadingBuilder,
                  ),
            );
          },
        ),
      ),
    );
    if (widget.indicatorPosition == IndicatorPosition.none) {
      return Padding(
        padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 15),
        child: banner,
      );
    } else {
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
      } else {
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
    }
  }
}
