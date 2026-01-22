import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_theme.dart';
import '../../../localization/app_localizations.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      padding: const EdgeInsets.fromLTRB(16, 1, 1, 1),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: AppTheme.shadow,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned(
                left: 22,
                top: 14,
                child: SizedBox(
                  width: 60.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.tr('promo_title'),
                        style: TextStyle(
                          fontSize: 11.5.sp,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textPrimary,
                          height: 1.2,
                        ),
                        maxLines: 3,
                        softWrap: true,
                      ),
                      SizedBox(height: 2.h),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppTheme.textPrimary),
                          foregroundColor: AppTheme.secondaryGreen,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 6,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.tr('view_offer'),
                          style: TextStyle(fontSize: 10.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: SizedBox(
                  width: 60.w,
                  height: 12.5.h,
                  child: Image.asset(
                    AppAssets.banner,
                    fit: BoxFit.contain,
                    alignment: Alignment.bottomRight,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
