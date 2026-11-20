import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class PostActionButton extends StatelessWidget {
  const PostActionButton({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: onPressed,
      avatar: Icon(icon, size: ScreenUtil().setSp(16), color: FB_PRIMARY),
      label: Text(label),
      labelStyle: TextStyle(
        color: FB_DARK_PRIMARY,
        fontSize: ScreenUtil().setSp(12),
      ),
      backgroundColor: const Color(0xFFEAF2FF),
      side: const BorderSide(color: Color(0xFFD4E3FF)),
      shape: const StadiumBorder(),
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(4)),
    );
  }
}
