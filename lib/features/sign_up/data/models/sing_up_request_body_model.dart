import 'package:json_annotation/json_annotation.dart';

part 'sing_up_request_body_model.g.dart';

@JsonSerializable()
class SingUpRequestBodyModel {
  final String? name;
  final String? email;
  final String? phone;
  final String? gender;
  final String? password;
  @JsonKey(name: 'password_confirmation')
  final String? passwordConfirmation;

  SingUpRequestBodyModel(
      {this.name,
      this.email,
      this.phone,
      this.gender,
      this.password,
      this.passwordConfirmation});

  Map<String, dynamic> toJson() => _$SingUpRequestBodyModelToJson(this);
}
