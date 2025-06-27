import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class Customswitch extends StatefulWidget {
  final String inactiveIcon;
  final String activeIcon;

  Customswitch({
    required this.inactiveIcon,
    required this.activeIcon,
  });

  @override
  State<Customswitch> createState() => _CustomswitchState();
}

class _CustomswitchState extends State<Customswitch> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _value,
      onChanged: (value) {
        _value = value;

        setState(() {});
      },
      activeColor: AppColors.yellow,
      inactiveThumbColor: AppColors.yellow,
      inactiveTrackColor: AppColors.grey,
      activeTrackColor: AppColors.yellow,
      inactiveThumbImage: AssetImage(widget.inactiveIcon),
      activeThumbImage: AssetImage(widget.activeIcon),
      trackOutlineColor: MaterialStateProperty.all(AppColors.yellow),
    );
  }
}
