// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.statusCode,
    this.data,
  });

  int statusCode;
  List<ProfileDetailModel> data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        statusCode: json["status_code"] == null ? null : json["status_code"],
        data: json["data"] == null
            ? null
            : List<ProfileDetailModel>.from(
                json["data"].map((x) => ProfileDetailModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode == null ? null : statusCode,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ProfileDetailModel {
  ProfileDetailModel({
    this.id,
    this.role,
    this.image,
    this.firstname,
    this.lastname,
    this.gender,
    this.dateOfBirth,
    this.religion,
    this.levelOfEducation,
    this.address,
    this.email,
    this.password,
    this.phone,
    this.facebook,
    this.twitter,
    this.instagram,
    this.youtube,
    this.countryId,
    this.tierId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.bank,
    this.country,
    this.tier,
  });

  String id;
  String role;
  String image;
  String firstname;
  String lastname;
  String gender;
  String dateOfBirth;
  String religion;
  String levelOfEducation;
  String address;
  String email;
  String password;
  String phone;
  String facebook;
  String twitter;
  String instagram;
  String youtube;
  String countryId;
  String tierId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  List<dynamic> bank;
  List<Country> country;
  List<Tier> tier;

  factory ProfileDetailModel.fromJson(Map<String, dynamic> json) =>
      ProfileDetailModel(
        id: json["_id"] == null ? null : json["_id"],
        role: json["role"] == null ? null : json["role"],
        image: json["image"] == null ? null : json["image"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        gender: json["gender"] == null ? null : json["gender"],
        dateOfBirth:
            json["date_of_birth"] == null ? null : json["date_of_birth"],
        religion: json["religion"] == null ? null : json["religion"],
        levelOfEducation: json["level_of_education"] == null
            ? null
            : json["level_of_education"],
        address: json["address"] == null ? null : json["address"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        phone: json["phone"] == null ? null : json["phone"],
        facebook: json["facebook"] == null ? null : json["facebook"],
        twitter: json["twitter"] == null ? null : json["twitter"],
        instagram: json["instagram"] == null ? null : json["instagram"],
        youtube: json["youtube"] == null ? null : json["youtube"],
        countryId: json["country_id"] == null ? null : json["country_id"],
        tierId: json["tier_id"] == null ? null : json["tier_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        bank: json["Bank"] == null
            ? null
            : List<dynamic>.from(json["Bank"].map((x) => x)),
        country: json["Country"] == null
            ? null
            : List<Country>.from(
                json["Country"].map((x) => Country.fromJson(x))),
        tier: json["Tier"] == null
            ? null
            : List<Tier>.from(json["Tier"].map((x) => Tier.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "role": role == null ? null : role,
        "image": image == null ? null : image,
        "firstname": firstname == null ? null : firstname,
        "lastname": lastname == null ? null : lastname,
        "gender": gender == null ? null : gender,
        "date_of_birth": dateOfBirth == null ? null : dateOfBirth,
        "religion": religion == null ? null : religion,
        "level_of_education":
            levelOfEducation == null ? null : levelOfEducation,
        "address": address == null ? null : address,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "phone": phone == null ? null : phone,
        "facebook": facebook == null ? null : facebook,
        "twitter": twitter == null ? null : twitter,
        "instagram": instagram == null ? null : instagram,
        "youtube": youtube == null ? null : youtube,
        "country_id": countryId == null ? null : countryId,
        "tier_id": tierId == null ? null : tierId,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "Bank": bank == null ? null : List<dynamic>.from(bank.map((x) => x)),
        "Country": country == null
            ? null
            : List<dynamic>.from(country.map((x) => x.toJson())),
        "Tier": tier == null
            ? null
            : List<dynamic>.from(tier.map((x) => x.toJson())),
      };
}

class Country {
  Country({
    this.id,
    this.code2,
    this.code3,
    this.name,
    this.capital,
    this.region,
    this.subregion,
    this.states,
  });

  String id;
  String code2;
  String code3;
  String name;
  String capital;
  String region;
  String subregion;
  List<State> states;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["_id"] == null ? null : json["_id"],
        code2: json["code2"] == null ? null : json["code2"],
        code3: json["code3"] == null ? null : json["code3"],
        name: json["name"] == null ? null : json["name"],
        capital: json["capital"] == null ? null : json["capital"],
        region: json["region"] == null ? null : json["region"],
        subregion: json["subregion"] == null ? null : json["subregion"],
        states: json["states"] == null
            ? null
            : List<State>.from(json["states"].map((x) => State.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "code2": code2 == null ? null : code2,
        "code3": code3 == null ? null : code3,
        "name": name == null ? null : name,
        "capital": capital == null ? null : capital,
        "region": region == null ? null : region,
        "subregion": subregion == null ? null : subregion,
        "states": states == null
            ? null
            : List<dynamic>.from(states.map((x) => x.toJson())),
      };
}

class State {
  State({
    this.code,
    this.name,
    this.subdivision,
  });

  String code;
  String name;
  dynamic subdivision;

  factory State.fromJson(Map<String, dynamic> json) => State(
        code: json["code"] == null ? null : json["code"],
        name: json["name"] == null ? null : json["name"],
        subdivision: json["subdivision"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "name": name == null ? null : name,
        "subdivision": subdivision,
      };
}

class Tier {
  Tier({
    this.id,
    this.tier,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String tier;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Tier.fromJson(Map<String, dynamic> json) => Tier(
        id: json["_id"] == null ? null : json["_id"],
        tier: json["tier"] == null ? null : json["tier"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "tier": tier == null ? null : tier,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
