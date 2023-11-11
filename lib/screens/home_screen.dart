import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlib/components/bottom_navigation_bar.dart';
import 'package:onlib/tabs/account_tab.dart';
import 'package:onlib/tabs/categories_tab.dart';
import 'package:onlib/tabs/product_list_tab.dart';
import 'package:onlib/tabs/shopping_card_tab.dart';
import 'package:onlib/tabs/wishlist_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      extendBody: true,
      body: [
        const ProductListTab(),
        const CategoriesTab(),
        const ShoppingCartTab(),
        const WishListTab(),
        const AccountTab(),
      ][pageIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: (int index) => setState(() => pageIndex = index),
        currentIndex: pageIndex,
      ),
    );
  }
}
