import 'package:flutter/material.dart';

import '../../config/app_constants.dart';
import '../../config/app_theme.dart';
import 'widgets/bottom_nav.dart';
import 'widgets/category_tabs.dart';
import 'widgets/header_section.dart';
import 'widgets/products_grid.dart';
import 'widgets/promo_banner.dart';
import 'widgets/search_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.pagePadding,
            vertical: 16,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppConstants.maxWideWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 18),

                  HeaderSection(),
                  SearchRow(),
                  SizedBox(height: 18),
                  PromoBanner(),
                  SizedBox(height: 18),
                  CategoryTabs(),
                  SizedBox(height: 16),
                  ProductsGrid(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
