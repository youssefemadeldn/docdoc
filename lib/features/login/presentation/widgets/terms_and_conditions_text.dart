import 'package:docdoc/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: AppStyles.font13GrayRegular,
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style: AppStyles.font13DarkBlueMedium,
          ),
          TextSpan(
            text: ' and',
            style: AppStyles.font13GrayRegular.copyWith(height: 1.5),
          ),
          TextSpan(
            text: ' Privacy Policy',
            style: AppStyles.font13DarkBlueMedium,
          ),
        ],
      ),
    );
  }
}
