import 'package:flutter/material.dart';

import '../../../../core/util/theme.dart';

class CommonButton extends StatefulWidget {
  const CommonButton({
    Key? key,
    this.padding,
    this.color = CustomTheme.primaryColor,
    required this.onPress,
    required this.child,
  }) : super(key: key);

  final EdgeInsets? padding;
  final Color color;
  final Widget child;
  final Function() onPress;

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  BoxDecoration _getDecoration() {
    return BoxDecoration(
      color: widget.color,
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 4),
          color: widget.color.withOpacity(0.75),
        ),
      ],
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        decoration: _getDecoration(),
        child: widget.child,
      ),
    );
  }
}
