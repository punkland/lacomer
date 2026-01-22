import 'package:flutter/material.dart';
import '../../../config/app_assets.dart';
import '../../../helpers/widgets/my_responsive.dart';
import 'product_card.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  final List<ProductItem> _items = const [
    ProductItem(
      'product_lime',
      '\$25.90',
      'unit_kg',
      image: AppAssets.productLime,
      isFavorite: true,
    ),
    ProductItem(
      'product_banana',
      '\$25.90',
      'unit_kg',
      image: AppAssets.productBanana,
    ),
    ProductItem(
      'product_pomegranate',
      '\$25.90',
      'unit_kg',
      image: AppAssets.productPomegranate,
    ),
    ProductItem(
      'product_orange',
      '\$25.90',
      'unit_kg',
      image: AppAssets.productOrange,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MyResponsive(
      builder: (context, constraints, mediaType) {
        int columns = 2;
        if (mediaType.isTablet) {
          columns = 3;
        } else if (mediaType.isLaptop) {
          columns = 4;
        } else if (mediaType.isMiniDesktop || mediaType.isDesktop) {
          columns = 5;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 28,
            mainAxisSpacing: 16,
            childAspectRatio: mediaType.isMobile
                ? 0.86
                : mediaType.isTablet
                    ? 0.96
                    : 1.02,
          ),
          itemCount: _items.length,
          itemBuilder: (context, index) => ProductCard(item: _items[index]),
        );
      },
    );
  }
}

class ProductItem {
  const ProductItem(
    this.title,
    this.price,
    this.unit, {
    required this.image,
    this.isFavorite = false,
  });

  final String title;
  final String price;
  final String unit;
  final String image;
  final bool isFavorite;
}
