import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutterkart/controller/home_screen_provider.dart';
import 'package:flutterkart/controller/login_provider.dart';
import 'package:flutterkart/core/app_theme/app_color.dart';
import 'package:flutterkart/core/app_theme/app_styles.dart';
import 'package:flutterkart/core/utils/app_size.dart';
import 'package:flutterkart/core/utils/enum.dart';
import 'package:flutterkart/core/utils/internet_checker.dart';
import 'package:flutterkart/widgets/category_circle.dart';
import 'package:flutterkart/widgets/common_texfield.dart';
import 'package:flutterkart/widgets/common_text_button.dart';
import 'package:flutterkart/widgets/custom_product_card.dart';
import 'package:flutterkart/widgets/custom_shimmer_view.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "homeview";
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isColor = false;
  int _currentIndex = 0;

  late ScrollController _topSellingController;
  @override
  void initState() {
    _topSellingController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      HomeScreenProvider provider =
          Provider.of<HomeScreenProvider>(context, listen: false);
      provider.loadHomeProducts();
      await provider.loadProducts();
    });

    _topSellingController.addListener(() {
      if (_topSellingController.position.pixels >=
          _topSellingController.position.maxScrollExtent - 200) {
        final provider =
            Provider.of<HomeScreenProvider>(context, listen: false);

        if (!provider.isLoadingMore && provider.hasMoreData) {
          provider.loadProducts();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.whiteColor,
          title: Column(
            children: [
              Text(
                "Hi, Shammas",
                style: TextStyle(
                    color: AppColor.blackColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Let’s start shopping",
                style: TextStyle(
                    color: AppColor.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            actionButton(IconButton(
                onPressed: () {
                  setState(() {
                    isColor = !isColor;
                  });
                },
                icon: Icon(
                  Icons.favorite_outline,
                  color: isColor ? Colors.red : AppColor.blackColor,
                ))),
            actionButton(IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_outlined,
                  color: AppColor.blackColor,
                )))
          ],
        ),
        body: value.setDashBoardState == AppState.loading
            ? HomeBodyShimmer()
            : SafeArea(
                child: AnimationLimiter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: RefreshIndicator(
                      color: AppColor.blackColor,
                      onRefresh: () => value.loadHomeProducts(),
                      child: SingleChildScrollView(
                        child: Column(
                          spacing: 5,
                          children: [
                            CommonTexfield(
                              hintText: "Search",
                              controller: value.searchController,
                              prefixIcon: Icons.search,
                            ),
                            animatedCarousel(value),
                            animatedCarouselIndicator(value),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Categories",
                                  style: AppStyles.headerText,
                                ),
                                CommonTextButton(
                                  onPressed: () {},
                                  text: "See All",
                                  color: AppColor.blackColor,
                                ),
                              ],
                            ),
                            value.categoryModel.isNotEmpty
                                ? SizedBox(
                                    height: screenHeight(context, 6),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: value.categoryModel.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return AnimationConfiguration
                                            .staggeredList(
                                          position: index,
                                          duration: const Duration(
                                              milliseconds: 500),
                                          child: SlideAnimation(
                                            horizontalOffset: 50.0,
                                            child: FadeInAnimation(
                                              child: CategoryCircle(
                                                text: value
                                                    .categoryModel[index]
                                                    .categoryName,
                                                imgpath: value.imgPath[index],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : Center(
                                    child: CircularProgressIndicator(
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Top Selling",
                                  style: AppStyles.headerText,
                                ),
                                CommonTextButton(
                                  onPressed: () {},
                                  text: "See All",
                                  color: AppColor.blackColor,
                                ),
                              ],
                            ),
                            value.productModel.isNotEmpty
                                ? SizedBox(
                                    height: screenHeight(context, 4.2),
                                    child: ListView.builder(
                                      controller: _topSellingController,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: value.productModel.length +
                                          (value.isLoadingMore ? 1 : 0),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        if (index ==
                                            value.productModel.length) {
                                          return Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child:
                                                  CircularProgressIndicator(
                                                      color: AppColor
                                                          .blackColor),
                                            ),
                                          );
                                        }
                                        return AnimationConfiguration
                                            .staggeredList(
                                          position: index,
                                          duration: const Duration(
                                              milliseconds: 500),
                                          child: SlideAnimation(
                                            horizontalOffset: 50.0,
                                            child: FadeInAnimation(
                                              child: CustomProductCard(
                                                onTap: () {},
                                                imagePath:
                                                    "assets/images/mac_img.jfif",
                                                productName: value
                                                    .productModel[index].name,
                                                price: value
                                                    .productModel[index]
                                                    .price,
                                                rating: 4,
                                                reviewCount: value
                                                    .productModel[index]
                                                    .loyaltyEarningPoints,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : Center(
                                    child: CircularProgressIndicator(
                                        color: AppColor.blackColor),
                                  ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Best offers",
                                  style: AppStyles.headerText,
                                ),
                                CommonTextButton(
                                  onPressed: () {},
                                  text: "See All",
                                  color: AppColor.blackColor,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      );
    });
  }

  Widget actionButton(Widget child) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: AppColor.buttonLightColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: child,
        ),
      ),
    );
  }

  Widget animatedCarousel(HomeScreenProvider value) {
    return AnimationConfiguration.synchronized(
      duration: const Duration(milliseconds: 600),
      child: FadeInAnimation(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayInterval: const Duration(seconds: 2),
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            },
          ),
          items: List.generate(value.carousalData.length, (index) {
            return Builder(
              builder: (context) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/banner image.png',
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget animatedCarouselIndicator(HomeScreenProvider value) {
    return Center(
      child: AnimatedSmoothIndicator(
        activeIndex: _currentIndex,
        count: value.carousalData.length,
        effect: ExpandingDotsEffect(
          activeDotColor: AppColor.blackColor,
          dotHeight: 8,
          dotWidth: 8,
          spacing: 6,
        ),
        onDotClicked: (index) {},
      ),
    );
  }
}
