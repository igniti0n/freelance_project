import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../main.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/alert_dialog.dart';
import '../../../widgets/colours.dart';
import '../../../widgets/error_page.dart';
import '../../../widgets/footer.dart';
import '../../../widgets/header.dart';
import '../../../widgets/notification_card.dart';
import '../../../widgets/progress_dialog.dart';
import '../../forgotPassword2/user_app_bar_data/all_ads_view.dart';
import '../../forgotPassword2/user_app_bar_data/app_bar_data_controller.dart';
import '../../more/views/more_view.dart';
import '../../my_ads/controllers/my_ads_controller.dart';
import '../../my_ads/views/my_ads_view.dart';
import '../../stats/views/stats_view.dart';
import '../../wallet/views/wallet_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

final tabBarState = new GlobalKey<FABBottomAppBarState>();

class _HomeViewState extends State<HomeView> {
  RxInt activeIndex = 0.obs;

  void _onTap(int index) {
    activeIndex.value = index;
  }

  List<Widget> _widgetOptions;

  AppBarDataController _appBarDataController;

  @override
  void initState() {
    Get.lazyPut<AppBarDataController>(
      () => AppBarDataController(),
    );

    _widgetOptions = <Widget>[
      HomeScreen(
        onChangeTabIndex: (index) {
          tabBarState.currentState.updateIndex(index);
          final MyAdsController myAdsController = Get.find();
          if (myAdsController != null) {
            myAdsController.loadMyAds();
          }
        },
      ),
      MyAdsView(
        onChangeTabIndex: (index) {
          tabBarState.currentState.updateIndex(index);
        },
      ),
      WalletView(),
      StatsView(),
      MoreView(),
      AllAdsView(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: activeIndex.value == (_widgetOptions.length - 1) ? header : Container(),
      body: Obx(() {
        return Center(
          child: _widgetOptions.elementAt(activeIndex.value),
        );
      }),
      bottomNavigationBar: FABBottomAppBar(
        key: tabBarState,
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
      appBar: header,
      backgroundColor: Colors.white,
      body: controller.obx(
        (state) => _buildHomeView(context),
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

  _buildHomeView(BuildContext context) {
    final String _welcomeText = "Here are all available Gids";

    return RefreshIndicator(
      displacement: 40,
      onRefresh: () async {
        Get.find<AppBarDataController>().loadAppBarData();
        controller.loadAds();
        await new Future.delayed(const Duration(seconds: 1));
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: Obx(() {
              return CachedNetworkImage(
                imageUrl: imageUrl.value,
                imageBuilder: (context, imageProvider) => CircleAvatar(
                    radius: 40,
                    backgroundImage: imageProvider,
                    backgroundColor: Colors.white),
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  size: 50,
                ),
              );
            }),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text: 'Welcome ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                        text: loginModel.user.firstname + ",",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      )
                    ],
                  ),
                ),
                Text(
                  DateFormat.yMMMMd('en_US').format(DateTime.now()),
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            actions: [
              GestureDetector(
                  onTap: () => Get.toNamed(Routes.CHAT),
                  child: SvgPicture.asset("assets/svg/chat.svg")),
              SizedBox(
                width: 30,
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                showNotificationCard(
                    title: "Gids Academy",
                    description: desc1,
                    sideColor: Colors.red,
                    onTap: () {},
                    descriptionSpans: [
                      TextSpan(
                        text: desc12,
                      ),
                      TextSpan(
                          text: 'gidsacad.com/starter',
                          style: TextStyle(
                              fontFamily: "Gilroy-Regular",
                              decoration: TextDecoration.underline,
                              fontSize: 12,
                              color: colour_yellow),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              final can =
                                  await canLaunch('gidsacad.com/starter');
                              if (can)
                                launch('gidsacad.com/starter');
                              else
                                show_dialog(
                                  context: context,
                                  heading: "Can not launh url.",
                                  right_text: "Okay",
                                  right_text_fn: () {
                                    Get.back();
                                  },
                                  widget:
                                      Text("Site is currently unavailable."),
                                );
                            })
                    ]),
                Get.find<AppBarDataController>().obx(
                  (state) => showNotificationCard(
                    title: "Gids In Progress",
                    description: desc2,
                    sideColor: colour_yellow,
                    onTap: () => tabBarState.currentState.updateIndex(1),
                    descriptionSpans: [
                      TextSpan(
                        text: "${state.runningAds}",
                        style: TextStyle(
                            fontFamily: "Gilroy-Regular",
                            fontSize: 12,
                            color: Colors.orange),
                      ),
                      TextSpan(text: desc22),
                    ],
                  ),
                ),
                showNotificationCard(
                  title: "Gids you can share",
                  description: desc3,
                  sideColor: colour_yellow,
                  onTap: () => tabBarState.currentState.updateIndex(5),
                ),
                showNotificationCard(
                    title: "AdsMata Updates",
                    description: desc4,
                    sideColor: colour_yellow,
                    descriptionSpans: [
                      TextSpan(
                          text: ' bit.ly/adsmatameetlagos',
                          style: TextStyle(
                              fontFamily: "Gilroy-Regular",
                              decoration: TextDecoration.underline,
                              fontSize: 12,
                              color: colour_yellow),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              final can =
                                  await canLaunch(' bit.ly/adsmatameetlagos');
                              if (can)
                                launch(' bit.ly/adsmatameetlagos');
                              else
                                show_dialog(
                                  context: context,
                                  heading: "Can not launh url.",
                                  right_text: "Okay",
                                  right_text_fn: () {
                                    Get.back();
                                  },
                                  widget:
                                      Text("Site is currently unavailable."),
                                );
                            })
                    ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String desc1 =
    "Hello there, as a new partner, you are required to complete a starter course for smooth sailing in the Gids ship. I promise it wont take long. ";

const String desc12 = "\nClick here to get started >";

const String desc2 = "Hey John, you've got ";
const String desc22 =
    " gids currently running, you can check out their progress here.";

const String desc3 =
    "Check out this new gids waiting to be shared by you, for some cool cash of course.";
const String desc4 =
    "An exciting meet and greet is coming up this weekend for our partners residing in Lagos, Nigeria.\n\n Click the link to be part of it.";
