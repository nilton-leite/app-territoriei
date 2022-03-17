// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:territoriei/models/district.dart';
import 'package:territoriei/models/group.dart';

part 'report.g.dart';

@JsonSerializable()
class Report extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final List streets;
  final int report_id;
  final int qtde_blocks;
  final Group groups;
  final District districts;

  const Report({
    required this.id,
    required this.streets,
    required this.report_id,
    required this.qtde_blocks,
    required this.groups,
    required this.districts,
  });

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  Map<String, dynamic> toJson() => _$ReportToJson(this);

  @override
  List<Object?> get props =>
      [id, streets, report_id, qtde_blocks, groups, districts];
}
