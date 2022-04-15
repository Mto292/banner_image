import 'package:flutter/material.dart';
import 'banner_image_view_model.dart';

class BannerImageView extends BannerImageViewModel {
  @override
  Widget build(BuildContext context) {
    assert(widget.imageUrlList != null || widget.children != null);
    return Column(
      children: [
        AspectRatio(
          aspectRatio: widget.aspectRatio ?? 24 / 9,
          child: PageView.builder(
            controller: controller,
            onPageChanged: onPageChange,
            itemBuilder: (BuildContext context, int index) {
              index = getIndex(index);
              return widget.children?[index] ??
                  Container(
                    margin: widget.padding ??
                        const EdgeInsets.symmetric(horizontal: 15),
                    decoration: widget.cardDecoration ??
                        BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      widget.imageUrlList![index],
                      fit: widget.fit ?? BoxFit.cover,
                    ),
                  );
            },
          ),
        ),
        widget.withOutIndicator
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
      ],
    );
  }
}
