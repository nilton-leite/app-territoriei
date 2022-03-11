import 'dart:async';

import 'package:territoriei/environment.dart';
import 'package:territoriei/models/group.dart';
import 'package:territoriei/repositories/igroup_repository.dart';
import 'package:territoriei/utils/interfaces/ihttp_client.dart';


class ChatFormRepository extends IGroupRepository {
  IHttpClient client;

  ChatFormRepository({required this.client});

  @override
  FutureOr<Group> getGroups(
      String _id, String description) async {
    
    final response =
        await client.get('$kBaseUrl/group');

    return Group.fromJson(response);
  }
}
