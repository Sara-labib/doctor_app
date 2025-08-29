
import 'package:json_annotation/json_annotation.dart';

part 'specialization_response_model.g.dart';

@JsonSerializable()
class SpecializationResponseModel {
  @JsonKey(name: 'data')
  List<SpecializationData?>? specializationDataList;

  SpecializationResponseModel({this.specializationDataList});

  factory SpecializationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$SpecializationResponseModelToJson(this);
}

@JsonSerializable()
class SpecializationData {
  int? id;
  String? name;
  @JsonKey(name: 'doctors')
  List<Doctors?>? doctorsList;

  SpecializationData({this.id, this.name, this.doctorsList});

  factory SpecializationData.fromJson(Map<String, dynamic> json) =>
      _$SpecializationDataFromJson(json);
  Map<String, dynamic> toJson() => _$SpecializationDataToJson(this);
}

@JsonSerializable()
class Doctors {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  @JsonKey(name: 'appoint_price')
  int? price;
  String? degree;

  Doctors({this.id, this.name, this.email, this.phone, this.photo, this.gender, this.price, this.degree});

  factory Doctors.fromJson(Map<String, dynamic> json) =>
      _$DoctorsFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorsToJson(this);
}
