import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theme/app_colors.dart';
import 'package:docdoc/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class PasswordValidation extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacter;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidation({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacter,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        verticalSpace(height: 2),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        verticalSpace(height: 2),
        buildValidationRow('At least 1 special character', hasSpecialCharacter),
        verticalSpace(height: 2),
        buildValidationRow('At least 1 number', hasNumber),
        verticalSpace(height: 2),
        buildValidationRow('At least 8 characters long', hasLowerCase),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: AppColors.grey,
        ),
        horizontalSpace(width: 6),
        Text(
          text,
          style: AppStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: AppColors.green,
            decorationThickness: 2,
            color: hasValidated ? AppColors.grey : AppColors.darkBlue,
          ),
        ),
      ],
    );
  }
}
