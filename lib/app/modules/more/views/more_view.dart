import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project_one/app/modules/more/controllers/more_controller.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/header.dart';
import 'package:test_project_one/app/widgets/textfield_dialog.dart';
import 'package:test_project_one/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreView extends GetView<MoreController> {
  final controller = Get.put(MoreController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          "More",
          style: TextStyle(fontFamily: "Gilroy"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 28, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loginModel.user.accountName ??
                            (loginModel.user.firstname ??
                                "" + loginModel.user.lastname ??
                                ""),
                        style: TextStyle(fontFamily: "Gilroy", fontSize: 20),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        loginModel.user.email ?? '',
                        style: TextStyle(
                            fontFamily: "Gilroy-Medium", fontSize: 15),
                      ),
                    ],
                  ),
                  CachedNetworkImage(
                    imageUrl: imageUrl.value,
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                        maxRadius: 40,
                        minRadius: 20,
                        backgroundImage: imageProvider,
                        backgroundColor: Colors.white),
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                ],
              ),
              Card(
                margin: EdgeInsets.only(top: 28),
                color: Colors.white,
                elevation: 4.0,
                borderOnForeground: false,
                shadowColor: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Details',
                        style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 18,
                            color: Color(0xFF515151)),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      createTitle(
                        icon: SvgPicture.asset("assets/svg/more-ios-card.svg"),
                        title: "Setup Withdrawal Bank",
                        onPressed: () {
                          Get.toNamed(Routes.WITHDRAWAL);
                        },
                      ),
                      createTitle(
                        icon: SvgPicture.asset("assets/svg/more-lock.svg"),
                        title: "Change Password",
                        onPressed: () {
                          Get.toNamed(Routes.CHANGE_PASSWORD);
                        },
                      ),
                      createTitle(
                        icon: SvgPicture.asset("assets/svg/more-user.svg"),
                        title: "My Profile",
                        onPressed: () {
                          Get.toNamed(Routes.PROFILE);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(top: 28),
                color: Colors.white,
                elevation: 4.0,
                borderOnForeground: false,
                shadowColor: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Learn',
                        style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 18,
                            color: Color(0xFF515151)),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      createTitle(
                        icon: SvgPicture.asset("assets/svg/more-people.svg"),
                        title: "Resources",
                        onPressed: () {
                          launch("https://adsmata.com/academy");
                        },
                      ),
                      createTitle(
                        icon:
                            SvgPicture.asset("assets/svg/more-description.svg"),
                        title: "Privacy Policy",
                        onPressed: () {
                          launch("https://adsmata.com/academy");
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      showPopupDialogWithTextField(
                        context: context,
                        heading: 'Delete Account',
                        subTitle: 'Enter Current Password',
                        hintText: 'Enter Password',
                        leftButtonTitle: 'Cancel',
                        isPasswordEntry: true,
                        onPressedLeftButton: () {
                          Get.back();
                        },
                        rightButtonTitle: 'Submit',
                        onPressedRightButton: (password) {
                          controller.deleteAccount(password: password);
                        },
                      );
                    },
                    child: Text(
                      "Delete Account",
                      style: TextStyle(
                          fontFamily: "Gilroy-Medium",
                          fontSize: 18,
                          color: Color(0xffFF0000)),
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.clear();
                      Get.offAllNamed(Routes.SIGN_IN);
                    },
                    child: Text(
                      "Logout",
                      style:
                          TextStyle(fontFamily: "Gilroy-Medium", fontSize: 18),
                    )),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile createTitle({Widget icon, String title, Function onPressed}) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: icon,
      title: Transform.translate(
        offset: Offset(-16, 0),
        child: Text(
          title,
          style: TextStyle(
              fontFamily: "Gilroy-Medium",
              fontSize: 15,
              color: Color(0xFF707070)),
        ),
      ),
      trailing: SvgPicture.asset("assets/svg/more-ios-arrow-back.svg"),
      onTap: onPressed,
    );
  }

  _buildWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () => Get.toNamed(Routes.WITHDRAWAL),
            child: Text(
              "Setup Withdrawal Bank",
              style: TextStyle(fontFamily: "Gilroy", fontSize: 15),
            )),
        SizedBox(
          height: 15,
        ),
        GestureDetector(
            onTap: () => Get.toNamed(Routes.CHANGE_PASSWORD),
            child: Text(
              "Change Password",
              style: TextStyle(fontFamily: "Gilroy", fontSize: 15),
            )),
        SizedBox(
          height: 15,
        ),
        GestureDetector(
            onTap: () => Get.toNamed(Routes.PROFILE),
            child: Text(
              "My Profile",
              style: TextStyle(fontFamily: "Gilroy", fontSize: 15),
            )),
        SizedBox(
          height: 15,
        ),
        GestureDetector(
            onTap: () => Get.toNamed(Routes.WITHDRAWAL),
            child: Text(
              "Resources",
              style: TextStyle(fontFamily: "Gilroy", fontSize: 15),
            )),
        SizedBox(
          height: 15,
        ),
        GestureDetector(
            onTap: () => Get.toNamed(Routes.POLICY),
            child: Text(
              "Privacy Policy",
              style: TextStyle(fontFamily: "Gilroy", fontSize: 15),
            )),
        SizedBox(
          height: 15,
        ),
        GestureDetector(
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.clear();

              Get.offAllNamed(Routes.SIGN_IN);
            },
            child: Text(
              "Logout",
              style: TextStyle(fontFamily: "Gilroy", fontSize: 15),
            )),
        SizedBox(
          height: 15,
        ),
        Spacer(),
        Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                showPopupDialogWithTextField(
                  context: context,
                  heading: 'Delete Account',
                  subTitle: 'Enter Current Password',
                  hintText: 'Enter Password',
                  leftButtonTitle: 'Cancel',
                  isPasswordEntry: true,
                  onPressedLeftButton: () {
                    Get.back();
                  },
                  rightButtonTitle: 'Submit',
                  onPressedRightButton: (password) {
                    controller.deleteAccount(password: password);
                  },
                );
              },
              child: Text(
                "Delete Account",
                style: TextStyle(
                    fontFamily: "Gilroy",
                    fontSize: 15,
                    color: Color(0xffFF0000)),
              ),
            )),
        Text("")
      ],
    );
  }
}
