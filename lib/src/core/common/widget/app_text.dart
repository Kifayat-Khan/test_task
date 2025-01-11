import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final String text;
  const HeadingText({
    super.key,
    this.fontSize,
    this.color,
    this.fontWeight,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(
        context,
      ).textTheme.headlineLarge?.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
    );
  }
}

class LabelText extends StatelessWidget {
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final String text;
  const LabelText({
    super.key,
    this.fontSize,
    this.color,
    this.fontWeight,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(
        context,
      ).textTheme.headlineMedium?.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
    );
  }
}

class BodyText extends StatelessWidget {
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final String text;
  const BodyText({
    super.key,
    this.fontSize,
    this.color,
    this.fontWeight,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(
        context,
      ).textTheme.bodyMedium?.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
    );
  }
}

class SmallText extends StatelessWidget {
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final String text;
  const SmallText({
    super.key,
    this.fontSize,
    this.color,
    this.fontWeight,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(
        context,
      ).textTheme.bodySmall?.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
    );
  }
}
