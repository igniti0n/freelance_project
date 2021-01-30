import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/sign_up/controllers/signUPMedia.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/button-widget.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';

class SignUpMediaAccountsView extends GetView<SignUpMediaController> {
  final String country,
      address,
      phone,
      email,
      password,
      firstName,
      lastname,
      gender,
      dOB,
      religion,
      levelOfEducation;

  SignUpMediaAccountsView(
      {this.country,
      this.address,
      this.phone,
      this.email,
      this.password,
      this.firstName,
      this.lastname,
      this.gender,
      this.dOB,
      this.religion,
      this.levelOfEducation});

  final _formKey = GlobalKey<FormState>();
  TextEditingController facebook = new TextEditingController();
  TextEditingController twitter = new TextEditingController();
  TextEditingController instagram = new TextEditingController();
  TextEditingController youtube = new TextEditingController();
  SignUpMediaController mediaController = Get.put(SignUpMediaController());
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/account.png"),
              SizedBox(
                height: 40,
              ),
              textField(
                  signup: false,
                  name: "Facebook",
                  controller: facebook,
                  placeholder: "",
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Fill Field";
                    }
                  }),
              textField(
                  signup: false,
                  name: "Twitter",
                  controller: twitter,
                  placeholder: "",
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Fill Field";
                    }
                  }),
              textField(
                  signup: false,
                  name: "Instagram",
                  controller: instagram,
                  placeholder: "",
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Fill Field";
                    }
                  }),
              textField(
                  signup: false,
                  name: "Youtube",
                  placeholder: "",
                  controller: youtube,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                   
                   
                  }),
              display_button(
                  name: "Next",
                  function: () {
                   
                      mediaController.register(
                        firtname: firstName,
                        lastname: lastname,
                        gender: gender,
                        phone: phone,
                        date_of_birth: dOB,
                        religion: religion,
                        level_of_education: levelOfEducation,
                        country: country,
                        address: address,
                        email: email,
                        password: password,
                        facebook: facebook.text,
                        twitter: twitter.text,
                        instagram: instagram.text,
                        youtube: youtube.text
                      );
                    
                  }),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
