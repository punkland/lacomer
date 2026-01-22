import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_theme.dart';
import '../../../localization/app_localizations.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 10),
          decoration: const BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: AppTheme.shadow,
                blurRadius: 14,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            children: const [
              Expanded(child: _NavItem(label: 'nav_home', icon: _NavIcon.home)),
              Expanded(
                child: _NavItem(label: 'nav_discounts', icon: _NavIcon.discount),
              ),
              Expanded(child: _NavItem(label: 'nav_cart', icon: _NavIcon.cart)),
              Expanded(
                child: _NavItem(label: 'nav_wishlist', icon: _NavIcon.heart),
              ),
              Expanded(
                child: _NavItem(label: 'nav_account', icon: _NavIcon.user),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [
                    AppTheme.shadow.withValues(alpha: 0.22),
                    AppTheme.shadow.withValues(alpha: 0.06),
                    AppTheme.transparent,
                  ],
                  stops: const [0.0, 0.25, 0.55],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

enum _NavIcon { home, discount, cart, heart, user }

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.icon,
  });

  final String label;
  final _NavIcon icon;

  @override
  Widget build(BuildContext context) {
    const iconColor = AppTheme.primaryOrange;
    const textColor = AppTheme.textPrimary;

    Widget iconWidget;
    switch (icon) {
      case _NavIcon.home:
        iconWidget = SvgPicture.asset(
          AppAssets.iconHomeSvg,
          width: 4.8.w,
          height: 4.8.w,
          colorFilter: const ColorFilter.mode(iconColor, BlendMode.srcIn),
        );
        break;
      case _NavIcon.discount:
        iconWidget = SvgPicture.asset(
          AppAssets.iconOffers,
          width: 4.8.w,
          height: 4.8.w,
          colorFilter: const ColorFilter.mode(iconColor, BlendMode.srcIn),
        );
        break;
      case _NavIcon.cart:
        iconWidget = SvgPicture.asset(
          AppAssets.iconCart,
          width: 4.8.w,
          height: 4.8.w,
          colorFilter: const ColorFilter.mode(iconColor, BlendMode.srcIn),
        );
        break;
      case _NavIcon.heart:
        iconWidget = SvgPicture.asset(
          AppAssets.iconHeart,
          width: 4.8.w,
          height: 4.8.w,
          colorFilter: const ColorFilter.mode(iconColor, BlendMode.srcIn),
        );
        break;
      case _NavIcon.user:
        iconWidget = SvgPicture.asset(
          AppAssets.iconUser,
          width: 4.8.w,
          height: 4.8.w,
          colorFilter: const ColorFilter.mode(iconColor, BlendMode.srcIn),
        );
        break;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        iconWidget,
        const SizedBox(height: 8),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            AppLocalizations.tr(label),
            style: TextStyle(
              fontSize: 8.sp,
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
