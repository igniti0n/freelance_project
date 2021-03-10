import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:test_project_one/app/modules/home/controllers/home_controller.dart';
import 'package:test_project_one/app/modules/more/views/more_view.dart';
import 'package:test_project_one/app/modules/my_ads/controllers/my_ads_controller.dart';
import 'package:test_project_one/app/modules/my_ads/views/my_ads_view.dart';
import 'package:test_project_one/app/modules/stats/views/stats_view.dart';
import 'package:test_project_one/app/modules/wallet/views/wallet_view.dart';
import 'package:test_project_one/app/widgets/ads_card.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/constants.dart';
import 'package:test_project_one/app/widgets/error_page.dart';

import 'package:test_project_one/app/widgets/footer.dart';
import 'package:test_project_one/app/widgets/header.dart';
import 'package:test_project_one/app/widgets/progress_dialog.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  RxInt activeIndex = 0.obs;
  final _tabBarState = new GlobalKey<FABBottomAppBarState>();

  void _onTap(int index) {
    activeIndex.value = index;
  }

  List<Widget> _widgetOptions;

  @override
  void initState() {
    _widgetOptions = <Widget>[
      HomeScreen(
        onChangeTabIndex: (index) {
          _tabBarState.currentState.updateIndex(index);
          final MyAdsController myAdsController = Get.find();
          if (myAdsController != null) {
            myAdsController.loadMyAds();
          }
        },
      ),
      MyAdsView(
        onChangeTabIndex: (index) {
          _tabBarState.currentState.updateIndex(index);
        },
      ),
      WalletView(),
      StatsView(),
      MoreView(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header,
      body: Obx(() {
        return Center(
          child: _widgetOptions.elementAt(activeIndex.value),
        );
      }),
      bottomNavigationBar: FABBottomAppBar(
        key: _tabBarState,
        onTabSelected: _onTap,
        color: Colors.white,
        selectedColor: colour_yellow,
        selectedIndex: activeIndex.value,
        notchedShape: CircularNotchedRectangle(),
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: "Home"),
          FABBottomAppBarItem(iconData: Icons.campaign, text: "My Gids"),
          FABBottomAppBarItem(
              iconData: Icons.account_balance_wallet, text: "Wallet"),
          FABBottomAppBarItem(iconData: Icons.bar_chart, text: "Stat"),
          FABBottomAppBarItem(
              iconData: FaIcon(FontAwesomeIcons.thLarge).icon, text: "More"),
        ],
      ),
    );
  }
}

class HomeScreen extends GetView<HomeController> {
  final Function(int index) onChangeTabIndex;

  HomeScreen({@required this.onChangeTabIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => _buildHomeView(),
        onLoading: Loader(),
        onError: (error) {
          return ErrorView(
            errorMsg: error,
            onTapReload: () {
              controller.loadAds();
            },
          );
        },
      ),
    );
  }

  _buildHomeView() {
    return RefreshIndicator(
      onRefresh: () async {
        controller.loadAds();
        await new Future.delayed(const Duration(seconds: 1));
      },
      child: controller.adsList.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 16),
                  child: Text(
                    "Available Gids",
                    style: TextStyle(
                        fontFamily: "Gilroy-Light",
                        fontSize: 22,
                        color: Colors.black),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return showAdCard(
                          adsDetailModel: controller.adsList[index],
                          report: false,
                          onTabChangeIndex: (index) {
                            onChangeTabIndex(index);
                            controller.loadAds();
                          });
                    },
                    itemCount: controller.adsList.length,
                  ),
                )
              ],
            )
          : Center(
              child: Column(
                children: [
                  Container(
                    height: 300,
                    child: Lottie.asset("assets/lottie/no_data_lottie.json"),
                  ),
                  Text(
                    Strings.NO_ADS_MSG,
                    style: TextStyle(
                        fontFamily: "Gilroy-Light",
                        fontSize: 22,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
    );
  }
}
