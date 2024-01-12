import 'dart:convert';

class UserData {
  late int? id;
  late int isMainUser;
  late String firstName;
  late String lastName;
  late String organization;
  late String title;
  late String email;
  late String landPhone;
  late String mobilePhone;
  late String fax;
  late String street;
  late String city;
  late String region;
  late String postcode;
  late String country;
  late String url;

  UserData({
    required this.isMainUser,
    required this.firstName,
    required this.lastName,
    required this.organization,
    required this.title,
    required this.email,
    required this.landPhone,
    required this.mobilePhone,
    required this.fax,
    required this.street,
    required this.city,
    required this.region,
    required this.postcode,
    required this.country,
    required this.url,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isMainUser'] = isMainUser;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['organization'] = organization;
    data['title'] = title;
    data['email'] = email;
    data['landPhone'] = landPhone;
    data['mobilePhone'] = mobilePhone;
    data['fax'] = fax;
    data['street'] = street;
    data['city'] = city;
    data['region'] = region;
    data['postcode'] = postcode;
    data['country'] = country;
    data['url'] = url;
    return data;
  }

  UserData.fromJson(Map<String, dynamic> json) {
    isMainUser = json['isMainUser'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    organization = json['organization'];
    title = json['title'];
    email = json['email'];
    landPhone = json['landPhone'];
    mobilePhone = json['mobilePhone'];
    fax = json['fax'];
    street = json['street'];
    city = json['city'];
    region = json['region'];
    postcode = json['postcode'];
    email = json['email'];
    country = json['country'];
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
