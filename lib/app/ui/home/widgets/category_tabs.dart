import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../config/app_theme.dart';
import '../../../localization/app_localizations.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  final List<String> _items = const [
    'tab_all',
    'tab_fruits',
    'tab_meats',
    'tab_groceries',
  ];
  static const int _activeIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(height: 2, color: AppTheme.border),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _items
                  .asMap()
                  .entries
                  .map(
                    (entry) => Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 6),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: entry.key == _activeIndex
                                  ? AppTheme.secondaryGreen
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.tr(entry.value),
                          style: TextStyle(
                            color: entry.key == _activeIndex
                                ? AppTheme.secondaryGreen
                                : AppTheme.secondaryGreen,
                            fontWeight: entry.key == _activeIndex
                                ? FontWeight.w600
                                : null,
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
