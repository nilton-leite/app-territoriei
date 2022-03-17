part of 'report_bloc.dart';

abstract class ReportState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReportWithoutReport extends ReportState {}

class ReportRefreshingReport extends ReportState {}

class ReportGettingReport extends ReportState {}

class ReportGettingReportSuccess extends ReportState {
  final List<Report> reports;

  ReportGettingReportSuccess({required this.reports});

  @override
  List<Object?> get props => [
        reports,
      ];

  ReportGettingReportSuccess copyWith({List<Report>? reports}) {
    return ReportGettingReportSuccess(reports: reports ?? this.reports);
  }
}

class ReportGettingReportFailure extends ReportState {
  final Object exception;

  ReportGettingReportFailure(this.exception);

  @override
  List<Object> get props => [exception];
}
