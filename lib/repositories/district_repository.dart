import 'dart:async';

import 'package:territoriei/environment.dart';
import 'package:territoriei/models/district.dart';
import 'package:territoriei/repositories/idistrict_repository.dart';
import 'package:territoriei/utils/interfaces/ihttp_client.dart';

class DistrictRepository extends IDistrictRepository {
  IHttpClient client;

  DistrictRepository({required this.client});

  @override
  FutureOr<List<District>> getDistricts() async {
    final response = await client.get('$kBaseUrl/district');
    return response.map<District>((json) => District.fromJson(json)).toList();
  }
}
