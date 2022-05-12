import 'dart:convert';
import 'package:flutter/services.dart';

Future<Organizations> getOrganizationsList() async {
  var jsonData = await rootBundle.loadString('assets/json/events.json');
  var data = json.decode(jsonData);
  return Organizations.fromJson(data);
}

class Organizations {
  List<Organization>? organization;

  Organizations({this.organization});

  Organizations.fromJson(Map<String, dynamic> json) {
    if (json['organization'] != null) {
      organization = <Organization>[];
      json['organization'].forEach((v) {
        organization!.add(new Organization.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.organization != null) {
      data['organization'] = this.organization!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Organization {
  String? iD;
  String? name;
  String? type;
  String? shortDescr;
  String? longDescr;
  String? street;
  String? house;
  String? longitude;
  String? latitude;
  String? image;

  Organization(
      {this.iD,
        this.name,
        this.type,
        this.shortDescr,
        this.longDescr,
        this.street,
        this.house,
        this.longitude,
        this.latitude,
        this.image});

  Organization.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['name'];
    type = json['type'];
    shortDescr = json['short_descr'];
    longDescr = json['long_descr'];
    street = json['street'];
    house = json['house'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['name'] = this.name;
    data['type'] = this.type;
    data['short_descr'] = this.shortDescr;
    data['long_descr'] = this.longDescr;
    data['street'] = this.street;
    data['house'] = this.house;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['image'] = this.image;
    return data;
  }
}
