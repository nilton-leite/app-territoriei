import 'dart:async';

import 'package:territoriei/models/district.dart';

abstract class IDistrictRepository {
  /// GET - <API_GATEWAY>/chatform/request-session/:flow
  FutureOr<List<District>> getDistricts();
}
