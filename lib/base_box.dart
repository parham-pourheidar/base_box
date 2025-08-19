import 'package:flutter/material.dart';

/// A customizable container widget with support for tap, hover, tooltip, and rich styling options.
///
/// This widget wraps its [child] with customizable padding, margin, background color, border,
/// border radius, shadow, gradient, alignment, and interactive features like tap and hover.
class BaseBox extends StatelessWidget {
  /// Creates a [BaseBox] widget.
  ///
  /// [child] is the content of the box.
  /// [height] and [width] set the size of the box.
  /// [color] sets the background color.
  /// [borderColor] and [borderWidth] control the border appearance.
  /// [alignment] aligns the child within the box.
  const BaseBox({
    super.key,
    this.child,
    this.onTap,
    this.height,
    this.width,
    this.radius = 8,
    this.color,
    this.borderColor,
    this.borderWidth,
    this.boxShadow,
    this.gradient,
    this.alignment,
    this.onHover,
    this.paddingHorizontal,
    this.paddingVertical,
    this.marginHorizontal,
    this.marginVertical,
    this.tooltip,
    this.splashColor,
    this.hoverColor,
    this.paddingAll,
    this.paddingLeft,
    this.paddingRight,
    this.paddingTop,
    this.paddingBottom,
    this.centerChild = true,
    this.marginAll,
    this.marginLeft,
    this.marginRight,
    this.marginTop,
    this.marginBottom,
    this.isCircle = false,
    this.leftBorder,
    this.rightBorder,
    this.topBorder,
    this.bottomBorder,
    this.clipBehavior = Clip.antiAlias,
  });
  /// Callback when the box is tapped.
  final Function()? onTap;

  /// Callback when the box is hovered (desktop/web).
  final Function(bool isHovered)? onHover;

  /// The content of the box.
  final Widget? child;

  /// Height of the box.
  final double? height;

  /// Width of the box.
  final double? width;

  /// Border radius of the box.
  final double radius;

  /// Background color of the box.
  final Color? color;

  /// Border color of the box.
  final Color? borderColor;

  /// Border width of the box.
  final double? borderWidth;

  /// Box shadows.
  final List<BoxShadow>? boxShadow;

  /// Background gradient.
  final Gradient? gradient;

  /// Alignment of the child.
  final Alignment? alignment;

  /// Padding around the child.
  final double? paddingAll;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingTop;
  final double? paddingBottom;

  /// Margin around the box.
  final double? marginAll;
  final double? marginHorizontal;
  final double? marginVertical;
  final double? marginLeft;
  final double? marginRight;
  final double? marginTop;
  final double? marginBottom;

  /// Tooltip message.
  final String? tooltip;

  /// Splash color for tap effect.
  final Color? splashColor;

  /// Hover color for desktop/web.
  final Color? hoverColor;

  /// Centers the child by default.
  final bool centerChild;

  /// Makes the box circular if true.
  final bool isCircle;

  /// Individual side borders.
  final BorderSide? leftBorder;
  final BorderSide? rightBorder;
  final BorderSide? topBorder;
  final BorderSide? bottomBorder;

  /// Clip behavior of the container.
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    return tooltip != null
        ? Tooltip(message: tooltip, child: _child())
        : _child();
  }

  Widget _child() {
    return (onTap != null || onHover != null) ? _inkwell() : _container();
  }

  Widget _inkwell() {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      color: color,
      child: InkWell(
        splashColor: splashColor,
        hoverColor: hoverColor ?? color,
        onTap: onTap,
        onHover: onHover,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: _container(),
      ),
    );
  }

  Container _container() {
    return Container(
      clipBehavior: clipBehavior,
      margin: _margin(),
      padding: _padding(),
      height: height,
      width: width,
      alignment: alignment ?? (centerChild ? Alignment.center : null),
      decoration: BoxDecoration(
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        border: _border(),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        boxShadow: boxShadow,
        gradient: gradient,
      ),
      child: child,
    );
  }

  BoxBorder? _border() {
    if (isCircle == true) {
      return null;
    } else if (borderColor != null || borderWidth != null) {
      return Border.all(
        color: borderColor ?? Colors.transparent,
        width: borderWidth ?? 1,
      );
    } else if (leftBorder != null ||
        rightBorder != null ||
        topBorder != null ||
        bottomBorder != null) {
      return Border(
        right: rightBorder ?? BorderSide.none,
        left: leftBorder ?? BorderSide.none,
        top: topBorder ?? BorderSide.none,
        bottom: bottomBorder ?? BorderSide.none,
      );
    } else {
      return null;
    }
  }

  EdgeInsetsGeometry? _padding() {
    if (paddingAll != null) {
      return EdgeInsets.all(paddingAll!);
    } else if (paddingVertical != null || paddingHorizontal != null) {
      return EdgeInsets.symmetric(
        horizontal: paddingHorizontal ?? 0,
        vertical: paddingVertical ?? 0,
      );
    } else if (paddingLeft != null ||
        paddingRight != null ||
        paddingTop != null ||
        paddingBottom != null) {
      return EdgeInsets.fromLTRB(
        paddingLeft ?? 0,
        paddingTop ?? 0,
        paddingRight ?? 0,
        paddingBottom ?? 0,
      );
    }
    return null;
  }

  EdgeInsetsGeometry? _margin() {
    if (marginAll != null) {
      return EdgeInsets.all(marginAll!);
    } else if (marginVertical != null || marginHorizontal != null) {
      return EdgeInsets.symmetric(
        horizontal: marginHorizontal ?? 0,
        vertical: marginVertical ?? 0,
      );
    } else if (marginLeft != null ||
        marginRight != null ||
        marginTop != null ||
        marginBottom != null) {
      return EdgeInsets.fromLTRB(
        marginLeft ?? 0,
        marginTop ?? 0,
        marginRight ?? 0,
        marginBottom ?? 0,
      );
    }
    return null;
  }
}

/// Example usage:
///
/// ```dart
/// BaseBox(
///   width: 150,
///   height: 150,
///   color: Colors.blue,
///   borderColor: Colors.black,
///   borderWidth: 2,
///   child: const Text('Hello BaseBox', style: TextStyle(color: Colors.white)),
/// )
/// ```