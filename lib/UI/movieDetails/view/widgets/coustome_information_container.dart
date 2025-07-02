import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class CoustomeInformationContainer extends StatelessWidget {
  const CoustomeInformationContainer(
      {super.key, required this.icon, required this.data});
  final String icon;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(icon),
            size: 25,
            color: AppColors.amber,
          ),
          SizedBox(
            width: 14,
          ),
          Text(
            data,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
                color: AppColors.white),
          )
        ],
      ),
    );
  }
}
