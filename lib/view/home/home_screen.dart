import 'dart:async';

import 'package:e_commerce_app/utils/text.dart';
import 'package:e_commerce_app/view/home/widgets/build_banner.dart';
import 'package:e_commerce_app/view/home/widgets/build_header.dart';
import 'package:e_commerce_app/view/home/widgets/build_product_card.dart';
import 'package:e_commerce_app/view/home/widgets/build_search_bar.dart';
import 'package:e_commerce_app/view/home/widgets/build_title.dart';
import 'package:e_commerce_app/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/colors.dart';

// List<CartModels> items = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Automatically change pages every 3 seconds
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageController.hasClients) {
        _currentPage = (_currentPage + 1) % 4;
        pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController txtSearch = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildHeader(),
              const SizedBox(
                height: 15,
              ),
              buildSearchBar(txtSearch),
              const SizedBox(
                height: 15,
              ),
              buildBanner(pageController),
              const SizedBox(height: 10),
              SmoothPageIndicator(
                controller: pageController,
                count: 4,
                effect: ExpandingDotsEffect(
                  activeDotColor: Appcolor.primary,
                  dotColor: Appcolor.secondaryText,
                  dotHeight: 8,
                  dotWidth: 8,
                  expansionFactor: 2,
                ),
              ),
              buildTitle(title: AppText.fruitTitle),
              BuildProductCard(
                products: fruits,
              ),
              const SizedBox(
                height: 15,
              ),
              buildTitle(title: AppText.groceriesTitle),
              const SizedBox(
                height: 15,
              ),
              BuildProductCard(
                products: groceries,
              ),
            ],
          ),
        )));
  }
}
