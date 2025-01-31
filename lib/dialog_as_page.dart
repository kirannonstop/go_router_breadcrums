import 'package:flutter/material.dart';
import 'package:go_router_demo/extensions.dart';

class DialogPage<T> extends Page<T> {
  final Offset? anchorPoint;
  final Color? barrierColor;
  final bool barrierDismissible;
  final String? barrierLabel;
  final bool useSafeArea;
  final CapturedThemes? themes;
  final WidgetBuilder builder;
  final EdgeInsetsGeometry? contentPadding; // For padding inside the dialog
  final double? width; // Width constraint for the dialog
  final double? height; // Height constraint for the dialog
  final BorderRadiusGeometry? borderRadius; // Rounded corners

  const DialogPage({
    required this.builder,
    this.anchorPoint,
    this.barrierColor = Colors.black54,
    this.barrierDismissible = true,
    this.barrierLabel,
    this.useSafeArea = true,
    this.themes,
    this.contentPadding,
    this.width,
    this.height,
    this.borderRadius,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) => DialogRoute<T>(
        context: context,
        settings: this,
        builder: (context) => Dialog(
          backgroundColor: Colors.white,
          elevation: 24,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16.0),
          ),
          child: SizedBox(
            width: width ?? context.width * 0.8,
            height: height ?? context.height * 0.8,
            child: builder(context),
          ),
        ),
        anchorPoint: anchorPoint,
        barrierColor: barrierColor,
        barrierDismissible: barrierDismissible,
        barrierLabel: barrierLabel,
        useSafeArea: useSafeArea,
        themes: themes,
      );
}
