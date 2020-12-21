import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/home/controllers/home_controller.dart';
import 'package:test_project_one/app/modules/more/views/more_view.dart';
import 'package:test_project_one/app/modules/my_ads/views/my_ads_view.dart';
import 'package:test_project_one/app/modules/stats/views/stats_view.dart';
import 'package:test_project_one/app/modules/wallet/views/wallet_view.dart';
import 'package:test_project_one/app/widgets/colours.dart';

import 'package:test_project_one/app/widgets/footer.dart';

class HomeView extends GetView<HomeController> {
  RxInt activeIndex = 0.obs;

  void _onTap(int index) {
    activeIndex.value = index;
  }

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MyAdsView(),
    WalletView(),
    StatsView(),
    MoreView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Center(
              child: _widgetOptions.elementAt(activeIndex.value),
            )),
        bottomNavigationBar: FABBottomAppBar(
          onTabSelected: _onTap,
          color: Colors.white,
          selectedColor: colour_yellow,
          notchedShape: CircularNotchedRectangle(),
          items: [
            FABBottomAppBarItem(iconData: Icons.home, text: "Home"),
            FABBottomAppBarItem(
                iconData: Icons.campaign, text: "My Ads"),
            FABBottomAppBarItem(iconData: Icons.account_balance_wallet, text: "Wallet"),
            FABBottomAppBarItem(
                iconData: Icons.bar_chart,
                text: "Stat"),
            FABBottomAppBarItem(iconData: FaIcon(FontAwesomeIcons.thLarge).icon, text: "More"),
          ],
        ));
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
