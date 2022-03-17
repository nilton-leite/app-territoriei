part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReportGetReportEvent extends ReportEvent {
  final String groupId;

  ReportGetReportEvent({
    required this.groupId,
  });

  @override
  List<Object?> get props => [groupId];
}

// class ReportSendResponseEvent extends ReportEvent {
//   final ReportSendResponse response;

//   ReportSendResponseEvent({
//     required this.response,
//   });
// }
