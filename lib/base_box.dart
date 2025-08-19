import 'package:flutter/material.dart';

/// A customizable container widget with support for tap, hover, tooltip, and rich styling options.
///
/// This widget wraps its [child] with customizable padding, margin, background color, border,
/// border radius, shadow, gradient, alignment, and interactive features like tap and hover.
///
/// Features:
/// - Handles tap via [onTap].
/// - Handles hover state changes via [onHover].
/// - Displays a tooltip with the given [tooltip] message.
/// - Supports splash and hover colors.
/// - Customizable size via [height] and [width].
/// - Allows setting padding and margin independently for horizontal and vertical directions.
/// - Supports border color, width, and radius.
/// - Supports box shadows and gradients.
///
/// Example usage:
/// BaseBox(
///   height: 100,
///   width: 100,
///   color: Colors.blue,
///   borderRadius: 12,
///   onTap: () => print('Tapped!'),
///   tooltip: 'Tap me',
///   child: Icon(Icons.touch_app, color: Colors.white),
/// )
class BaseBox extends StatelessWidget {
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
  final Function()? onTap;
  final Function(bool isHovered)? onHover;
  final Widget? child;
  final double? height;
  final double? width;
  final double? paddingAll;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingTop;
  final double? paddingBottom;
  final double? marginAll;
  final double? marginHorizontal;
  final double? marginVertical;
  final double? marginLeft;
  final double? marginRight;
  final double? marginTop;
  final double? marginBottom;
  final double radius;
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final Alignment? alignment;
  final String? tooltip;
  final Color? splashColor;
  final Color? hoverColor;
  final bool centerChild;
  final bool isCircle;
  final BorderSide? leftBorder;
  final BorderSide? rightBorder;
  final BorderSide? topBorder;
  final BorderSide? bottomBorder;
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
