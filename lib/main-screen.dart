// ignore_for_file: file_names, prefer_const_constructors, no_leading_underscores_for_local_identifiers, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopping/User-panel/auth/screens/notification-screen.dart'
    show NotificationScreen;
import 'User-panel/auth/controllers/notification-controller.dart';
import 'User-panel/auth/screens/all-catagories-screen.dart';
import 'User-panel/auth/screens/all-flash-sale-product.dart';
import 'User-panel/auth/screens/all-products-screen.dart';
import 'User-panel/auth/screens/cart-screen.dart';
import 'User-panel/auth/services/get-server-key.dart';
import 'User-panel/auth/services/notification-services.dart';
import 'User-panel/utils/app-constants.dart';
import 'User-panel/widgets/all-product-widget.dart';
import 'User-panel/widgets/banner-widget.dart';
import 'User-panel/widgets/categories-widget.dart';
import 'User-panel/widgets/costom-drawer.dart';
import 'User-panel/widgets/flash-sale-widget.dart';
import 'User-panel/widgets/heading-widget.dart';
import 'package:badges/badges.dart' as badges;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  NotificationService notificationService = NotificationService();
  final GetServerKey _getServerKey = GetServerKey();

  final NotificationController notificationController = Get.put(
    NotificationController(),
  );

  @override
  void initState() {
    super.initState();
    notificationService.requestNotificationPermission();
    notificationService.getDeviceToken();
    notificationService.firebaseInit(context);
    notificationService.setupInteractMessage(context);
    getServiceToken();
  }

  Future<void> getServiceToken() async {
    String serverToken = await _getServerKey.getServerKeyToken();
    print("Server Token => $serverToken");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppConstant.appScendoryColor,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          AppConstant.appMainName,
          style: TextStyle(color: AppConstant.appTextColor),
        ),
        centerTitle: true,
        actions: [
          Obx(() {
            return badges.Badge(
              badgeContent: Text(
                "${notificationController.notificationCount.value}",
                style: TextStyle(color: Colors.white),
              ),
              position: badges.BadgePosition.topEnd(top: 0, end: 3),
              showBadge: notificationController.notificationCount.value > 0,
              child: IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () => Get.to(() => NotificationScreen()),
              ),
            );
          }),
          GestureDetector(
            onTap: () => Get.to(() => CartScreen()),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(height: Get.height / 90.0),

              //banners
              BannerWidget(),

              //heading
              HeadingWidget(
                headingTitle: "Categories",
                headingSubTitle: "According to your budget",
                onTap: () => Get.to(() => AllCategoriesScreen()),
                buttonText: "See More >",
              ),

              CategoriesWidget(),

              //heading
              HeadingWidget(
                headingTitle: "Flash Sale",
                headingSubTitle: "According to your budget",
                onTap: () => Get.to(() => AllFlashSaleProductScreen()),
                buttonText: "See More >",
              ),

              FlashSaleWidget(),

              //heading
              HeadingWidget(
                headingTitle: "All Products",
                headingSubTitle: "According to your budget",
                onTap: () => Get.to(() => AllProductsScreen()),
                buttonText: "See More >",
              ),

              AllProductsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
