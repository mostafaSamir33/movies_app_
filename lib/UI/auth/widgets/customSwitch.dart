import 'package:flutter/material.dart';
import 'package:movies_app/UI/auth/providers/switch_provider.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:provider/provider.dart';

class CustomSwitch extends StatefulWidget {
  final String inactiveIcon;
  final String activeIcon;

  const CustomSwitch({
    super.key,
    required this.inactiveIcon,
    required this.activeIcon,
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    final switchProvider = context.watch<SwitchProvider>();
    return Switch(
      value: switchProvider.isActive,
      onChanged: (value) {
        switchProvider.toggleSwitch(value);
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
