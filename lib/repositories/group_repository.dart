import 'dart:async';
import 'dart:developer';

import 'package:territoriei/environment.dart';
import 'package:territoriei/models/group.dart';
import 'package:territoriei/repositories/igroup_repository.dart';
import 'package:territoriei/utils/interfaces/ihttp_client.dart';

class GroupRepository extends IGroupRepository {
  IHttpClient client;

  GroupRepository({required this.client});

  @override
  FutureOr<List<Group>> getGroups() async {
    final response = await client.get('$kBaseUrl/group');
    return response.map<Group>((json) => Group.fromJson(json)).toList();
  }
}
