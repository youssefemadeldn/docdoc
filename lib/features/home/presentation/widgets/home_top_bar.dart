import 'package:docdoc/core/theme/app_colors.dart';
import 'package:docdoc/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Youssef!',
              style: AppStyles.font18DarkBlueBold,
            ),
            Text(
              'How Are you Today?',
              style: AppStyles.font12GreyRegular,
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          backgroundColor: AppColors.moreLighterGrey,
          radius: 24,
          child: SvgPicture.asset('assets/svgs/notification.svg'),
        )
      ],
    );
  }
}
