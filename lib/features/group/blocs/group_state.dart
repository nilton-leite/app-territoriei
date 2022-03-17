part of 'group_bloc.dart';

abstract class GroupState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GroupWithoutGroup extends GroupState {}

class GroupRefreshingGroup extends GroupState {}

class GroupGettingGroup extends GroupState {}

class GroupGettingGroupSuccess extends GroupState {
  final List<Group> groups;

  GroupGettingGroupSuccess({required this.groups});

  @override
  List<Object?> get props => [
        groups,
      ];

  GroupGettingGroupSuccess copyWith({List<Group>? groups}) {
    return GroupGettingGroupSuccess(groups: groups ?? this.groups);
  }
}

class GroupGettingGroupFailure extends GroupState {
  final Object exception;

  GroupGettingGroupFailure(this.exception);

  @override
  List<Object> get props => [exception];
}
