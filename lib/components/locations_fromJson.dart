import 'dart:convert';
import 'package:flutter/services.dart';

Future<Locations> getLocationsList() async {
  var jsonData = await rootBundle.loadString('assets/json/events.json');
  var data = json.decode(jsonData);
  return Locations.fromJson(data);
}

class Locations {
  List<Location>? location;

  Locations({this.location});

  Locations.fromJson(Map<String, dynamic> json) {
    if (json['location'] != null) {
      location = <Location>[];
      json['location'].forEach((v) {
        location!.add(new Location.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Location {
  String? iD;
  String? name;
  String? type;
  String? condition;
  String? finance;
  String? fullDescr;
  String? street;
  String? house;
  String? longitude;
  String? latitude;
  String? image;

  Location(
      {this.iD,
        this.name,
        this.type,
        this.condition,
        this.finance,
        this.fullDescr,
        this.street,
        this.house,
        this.longitude,
        this.latitude,
        this.image});

  Location.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['name'];
    type = json['type'];
    condition = json['condition'];
    finance = json['finance'];
    fullDescr = json['full_descr'];
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
    data['condition'] = this.condition;
    data['finance'] = this.finance;
    data['full_descr'] = this.fullDescr;
    data['street'] = this.street;
    data['house'] = this.house;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['image'] = this.image;
    return data;
  }
}
