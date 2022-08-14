import 'package:flutter/material.dart';

class BadgeButton extends StatelessWidget {
  final Color? badgeColor;
  final Color? iconColor;
  final IconData icon;
  final String countBasis;
  final bool visibility;
  final VoidCallback onPressed;

  const BadgeButton(
      {Key? key,
      this.badgeColor,
      this.iconColor,
      required this.icon,
      required this.countBasis,
      required this.onPressed,
      required this.visibility})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: iconColor ?? Colors.white,
          ),
        ),
        Visibility(
          visible: visibility,
          child: Positioned.directional(
            top: 5,
            textDirection: TextDirection.ltr,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: badgeColor ?? Colors.red,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  countBasis,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
