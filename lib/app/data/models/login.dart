import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        this.statusCode,
        this.message,
        this.token,
        this.user,
        this.request,
    });

    int statusCode;
    String message;
    String token;
    User user;
    Request request;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        statusCode: json["status_code"],
        message: json["message"],
        token: json["token"],
        user: User.fromJson(json["user"]),
        request: Request.fromJson(json["request"]),
    );

    Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "token": token,
        "user": user.toJson(),
        "request": request.toJson(),
    };
}

class Request {
    Request({
        this.email,
        this.password,
    });

    String email;
    String password;

    factory Request.fromJson(Map<String, dynamic> json) => Request(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}

class User {
    User({
        this.role,
        this.id,
        this.firstname,
        this.lastname,
        this.gender,
        this.dateOfBirth,
        this.religion,
        this.levelOfEducation,
        this.country,
        this.address,
        this.email,
        this.password,
        this.phone,
        this.accountName,
        this.accountNumber,
        this.facebook,
        this.twitter,
        this.instagram,
        this.youtube,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String role;
    String id;
    String firstname;
    String lastname;
    String gender;
    String dateOfBirth;
    String religion;
    String levelOfEducation;
    String country;
    String address;
    String email;
    String password;
    String phone;
    String accountName;
    String accountNumber;
    String facebook;
    String twitter;
    String instagram;
    String youtube;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory User.fromJson(Map<String, dynamic> json) => User(
        role: json["role"],
        id: json["_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        gender: json["gender"],
        dateOfBirth: json["date_of_birth"],
        religion: json["religion"],
        levelOfEducation: json["level_of_education"],
        country: json["country"],
        address: json["address"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        accountName: json["account_name"],
        accountNumber: json["account_number"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        instagram: json["instagram"],
        youtube: json["youtube"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "role": role,
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "gender": gender,
        "date_of_birth": dateOfBirth,
        "religion": religion,
        "level_of_education": levelOfEducation,
        "country": country,
        "address": address,
        "email": email,
        "password": password,
        "phone": phone,
        "account_name": accountName,
        "account_number": accountNumber,
        "facebook": facebook,
        "twitter": twitter,
        "instagram": instagram,
        "youtube": youtube,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
