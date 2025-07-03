import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/UI/movieDetails/model/movie_details_model.dart';
import 'package:movies_app/UI/movieDetails/view/widgets/cast_card.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class CastSectionView extends StatelessWidget {
  const CastSectionView({super.key, required this.cast});
  final List<Cast> cast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cast',
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
                color: AppColors.white),
          ),
          SizedBox(
            height: 16.h,
          ),
          ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                    height: 8.h,
                  ),
              itemCount: cast.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                Cast castMember = cast[index];
                return CastCard(
                    imagePath: castMember.urlSmallImage ??
                        'https://static.vecteezy.com/system/resources/previews/014/194/232/original/avatar-icon-human-a-person-s-badge-social-media-profile-symbol-the-symbol-of-a-person-vector.jpg',
                    name: castMember.name ?? 'No Name Available',
                    character:
                        castMember.characterName ?? 'No Character Available');
              })
        ],
      ),
    );
  }
}
