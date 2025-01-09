class HomeResponseEntity {
  String? message;
  List<DataEntity>? data;
  bool? status;
  int? code;

  HomeResponseEntity({this.message, this.data, this.status, this.code});
}

class DataEntity {
  int? id;
  String? name;
  List<DoctorsEntity>? doctors;

  DataEntity({this.id, this.name, this.doctors});
}

class DoctorsEntity {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  String? address;
  String? description;
  String? degree;
  SpecializationEntity? specialization;
  CityEntity? city;
  int? appointPrice;
  String? startTime;
  String? endTime;

  DoctorsEntity({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.address,
    this.description,
    this.degree,
    this.specialization,
    this.city,
    this.appointPrice,
    this.startTime,
    this.endTime,
  });
}

class SpecializationEntity {
  int? id;
  String? name;

  SpecializationEntity({this.id, this.name});
}

class CityEntity {
  int? id;
  String? name;
  SpecializationEntity? governrate;

  CityEntity({this.id, this.name, this.governrate});
}
