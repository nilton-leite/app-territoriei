import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:territoriei/repositories/igroup_repository.dart';

import '../../../models/group.dart';

part 'group_event.dart';

part 'group_state.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  final IGroupRepository repository;

  GroupBloc({
    required this.repository,
  }) : super(GroupWithoutGroup()) {
    on<GroupGetGroupEvent>(_getGroup);
    //on<GroupSendResponseEvent>(_sendResponse);
  }

  FutureOr<void> _getGroup(
      GroupGetGroupEvent event, Emitter<GroupState> emitter) async {
    emitter(GroupGettingGroup());
    try {
      final groups = await repository.getGroups();
      emitter(GroupGettingGroupSuccess(groups: groups));
    } catch (e) {
      emitter(GroupGettingGroupFailure(e));
      rethrow;
    }
  }
}
