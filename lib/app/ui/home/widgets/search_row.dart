import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_theme.dart';
import '../../../localization/app_localizations.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: AppTheme.cream,
              borderRadius: BorderRadius.circular(14),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: AppLocalizations.tr('search_products'),
                border: InputBorder.none,
                filled: true,
                fillColor: AppTheme.cream,
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppTheme.primaryOrange,
                  size: 25,
                ),
              ),
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 10.5.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 12.w,
          height: 12.w,
          decoration: BoxDecoration(
            color: AppTheme.cream,
            border: Border.all(color: AppTheme.primaryOrange, width: 1.2),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(AppAssets.iconFilter, fit: BoxFit.contain),
        ),
      ],
    );
  }
}
