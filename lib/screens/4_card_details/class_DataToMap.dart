class DataToMap {
  final dynamic bgcolor;
  final dynamic whatIsThis;

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
  final dynamic houseLongitude;
  final dynamic houseLatitude;

  //for events
  final dynamic eventId;
  final dynamic eventName;
  final dynamic eventDesc;
  final dynamic eventType;
  final dynamic eventPlace;
  final dynamic eventDate;
  final dynamic eventTime;
  final dynamic eventImg;
  final dynamic eventLongitude;
  final dynamic eventLatitude;

  //for organizations
  final dynamic organizationId;
  final dynamic organizationName;
  final dynamic organizationType;
  final dynamic organizationShortDescr;
  final dynamic organizationLongDescr;
  final dynamic organizationStreet;
  final dynamic organizationHouse;
  final dynamic organizationLongitude;
  final dynamic organizationLatitude;
  final dynamic organizationImage;

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
  final dynamic locationLongitude;
  final dynamic locationLatitude;

  DataToMap({
    required this.bgcolor,
    this.whatIsThis,

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
    this.houseLatitude,
    this.houseLongitude,

    //for events
    this.eventId,
    this.eventName,
    this.eventDesc,
    this.eventType,
    this.eventPlace,
    this.eventDate,
    this.eventTime,
    this.eventImg,
    this.eventLatitude,
    this.eventLongitude,

    //for organizations
    this.organizationId,
    this.organizationName,
    this.organizationType,
    this.organizationShortDescr,
    this.organizationLongDescr,
    this.organizationStreet,
    this.organizationHouse,
    this.organizationLongitude,
    this.organizationLatitude,
    this.organizationImage,

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
    this.locationLatitude,
    this.locationLongitude,

  });
}
