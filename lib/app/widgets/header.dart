// Header  goes here

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/data/models/login.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:test_project_one/app/modules/forgotPassword2/user_app_bar_data/app_bar_data_controller.dart';
import 'package:test_project_one/app/modules/home/controllers/home_controller.dart';
import 'package:test_project_one/app/modules/home/views/home_view.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/main.dart';
import 'package:intl/intl.dart';

HomeController home = Get.put(HomeController());
//String firstname = loginModel.user.firstname;
var imageUrl = (loginModel.user.image ?? "").obs;
final AppBarDataController _appBarDataController =
    Get.find<AppBarDataController>();
final userHeader = AppBar(
  backgroundColor: Colors.white,
  title: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Obx(() {
          return CachedNetworkImage(
            imageUrl: imageUrl.value,
            imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundImage: imageProvider, backgroundColor: Colors.white),
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(
              Icons.error,
              size: 50,
            ),
          );
        }),
        Text(loginModel.user.firstname),
      ],
    ),
  ),
  actions: [
    GestureDetector(
        onTap: () => Get.toNamed(Routes.CHAT),
        child: SvgPicture.asset("assets/svg/chat.svg")),
    SizedBox(
      width: 30,
    )
  ],
);

final header = AppBar(
  backgroundColor: Colors.white,
  title: _appBarDataController.obx(
    (state) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: kToolbarHeight / 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => tabBarState.currentState.updateIndex(2),
                  child: Image.asset(
                    "assets/images/wallet_appbar.jpg",
                  ),
                ),
                Spacer(
                  flex: 4,
                ),
                GestureDetector(
                  child: SvgPicture.asset("assets/svg/app_bar_circle.svg"),
                  onTap: () => tabBarState.currentState.updateIndex(1),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  child: SvgPicture.asset("assets/svg/app_bar_plus.svg"),
                  onTap: () => tabBarState.currentState.updateIndex(5),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  child: SvgPicture.asset("assets/svg/app_bar_done.svg"),
                  onTap: () {},
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AutoSizeText(
                'G ${state.balance}',
                style: TextStyle(
                    fontFamily: "Gilroy",
                    color: Colors.orange,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(
                flex: 1,
              ),
              AutoSizeText(
                '${state.runningAds}',
                style: TextStyle(
                    fontFamily: "Gilroy",
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 40,
              ),
              AutoSizeText(
                '${state.availableAds}',
                style: TextStyle(
                    fontFamily: "Gilroy",
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 35,
              ),
              AutoSizeText(
                '${state.completedAds}',
                style: TextStyle(
                    fontFamily: "Gilroy",
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);
  // actions: [
  //   GestureDetector(
  //       onTap: () => Get.toNamed(Routes.CHAT),
  //       child: SvgPicture.asset("assets/svg/chat.svg")),
  //   SizedBox(
  //     width: 10,
  //   )
  // ],

