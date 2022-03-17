// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      id: json['_id'] as String,
      streets: json['streets'] as List,
      report_id: json['report_id'] as int,
      qtde_blocks: json['qtde_blocks'] as int,
      groups: Group.fromJson(json['groups'] as Map<String, dynamic>),
      districts: District.fromJson(json['districts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      '_id': instance.id,
      'streets': instance.streets,
      'report_id': instance.report_id,
      'qtde_blocks': instance.qtde_blocks,
      'groups': instance.groups,
      'districts': instance.districts,
    };
