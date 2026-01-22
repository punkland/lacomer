import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_theme.dart';

class CartControl extends StatelessWidget {
  const CartControl({
    super.key,
    required this.isAdded,
    required this.onToggle,
  });

  final bool isAdded;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    if (!isAdded) {
      return GestureDetector(
        onTap: onToggle,
        child: SizedBox(
          width: 10.w,
          height: 10.w,
          child: Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Align(
              alignment: Alignment.topRight,
              child: Transform.translate(
                offset: const Offset(6, 0),
                child: SvgPicture.asset(
                  AppAssets.iconPlusSvg,
                  width: 10.w,
                  height: 10.w,
                  colorFilter: const ColorFilter.mode(
                    AppTheme.secondaryGreen,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Container(

      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.secondaryGreen),
      ),
      child: Row(
        children: [
          const _ControlButton(
            icon: AppAssets.iconMinusSvg,
          ),
           SizedBox(width: 1.w),
          Text(
            '1 kg',
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 9.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
           SizedBox(width: 1.w),
          _ControlButton(
            icon: AppAssets.iconPlusSvg,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  const _ControlButton({required this.icon, this.onTap});

  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 6.w,
        width: 6.w,
        child: SvgPicture.asset(
          icon,
          colorFilter: const ColorFilter.mode(
            AppTheme.secondaryGreen,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
