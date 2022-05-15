class DataToMap {
  final dynamic bgcolor;
  //for houses
  final dynamic itemId;
  final dynamic streetHouse;
  final dynamic numberHouse;
  final dynamic caretakerName;
  final dynamic caretakerDadname;
  final dynamic caretakerSurname;
  final dynamic caretakerContact;
  final dynamic houseYear;
  final dynamic serviceProvider;
  final dynamic refurbishmentRoofYear;
  final dynamic refurbishmentRoofCondition;
  final dynamic refurbishmentFrontYear;
  final dynamic refurbishmentFrontCondition;
  final dynamic refurbishmentElectronicsYear;
  final dynamic refurbishmentElectronicsCondition;
  final dynamic refurbishmentWaterYear;
  final dynamic refurbishmentWaterCondition;
  final dynamic refurbishmentSewerageYear;
  final dynamic refurbishmentSewerageCondition;
  final dynamic refurbishmentHeatingYear;
  final dynamic refurbishmentHeatingCondition;
  final dynamic refurbishmentGasYear;
  final dynamic refurbishmentGasCondition;

  //for events
  final dynamic eventId;
  final dynamic eventName;
  final dynamic eventDesc;
  final dynamic eventType;
  final dynamic eventPlace;
  final dynamic eventDate;
  final dynamic eventTime;
  final dynamic eventImg;

  //for organizations
  //for locations
  final dynamic locationId;
  final dynamic locationName;
  final dynamic locationType;
  final dynamic locationCondition;
  final dynamic locationFinance;
  final dynamic locationFullDescr;
  final dynamic locationStreet;
  final dynamic locationHouse;
  final dynamic locationImage;

  DataToMap({
    required this.bgcolor,

    //for houses
    this.itemId,
    this.streetHouse,
    this.numberHouse,
    this.caretakerName,
    this.caretakerDadname,
    this.caretakerSurname,
    this.caretakerContact,
    this.houseYear,
    this.serviceProvider,
    this.refurbishmentRoofYear,
    this.refurbishmentRoofCondition,
    this.refurbishmentFrontYear,
    this.refurbishmentFrontCondition,
    this.refurbishmentElectronicsYear,
    this.refurbishmentElectronicsCondition,
    this.refurbishmentWaterYear,
    this.refurbishmentWaterCondition,
    this.refurbishmentSewerageYear,
    this.refurbishmentSewerageCondition,
    this.refurbishmentHeatingYear,
    this.refurbishmentHeatingCondition,
    this.refurbishmentGasYear,
    this.refurbishmentGasCondition,

    //for events
    this.eventId,
    this.eventName,
    this.eventDesc,
    this.eventType,
    this.eventPlace,
    this.eventDate,
    this.eventTime,
    this.eventImg,

    //for organizations
    //for locations
    this.locationId,
    this.locationName,
    this.locationType,
    this.locationCondition,
    this.locationFinance,
    this.locationFullDescr,
    this.locationStreet,
    this.locationHouse,
    this.locationImage,

  });
}
