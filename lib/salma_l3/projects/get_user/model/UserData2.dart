import 'dart:convert';

UserData2 userData2FromJson(String str) => UserData2.fromJson(json.decode(str));

String userData2ToJson(UserData2 data) => json.encode(data.toJson());

class UserData2 {
  UserData2({
    int? id,
    String? name,
    String? username,
    String? email,
    Address? address,
    String? phone,
    String? website,
    Company? company,
  }) {
    _id = id;
    _name = name;
    _username = username;
    _email = email;
    _address = address;
    _phone = phone;
    _website = website;
    _company = company;
  }

  UserData2.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _username = json['username'];
    _email = json['email'];
    _address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    _phone = json['phone'];
    _website = json['website'];
    _company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
  }

  int? _id;
  String? _name;
  String? _username;
  String? _email;
  Address? _address;
  String? _phone;
  String? _website;
  Company? _company;

  UserData2 copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    Address? address,
    String? phone,
    String? website,
    Company? company,
  }) =>
      UserData2(
        id: id ?? _id,
        name: name ?? _name,
        username: username ?? _username,
        email: email ?? _email,
        address: address ?? _address,
        phone: phone ?? _phone,
        website: website ?? _website,
        company: company ?? _company,
      );

  int? get id => _id;

  String? get name => _name;

  String? get username => _username;

  String? get email => _email;

  Address? get address => _address;

  String? get phone => _phone;

  String? get website => _website;

  Company? get company => _company;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['username'] = _username;
    map['email'] = _email;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    map['phone'] = _phone;
    map['website'] = _website;
    if (_company != null) {
      map['company'] = _company?.toJson();
    }
    return map;
  }
}

Company companyFromJson(String str) => Company.fromJson(json.decode(str));

String companyToJson(Company data) => json.encode(data.toJson());

class Company {
  Company({
    String? name,
    String? catchPhrase,
    String? bs,
  }) {
    _name = name;
    _catchPhrase = catchPhrase;
    _bs = bs;
  }

  Company.fromJson(dynamic json) {
    _name = json['name'];
    _catchPhrase = json['catchPhrase'];
    _bs = json['bs'];
  }

  String? _name;
  String? _catchPhrase;
  String? _bs;

  Company copyWith({
    String? name,
    String? catchPhrase,
    String? bs,
  }) =>
      Company(
        name: name ?? _name,
        catchPhrase: catchPhrase ?? _catchPhrase,
        bs: bs ?? _bs,
      );

  String? get name => _name;

  String? get catchPhrase => _catchPhrase;

  String? get bs => _bs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['catchPhrase'] = _catchPhrase;
    map['bs'] = _bs;
    return map;
  }
}

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  Address({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Geo? geo,
  }) {
    _street = street;
    _suite = suite;
    _city = city;
    _zipcode = zipcode;
    _geo = geo;
  }

  Address.fromJson(dynamic json) {
    _street = json['street'];
    _suite = json['suite'];
    _city = json['city'];
    _zipcode = json['zipcode'];
    _geo = json['geo'] != null ? Geo.fromJson(json['geo']) : null;
  }

  String? _street;
  String? _suite;
  String? _city;
  String? _zipcode;
  Geo? _geo;

  Address copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Geo? geo,
  }) =>
      Address(
        street: street ?? _street,
        suite: suite ?? _suite,
        city: city ?? _city,
        zipcode: zipcode ?? _zipcode,
        geo: geo ?? _geo,
      );

  String? get street => _street;

  String? get suite => _suite;

  String? get city => _city;

  String? get zipcode => _zipcode;

  Geo? get geo => _geo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = _street;
    map['suite'] = _suite;
    map['city'] = _city;
    map['zipcode'] = _zipcode;
    if (_geo != null) {
      map['geo'] = _geo?.toJson();
    }
    return map;
  }
}

Geo geoFromJson(String str) => Geo.fromJson(json.decode(str));

String geoToJson(Geo data) => json.encode(data.toJson());

class Geo {
  Geo({
    String? lat,
    String? lng,
  }) {
    _lat = lat;
    _lng = lng;
  }

  Geo.fromJson(dynamic json) {
    _lat = json['lat'];
    _lng = json['lng'];
  }

  String? _lat;
  String? _lng;

  Geo copyWith({
    String? lat,
    String? lng,
  }) =>
      Geo(
        lat: lat ?? _lat,
        lng: lng ?? _lng,
      );

  String? get lat => _lat;

  String? get lng => _lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = _lat;
    map['lng'] = _lng;
    return map;
  }
}
