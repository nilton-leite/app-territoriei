part of 'group_bloc.dart';

abstract class GroupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GroupGetSessionEvent extends GroupEvent {
  final Locale? locale;
  final String? userId;

  GroupGetSessionEvent({
    this.locale,
    this.userId,
  });

  @override
  List<Object?> get props => [locale, userId];
}

// class GroupSendResponseEvent extends GroupEvent {
//   final GroupSendResponse response;

//   GroupSendResponseEvent({
//     required this.response,
//   });
// }
