import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'district.g.dart';

@JsonSerializable()
class District extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String description;

  const District({
    required this.id,
    required this.description,
  });

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictToJson(this);

  @override
  List<Object?> get props => [id, description];
}
