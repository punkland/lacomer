import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_theme.dart';
import '../../../localization/app_localizations.dart';
import 'cart_control.dart';
import 'products_grid.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.item});

  final ProductItem item;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late bool _isFavorite;
  bool _isHovered = false;
  bool _isAdded = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.item.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    final showActive = _isHovered || _isFavorite;

    return Container(
      padding: const EdgeInsets.all(12),
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        widget.item.image,
                        width: 28.w,

                        fit: BoxFit.contain,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          MouseRegion(
                            onEnter: (_) => setState(() => _isHovered = true),
                            onExit: (_) => setState(() => _isHovered = false),
                            child: SizedBox(
                              width: 8.w,
                              height: 8.w,
                              child: GestureDetector(
                                onTap: () =>
                                    setState(() => _isFavorite = !_isFavorite),
                                child: Transform.translate(
                                  offset: const Offset(4, 0),
                                  child: SvgPicture.asset(
                                    showActive
                                        ? AppAssets.iconWishlistActive
                                        : AppAssets.iconWishlist,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (_isAdded)
                            Positioned(
                              right: -8.w,
                              top: 0,
                              child: Container(
                                width: 6.w,
                                height: 6.w,
                                decoration: const BoxDecoration(
                                  color: AppTheme.primaryYellow,
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  '1',
                                  style: TextStyle(
                                    color: AppTheme.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.tr(widget.item.title),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textPrimary,
                        height: 1.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    widget.item.price,
                    style: TextStyle(
                      color: AppTheme.secondaryGreen,
                      fontSize: 7.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.tr(widget.item.unit),
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CartControl(
                    isAdded: _isAdded,
                    onToggle: () => setState(() => _isAdded = !_isAdded),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
