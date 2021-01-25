import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/modules/sign_up/controllers/signUP2.dart';
import 'package:test_project_one/app/modules/sign_up/views/sign_up_media_accounts_view.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/button-widget.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';

class SignUp2View extends GetView<SignUp2Controller> {
  final String firstName, lastname, gender, dOB, religion, levelOfEducation;
  SignUp2View(
      {this.firstName,
      this.lastname,
      this.gender,
      this.dOB,
      this.religion,
      this.levelOfEducation});
  String country;
  TextEditingController phone = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  SignUp2Controller _controller = Get.put(SignUp2Controller());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset("assets/images/step_2.png"),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 10),
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                          decoration: BoxDecoration(color: Color(0xffF679A3)),
                          child: Icon(Icons.arrow_back)),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 17.0, right: 17.0, top: 20),
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
                        onChanged: (value){
                           _controller.country.value = value;
                        },
                        
                        label: "Nigeria",
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "Set Religion";
                          }
                          return null;
                        },
                        items: ["Nigeria", "Ghana"],
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              textField(
                  signup: false,
                  name: "Address",
                  placeholder: "No 12 Ezikel Street",
                  controller: address,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Fill Field";
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              textField(
                  signup: false,
                  name: "Phone",
                  placeholder: "07012345678",
                  controller: phone,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Fill Field";
                    }
                  }),
              textField(
                  signup: true,
                  name: "Email",
                  controller: email,
                  placeholder: "Please enter here",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Fill Field";
                    }
                  }),
              textField(
                  signup: true,
                  name: "Password",
                  controller: password,
                  password: true,
                  placeholder: "Please enter here",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Fill Field";
                    }
                  }),
              display_button(
                  name: "Next",
                  function: () {
                    if (_formKey.currentState.validate()) {
                      Get.to(SignUpMediaAccountsView(
                        address: address.text,
                        country: _controller.country.value,
                        email: email.text,
                        password: password.text,
                        firstName: firstName,
                        lastname: lastname,
                        gender: gender,
                        phone: phone.text,
                        dOB: dOB,
                        religion: religion,
                        levelOfEducation: levelOfEducation,
                      ));
                    }
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
