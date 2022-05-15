import 'dart:convert';
import 'package:flutter/services.dart';

Future<Houses> getHousesList() async {
  var jsonData = await rootBundle.loadString('assets/json/houses.json');
  var data = json.decode(jsonData);
  return Houses.fromJson(data);
}

class Houses {
  List<House>? house;

  Houses({this.house});

  Houses.fromJson(Map<String, dynamic> json) {
    if (json['house'] != null) {
      house = <House>[];
      json['house'].forEach((v) {
        house!.add(new House.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.house != null) {
      data['house'] = this.house!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class House {
  String? iD;
  List<Caretaker>? caretaker;
  String? city;
  String? street;
  String? house;
  int? year;
  String? serviceProvider;
  List<Refurbishment>? refurbishment;
  double? longitude;
  double? latitude;

  House(
      {this.iD,
      this.caretaker,
      this.city,
      this.street,
      this.house,
      this.year,
      this.serviceProvider,
      this.refurbishment,
      this.longitude,
      this.latitude});

  House.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    if (json['caretaker'] != null) {
      caretaker = <Caretaker>[];
      json['caretaker'].forEach((v) {
        caretaker!.add(new Caretaker.fromJson(v));
      });
    }
    city = json['city'];
    street = json['street'];
    house = json['house'];
    year = json['year'];
    serviceProvider = json['service_provider'];
    if (json['refurbishment'] != null) {
      refurbishment = <Refurbishment>[];
      json['refurbishment'].forEach((v) {
        refurbishment!.add(new Refurbishment.fromJson(v));
      });
    }
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    if (this.caretaker != null) {
      data['caretaker'] = this.caretaker!.map((v) => v.toJson()).toList();
    }
    data['city'] = this.city;
    data['street'] = this.street;
    data['house'] = this.house;
    data['year'] = this.year;
    data['service_provider'] = this.serviceProvider;
    if (this.refurbishment != null) {
      data['refurbishment'] =
          this.refurbishment!.map((v) => v.toJson()).toList();
    }
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}

class Caretaker {
  String? caretakerName;
  String? caretakerSurname;
  String? caretakerDadname;
  int? contact;

  Caretaker(
      {this.caretakerName,
      this.caretakerSurname,
      this.caretakerDadname,
      this.contact});

  Caretaker.fromJson(Map<String, dynamic> json) {
    caretakerName = json['caretakerName'];
    caretakerSurname = json['caretakerSurname'];
    caretakerDadname = json['caretakerDadname'];
    contact = json['contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['caretakerName'] = this.caretakerName;
    data['caretakerSurname'] = this.caretakerSurname;
    data['caretakerDadname'] = this.caretakerDadname;
    data['contact'] = this.contact;
    return data;
  }
}

class Refurbishment {
  List<Roof>? roof;
  List<Front>? front;
  List<Electronics>? electronics;
  List<Water>? water;
  List<Sewerage>? sewerage;
  List<Heating>? heating;
  List<Gas>? gas;

  Refurbishment(
      {this.roof,
      this.front,
      this.electronics,
      this.water,
      this.sewerage,
      this.heating,
      this.gas});

  Refurbishment.fromJson(Map<String, dynamic> json) {
    if (json['roof'] != null) {
      roof = <Roof>[];
      json['roof'].forEach((v) {
        roof!.add(new Roof.fromJson(v));
      });
    }
    if (json['front'] != null) {
      front = <Front>[];
      json['front'].forEach((v) {
        front!.add(new Front.fromJson(v));
      });
    }
    if (json['electronics'] != null) {
      electronics = <Electronics>[];
      json['electronics'].forEach((v) {
        electronics!.add(new Electronics.fromJson(v));
      });
    }
    if (json['water'] != null) {
      water = <Water>[];
      json['water'].forEach((v) {
        water!.add(new Water.fromJson(v));
      });
    }
    if (json['sewerage'] != null) {
      sewerage = <Sewerage>[];
      json['sewerage'].forEach((v) {
        sewerage!.add(new Sewerage.fromJson(v));
      });
    }
    if (json['heating'] != null) {
      heating = <Heating>[];
      json['heating'].forEach((v) {
        heating!.add(new Heating.fromJson(v));
      });
    }
    if (json['gas'] != null) {
      gas = <Gas>[];
      json['gas'].forEach((v) {
        gas!.add(new Gas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.roof != null) {
      data['roof'] = this.roof!.map((v) => v.toJson()).toList();
    }
    if (this.front != null) {
      data['front'] = this.front!.map((v) => v.toJson()).toList();
    }
    if (this.electronics != null) {
      data['electronics'] = this.electronics!.map((v) => v.toJson()).toList();
    }
    if (this.water != null) {
      data['water'] = this.water!.map((v) => v.toJson()).toList();
    }
    if (this.sewerage != null) {
      data['sewerage'] = this.sewerage!.map((v) => v.toJson()).toList();
    }
    if (this.heating != null) {
      data['heating'] = this.heating!.map((v) => v.toJson()).toList();
    }
    if (this.gas != null) {
      data['gas'] = this.gas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roof {
  int? maintenanceYear;
  bool? condition;

  Roof({this.maintenanceYear, this.condition});

  Roof.fromJson(Map<String, dynamic> json) {
    maintenanceYear = json['maintenanceYear'];
    condition = json['condition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maintenanceYear'] = this.maintenanceYear;
    data['condition'] = this.condition;
    return data;
  }
}

class Front {
  int? maintenanceYear;
  bool? condition;

  Front({this.maintenanceYear, this.condition});

  Front.fromJson(Map<String, dynamic> json) {
    maintenanceYear = json['maintenanceYear'];
    condition = json['condition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maintenanceYear'] = this.maintenanceYear;
    data['condition'] = this.condition;
    return data;
  }
}

class Electronics {
  int? maintenanceYear;
  bool? condition;

  Electronics({this.maintenanceYear, this.condition});

  Electronics.fromJson(Map<String, dynamic> json) {
    maintenanceYear = json['maintenanceYear'];
    condition = json['condition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maintenanceYear'] = this.maintenanceYear;
    data['condition'] = this.condition;
    return data;
  }
}

class Water {
  int? maintenanceYear;
  bool? condition;

  Water({this.maintenanceYear, this.condition});

  Water.fromJson(Map<String, dynamic> json) {
    maintenanceYear = json['maintenanceYear'];
    condition = json['condition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maintenanceYear'] = this.maintenanceYear;
    data['condition'] = this.condition;
    return data;
  }
}

class Sewerage {
  int? maintenanceYear;
  bool? condition;

  Sewerage({this.maintenanceYear, this.condition});

  Sewerage.fromJson(Map<String, dynamic> json) {
    maintenanceYear = json['maintenanceYear'];
    condition = json['condition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maintenanceYear'] = this.maintenanceYear;
    data['condition'] = this.condition;
    return data;
  }
}

class Heating {
  int? maintenanceYear;
  bool? condition;

  Heating({this.maintenanceYear, this.condition});

  Heating.fromJson(Map<String, dynamic> json) {
    maintenanceYear = json['maintenanceYear'];
    condition = json['condition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maintenanceYear'] = this.maintenanceYear;
    data['condition'] = this.condition;
    return data;
  }
}

class Gas {
  int? maintenanceYear;
  bool? condition;

  Gas({this.maintenanceYear, this.condition});

  Gas.fromJson(Map<String, dynamic> json) {
    maintenanceYear = json['maintenanceYear'];
    condition = json['condition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maintenanceYear'] = this.maintenanceYear;
    data['condition'] = this.condition;
    return data;
  }
}
