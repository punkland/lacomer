import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_theme.dart';
import '../../../localization/app_localizations.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppTheme.secondaryGreen,
                    width: 1.2,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppLocalizations.tr('change_store'),
                      style: TextStyle(
                        color: AppTheme.secondaryGreen,
                        fontWeight: FontWeight.w600,
                        fontSize: 9.5.sp,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppTheme.secondaryGreen,
                      size: 16,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  Image.asset(
                    AppAssets.iconPin,
                    width: 16.sp,
                    fit: BoxFit.cover,
                  ),

                  const SizedBox(width: 6),
                  Text(
                    AppLocalizations.tr('store_name'),
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: 11.5.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.5.h),

            ],
          ),
        ),
        SizedBox(
          width: 12.w,
          height: 12.w,

          child: SvgPicture.asset(AppAssets.iconMenu),
        ),
      ],
    );
  }
}
