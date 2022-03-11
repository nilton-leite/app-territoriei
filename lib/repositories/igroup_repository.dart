import 'dart:async';

import 'package:territoriei/models/group.dart';


abstract class IGroupRepository {
  /// GET - <API_GATEWAY>/chatform/request-session/:flow
  FutureOr<Group> getGroups(
      String _id, String description);
}
