import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

@JsonSerializable()
class Group extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String description;

  const Group({
    required this.id,
    required this.description,
  });

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);

  @override
  List<Object?> get props => [id, description];
}
