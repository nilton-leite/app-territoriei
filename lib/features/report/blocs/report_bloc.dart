import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:territoriei/repositories/ireport_repository.dart';

import '../../../models/report.dart';

part 'report_event.dart';

part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final IReportRepository repository;

  ReportBloc({
    required this.repository,
  }) : super(ReportWithoutReport()) {
    on<ReportGetReportEvent>(_getReportByGroup);
    //on<ReportSendResponseEvent>(_sendResponse);
  }

  FutureOr<void> _getReportByGroup(
      ReportGetReportEvent event, Emitter<ReportState> emitter) async {
    emitter(ReportGettingReport());
    try {
      final reports = await repository.getReportByGroup(event.groupId);
      emitter(ReportGettingReportSuccess(reports: reports));
    } catch (e) {
      emitter(ReportGettingReportFailure(e));
      rethrow;
    }
  }
}
