import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/profile/controllers/profile_controller.dart';
import 'package:test_project_one/app/widgets/button_widget.dart';
import 'package:test_project_one/app/widgets/progress_dialog.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';
import 'package:image_picker/image_picker.dart';

//AssetImage('assets/images/pic1.png')
// ignore: must_be_immutable
class ProfileView extends GetView<ProfileController> {
  TextEditingController firstname = new TextEditingController();
  TextEditingController lastname = new TextEditingController();
  TextEditingController education = new TextEditingController();
  TextEditingController country = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController facebook = new TextEditingController();
  TextEditingController twitter = new TextEditingController();
  TextEditingController instagram = new TextEditingController();
  TextEditingController youtube = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  String gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: controller.obx(
            (data) =>
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "My Profile",
                    style: TextStyle(
                      fontFamily: "Gilroy-Light",
                      fontSize: 22,
                    ),
                  )),
              Center(
                child: Stack(
                  children: [
                    controller.file.isNull
                        ? CachedNetworkImage(
                            width: 100,
                            height: 100,
                            imageUrl: data.image ?? '',
                            imageBuilder: (context, imageProvider) =>
                                CircleAvatar(
                                    radius: 50,
                                    backgroundImage: imageProvider,
                                    backgroundColor: Colors.white),
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          )
                        : CircleAvatar(
                            radius: 50,
                            backgroundImage: FileImage(controller.file),
                            backgroundColor: Colors.white),
                    Positioned.fill(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        // color: Colors.white,
                        child: GestureDetector(
                            onTap: () {
                              uploadImage();
                            },
                            child: Image.asset(
                              "assets/images/mask.png",
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5, top: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textField(
                          signup: true,
                          controller: firstname =
                              TextEditingController(text: data.firstname),
                          name: "First Name",
                          placeholder: data == null ? "Dike" : data.firstname,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "Fill Field";
                            }
                          }),
                      textField(
                          signup: true,
                          controller: lastname =
                              TextEditingController(text: data.lastname),
                          name: "Last Name",
                          placeholder: data == null ? "John" : data.lastname,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "Fill Field";
                            }
                          }),
                      Padding(
                        padding: const EdgeInsets.only(left: 17.0, right: 17.0),
                        child: Text(
                          "Gender",
                          style: TextStyle(
                              fontFamily: "Gilroy",
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 17.0, right: 17.0),
                        child: DropdownSearch(
                          hint: 'Select Gender',
                          maxHeight: 100,
                          mode: Mode.MENU,
                          onChanged: (value) {
                            controller.setGender(value: value);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Set Gender";
                            }
                            return null;
                          },
                          items: ["Male", "Female"],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textField(
                          signup: true,
                          controller: phone =
                              TextEditingController(text: data.phone),
                          name: "Phone",
                          placeholder: data == null ? "phone" : data.phone,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "Fill Field";
                            }
                          }),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 17.0, right: 17.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Religion",
                                    style: TextStyle(
                                        fontFamily: "Gilroy",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  DropdownSearch(
                                    mode: Mode.MENU,
                                    onChanged: (value) {
                                      controller.setReligion(value: value);
                                    },
                                    selectedItem: data == null
                                        ? "Christianity"
                                        : data.religion,
                                    validator: (value) {
                                      if (value.toString().isEmpty) {
                                        return "Set Religion";
                                      }
                                      return null;
                                    },
                                    items: ["Christianity", "Islam", "Others"],
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          textField(
                              signup: true,
                              controller: education = TextEditingController(
                                  text: data.levelOfEducation),
                              name: "Highest Education Level",
                              placeholder: data == null
                                  ? "BSc. Computer Science"
                                  : data.levelOfEducation,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "Fill Field";
                                }
                              }),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 17, right: 17, bottom: 17),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Country",
                                  style: TextStyle(
                                      fontFamily: "Gilroy",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                DropdownSearch(
                                  mode: Mode.MENU,
                                  hint: 'Select Country',
                                  selectedItem: data == null
                                      ? "Nigeria"
                                      : (data.country.length > 0)
                                          ? data.country.first.name
                                          : "Nigeria",
                                  validator: (value) {
                                    if (value.toString().isEmpty) {
                                      return "Set Religion";
                                    }
                                    return null;
                                  },
                                  items: ["Nigeria", "Ghana"],
                                ),
                              ],
                            ),
                          ),
                          textField(
                              signup: true,
                              controller: address =
                                  TextEditingController(text: data.address),
                              name: "Address",
                              placeholder: data == null
                                  ? "12 Ezekiel Street"
                                  : data.address,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "Fill Field";
                                }
                              }),
                          Center(
                            child: Text(
                              "Social Media Accounts",
                              style: TextStyle(
                                  fontFamily: "Gilroy-Regular",
                                  fontSize: 18,
                                  color: Color(0xff282828)),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          textField(
                              signup: true,
                              controller: facebook =
                                  TextEditingController(text: data.facebook),
                              name: "Facebook",
                              placeholder: data.facebook == null
                                  ? "Facebook"
                                  : data.facebook,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "Fill Field";
                                }
                              }),
                          textField(
                              signup: true,
                              name: "Twitter",
                              controller: twitter =
                                  TextEditingController(text: data.twitter),
                              placeholder: data.twitter == null
                                  ? "Please Enter Here"
                                  : data.twitter,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "Fill Field";
                                }
                              }),
                          textField(
                              signup: true,
                              controller: instagram =
                                  TextEditingController(text: data.instagram),
                              name: "Instagram",
                              placeholder: data.instagram == null
                                  ? "Please Enter Here"
                                  : data.instagram,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "Fill Field";
                                }
                              }),
                          textField(
                              signup: true,
                              name: "Youtube",
                              controller: youtube =
                                  TextEditingController(text: data.youtube),
                              placeholder: data.youtube == null
                                  ? "Please Enter Here"
                                  : data.youtube,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "Fill Field";
                                }
                              }),
                          SizedBox(
                            height: 30,
                          ),
                          buttonWidget(
                              name: "Update",
                              onTap: () {
                                controller.updateProfile(
                                  firstname: firstname.text ?? data.firstname,
                                  lastname: lastname.text ?? data.lastname,
                                  phone: phone.text ?? data.phone,
                                  gender: controller.gender ?? data.gender,
                                  religion:
                                      controller.religion ?? data.religion,
                                  education:
                                      education.text ?? data.levelOfEducation,
                                  country:
                                      country.text ?? data.country.first.name,
                                  address: address.text ?? data.address,
                                  facebook: facebook.text ?? data.facebook,
                                  twitter: twitter.text ?? data.twitter,
                                  instagram: instagram.text ?? data.instagram,
                                  youtube: youtube.text ?? data.youtube,
                                );
                              }),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      )
                    ]),
              )
            ]),
            onLoading: Container(height: Get.height * 0.8, child: Loader()),
          ),
        ));
  }

  uploadImage() async {
    Get.defaultDialog(
        title: "Choose from",
        content: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () async {
                  final _imageFile1 =
                      await ImagePicker().getImage(source: ImageSource.camera);
                  controller.setPickedImageFile(value: File(_imageFile1.path));
                  // ProfileProvider().postImage(file);
                  // listMediaFile.add(file);
                  // print(listMediaFile.length);
                  Get.back();
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.camera,
                      color: Color(0xff9D6DFC),
                    ),
                    Text("Camera")
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final _imageFile1 =
                      await ImagePicker().getImage(source: ImageSource.gallery);
                  controller.setPickedImageFile(value: File(_imageFile1.path));
                  // ProfileProvider().postImage(file);
                  // listMediaFile.add(file);
                  // print(listMediaFile.length);
                  Get.back();
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.picture_in_picture_sharp,
                      color: Color(0xffF45B3D),
                    ),
                    Text(
                      "Gallery",
                    )
                  ],
                ),
              )
            ],
          ),
        ));

    // controller.count.value ++;
  }
}
