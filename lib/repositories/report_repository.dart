import 'dart:async';

import 'package:territoriei/environment.dart';
import 'package:territoriei/models/report.dart';
import 'package:territoriei/repositories/ireport_repository.dart';
import 'package:territoriei/utils/interfaces/ihttp_client.dart';

class ReportRepository extends IReportRepository {
  IHttpClient client;

  ReportRepository({required this.client});

  @override
  FutureOr<List<Report>> getReportByGroup(String groupId) async {
    final response = await client.get('$kBaseUrl/reportByGroup/$groupId');
    return response.map<Report>((json) => Report.fromJson(json)).toList();
  }
}
