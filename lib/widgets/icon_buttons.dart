import 'package:diary_chat/theme.dart';
import 'package:flutter/material.dart';

class IconBackground extends StatelessWidget {
  const IconBackground({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Icon(
            icon,
            size: 40,
            color: AppColors.cardLight,
          ),
        ),
      ),
    );
  }
}

class IconBorder extends StatelessWidget {
  const IconBorder({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.primary,
      onTap: onTap,
      child: Container(
        child: Icon(icon, size: 35, color: AppColors.cardLight),
      ),
    );
  }
}
