import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class CastCard extends StatelessWidget {
  const CastCard(
      {super.key,
      required this.imagePath,
      required this.name,
      required this.character});
  final String imagePath;
  final String name;
  final String character;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.grey, borderRadius: BorderRadius.circular(16)),
      child: Row(
        spacing: 10,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imagePath,
              height: 70.h,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 280.w,
                child: Text(
                  'Name : $name',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                      fontFamily: 'Roboto'),
                ),
              ),
              SizedBox(
                width: 280.w,
                child: Text(
                  'Character : $character',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                      fontFamily: 'Roboto'),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
