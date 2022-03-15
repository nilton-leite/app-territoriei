part of 'group_bloc.dart';

abstract class GroupState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GroupWithoutSession extends GroupState {}

class GroupGettingSession extends GroupState {}

class GroupGettingSessionSuccess extends GroupState {
  final List<Group> groups;

  GroupGettingSessionSuccess({required this.groups});

  @override
  List<Object?> get props => [
        groups,
      ];

  GroupGettingSessionSuccess copyWith({List<Group>? groups}) {
    return GroupGettingSessionSuccess(groups: groups ?? this.groups);
  }
}

class GroupGettingSessionFailure extends GroupState {
  final Object exception;

  GroupGettingSessionFailure(this.exception);

  @override
  List<Object> get props => [exception];
}
