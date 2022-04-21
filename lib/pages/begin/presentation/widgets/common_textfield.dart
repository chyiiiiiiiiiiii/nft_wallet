import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nft_wallet/core/util/theme.dart';

class CommonTextField extends StatelessWidget {
  final int? maxLines;
  final int? minLines;
  final bool autoFocus;
  final bool obscureText;
  final String? hint;
  final TextStyle? hintStyle;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? textInputFormatter;
  final TextEditingController textEditingController;
  final FocusNode? focusNode;
  final bool readOnly;
  final Function()? onComplete;

  const CommonTextField({
    Key? key,
    this.maxLines,
    this.minLines,
    this.autoFocus = false,
    this.obscureText = false,
    this.hint,
    this.hintStyle,
    this.borderRadius,
    this.backgroundColor,
    this.keyboardType,
    this.textInputAction = TextInputAction.done,
    this.textInputFormatter,
    required this.textEditingController,
    this.focusNode,
    this.readOnly = false,
    this.onComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 14.0),
      keyboardType: keyboardType,
      maxLines: maxLines,
      minLines: minLines ?? 1,
      autofocus: autoFocus,
      obscureText: obscureText,
      cursorColor: Colors.brown,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintStyle,
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: backgroundColor ?? CustomTheme.lightGray,
      ),
      inputFormatters: textInputFormatter,
      textInputAction: textInputAction,
      controller: textEditingController,
      focusNode: focusNode,
      readOnly: readOnly,
      onEditingComplete: onComplete,
    );
  }
}
