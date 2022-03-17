import 'dart:async';

import 'package:territoriei/models/report.dart';

abstract class IReportRepository {
  /// GET - <API_GATEWAY>/chatform/request-session/:flow
  FutureOr<List<Report>> getReportByGroup(String groupId);
}
