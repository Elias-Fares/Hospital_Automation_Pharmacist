import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedReadMoreText extends StatefulWidget {
  final Clip clipBehavior;
  final Axis direction;
  final String? text;

  final int? maxLinesBeforeExpanded;
  final TextOverflow overflow;

  final String titleReadMore;
  final String titleShowLess;
  final VoidCallback? onPressedReadMore;

  final Duration duration;
  final bool enableLoadMorePress;
  final TextStyle? textStyle;
  final TextStyle? buttonStyle;

  final TextAlign? textAlign;

  const AnimatedReadMoreText({
    super.key,
    this.clipBehavior = Clip.none,
    this.direction = Axis.vertical,
    this.text,
    this.maxLinesBeforeExpanded = 3,
    this.overflow = TextOverflow.ellipsis,
    this.titleReadMore = "See More..",
    this.onPressedReadMore,
    this.enableLoadMorePress = true,
    this.titleShowLess = "Show less",
    this.duration = const Duration(milliseconds: 500),
    this.textStyle,
    this.buttonStyle,
    this.textAlign,
  });

  @override
  State<AnimatedReadMoreText> createState() => _AnimatedReadMoreTextState();
}

class _AnimatedReadMoreTextState extends State<AnimatedReadMoreText> {
  bool showMore = false;

  void toggleShowMore() {
    setState(() {
      showMore = !showMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSize(
          duration: widget.duration,
          child: Text(widget.text ?? "",
              maxLines: showMore ? 10000000 : widget.maxLinesBeforeExpanded,
              overflow: widget.overflow,
              style: widget.textStyle,
              textAlign: widget.textAlign),
        ),
        SizedBox(height: 5.h),
        if ((widget.text != null && widget.text!.length > 200)) ...[
          InkWell(
            onTap: () {
              if (widget.onPressedReadMore != null) {
                widget.onPressedReadMore!();
              }
              if (widget.enableLoadMorePress) {
                toggleShowMore();
              }
            },
            child: Text(
              showMore ? widget.titleShowLess : widget.titleReadMore,
              style: widget.buttonStyle,
            ),
          )
        ]
      ],
    );
  }
}
