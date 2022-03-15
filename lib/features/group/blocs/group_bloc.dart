import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:territoriei/repositories/igroup_repository.dart';

import '../../../models/group.dart';

part 'group_event.dart';

part 'group_state.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  final IGroupRepository repository;

  GroupBloc({
    required this.repository,
  }) : super(GroupWithoutSession()) {
    on<GroupGetSessionEvent>(_getGroup);
    //on<GroupSendResponseEvent>(_sendResponse);
  }

  FutureOr<void> _getGroup(
      GroupGetSessionEvent event, Emitter<GroupState> emitter) async {
    emitter(GroupGettingSession());
    try {
      final groups = await repository.getGroups();
      emitter(GroupGettingSessionSuccess(groups: groups));
    } catch (e) {
      emitter(GroupGettingSessionFailure(e));
      rethrow;
    }
  }
}
