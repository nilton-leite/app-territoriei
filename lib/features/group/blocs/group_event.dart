part of 'group_bloc.dart';

abstract class GroupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GroupGetGroupEvent extends GroupEvent {
  final String? id;

  GroupGetGroupEvent({
    this.id,
  });

  @override
  List<Object?> get props => [id];
}

// class GroupSendResponseEvent extends GroupEvent {
//   final GroupSendResponse response;

//   GroupSendResponseEvent({
//     required this.response,
//   });
// }
