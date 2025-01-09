import 'package:docdoc/features/home/data/models/home_response_model.dart';
import 'package:docdoc/features/home/domain/entities/home_response_entity.dart';

class HomeMapper {
  static HomeResponseEntity toDomain(HomeResponseModel model) {
    return HomeResponseEntity(
      data: model.data!
          .map((dataModel) => mapDataModelToEntity(dataModel))
          .toList(),
      message: model.message,
      status: model.status,
      code: model.code,
    );
  }

  static DataEntity mapDataModelToEntity(DataModel model) {
    return DataEntity(
      id: model.id,
      name: model.name,
      doctors: model.doctors!
          .map((doctorModel) => mapDoctorsModelToEntity(doctorModel))
          .toList(), // Assuming `Doctors` in `DataModel` and `DataEntity` are identical.
    );
  }

  static DoctorsEntity mapDoctorsModelToEntity(DoctorsModel model) {
    return DoctorsEntity(
      address: model.address,
      email: model.email,
      phone: model.phone,
      name: model.name,
      appointPrice: model.appointPrice,
      degree: model.degree,
      description: model.description,
      id: model.id,
      photo: model.photo,
      endTime: model.endTime,
      startTime: model.startTime,
      gender: model.gender,
      specialization: mapSpecializationModelToEntity(model.specialization!),
      city: mapCityModelToEntity(model.city!),
    );
  }

  static SpecializationEntity mapSpecializationModelToEntity(
      SpecializationModel model) {
    return SpecializationEntity(
      id: model.id,
      name: model.name,
    );
  }

  static CityEntity mapCityModelToEntity(CityModel model) {
    return CityEntity(
      id: model.id,
      name: model.name,
      governrate: mapSpecializationModelToEntity(model.governrate!),
    );
  }
}
