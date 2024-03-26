import 'package:flutter/material.dart';
import 'package:task/data/modal/product_modal/productModal.dart';
import 'package:task/presentation/ui/address/ui/address_screen.dart';
import 'package:task/presentation/ui/home/ui/category_deals.dart';
import 'package:task/presentation/ui/search/ui/search_page.dart';
import 'presentation/ui/home/ui/home_page.dart';
import 'presentation/ui/product_detail/product_detail_page.dart';
import 'presentation/widget/bottom_bar.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomePage(),
      );

    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );


    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(
          category: category,
        ),
      );

    case SearchPage.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchPage(
          searchQuery: searchQuery,
        ),
      );

    case ProductDetailPage.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailPage(
          product: product,
        ),
      );

    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddressScreen(
          totalAmount: totalAmount,
        ),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}