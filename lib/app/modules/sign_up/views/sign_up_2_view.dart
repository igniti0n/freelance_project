import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:test_project_one/app/data/models/country.dart';
import 'package:test_project_one/app/modules/sign_up/controllers/signUP2.dart';
import 'package:test_project_one/app/modules/sign_up/views/sign_up_media_accounts_view.dart';
import 'package:test_project_one/app/widgets/button_widget.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/constants.dart';
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
  int count = 0;
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
                      controller.obx(
                        (data) => Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey)),
                          child: Center(
                            child: SingleChildScrollView(
                              child: SearchableDropdown.single(
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return "Can't be empty";
                                  }
                                },
                                displayClearIcon: false,
                                isExpanded: true,
                                hint: "Select Country",
                                items: data.map((Country value) {
                                  //Done now hot restart
                                  _controller.countryID.value = value.id;
                                  return new DropdownMenuItem<String>(
                                    value: value.name,
                                    child: new Text(
                                      value.name,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                  );
                                }).toList(),
                                value: _controller.country.value,
                                onClear: () {},
                                onChanged: (value) {
                                  _controller.country.value = value;
                                  _controller.countryID.value = value;
                                  for (var i in _controller.countries) {
                                    if (i.name == _controller.country.value) {
                                      _controller.countryID.value = i.id;
                                      print(_controller.countryID.value);
                                    }
                                  }
                                },
                              ),
                            ),
                          ),
                        ),

                        ///These two are not mandatory without these two you will still get the loading and the error
                        ///Are you clear now?
                        ///yeah Friend
                        ///
                        onLoading: Text(
                            'Loading'), //You can use any custom loaders here show when the status = RxStatus.loading()
                      )
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              textField(
                  signup: true,
                  name: "Address",
                  placeholder: "Full address here",
                  controller: address,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Fill Field";
                    }
                  }),
              textField(
                  signup: true,
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
                  placeholder: "Email here",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Fill Field";
                    }
                    if (!value.toString().isEmail) {
                      return "Add a valid Email";
                    }
                  }),
              textField(
                  signup: true,
                  name: "Password",
                  controller: password,
                  password: true,
                  placeholder: "Password here",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Fill Field";
                    }
                  }),
              buttonWidget(
                  name: "Next",
                  onTap: () {
                    if (_controller.country.value.isNullOrBlank) {
                      Get.snackbar(
                        Strings.ERROR,
                        Strings.NO_COUNTRY_SEL,
                        duration: Duration(milliseconds: 5000),
                        backgroundColor: colour_time,
                        colorText: Colors.white,
                      );
                      return;
                    }

                    if (_formKey.currentState.validate()) {
                      Get.to(SignUpMediaAccountsView(
                        address: address.text,
                        country: _controller.country.value,
                        countryId: _controller.countryID.value,
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
