// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:territoriei/features/group/screens/screens.dart';
import 'package:territoriei/repositories/ireport_repository.dart';
import 'package:territoriei/routes.dart';
import 'package:territoriei/widget/navigator_scope.dart';
import 'package:territoriei/widget/progress.dart';

import '../blocs/report_bloc.dart';

class ReportByGroupScreenArguments {
  final String groupId;

  ReportByGroupScreenArguments({
    required this.groupId,
  });
}

class ReportByGroupScreen extends StatefulWidget {
  static String route = '$ReportByGroupScreen';

  final ReportByGroupScreenArguments arguments;

  const ReportByGroupScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  State<ReportByGroupScreen> createState() => _ReportByGroupScreensState();
}

class _ReportByGroupScreensState extends State<ReportByGroupScreen> {
  late final bloc = ReportBloc(repository: RepositoryProvider.of(context));

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NavigatorScope(
      home: _ReportByGroup(arguments: widget.arguments),
      onWillPop: () async {
        return false;
      },
      builder: (BuildContext context, Navigator navigator) {
        return BlocProvider.value(
          value: bloc,
          child: navigator,
        );
      },
      routes: {
        ...routes,
        GroupScreen.route: (context) {
          return GroupScreen();
        },
      },
    );
  }
}

class _ReportByGroup extends StatefulWidget {
  const _ReportByGroup({Key? key, required this.arguments}) : super(key: key);

  final ReportByGroupScreenArguments arguments;

  @override
  State<_ReportByGroup> createState() => _ReportByGroupState();
}

class _ReportByGroupState extends State<_ReportByGroup> {
  late final _reportBloc = BlocProvider.of<ReportBloc>(context);
  late final IReportRepository repository;

  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _reportBloc.add(ReportGetReportEvent(groupId: widget.arguments.groupId));
    });
  }

  @override
  void dispose() {
    _reportBloc.close();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Territórios'),
        bottom: PreferredSize(
          child: Container(
            color: Colors.orange,
            height: 2.0,
          ),
          preferredSize: const Size.fromHeight(4.0),
        ),
      ),
      backgroundColor: const Color(0xff3E434C),
      body: BlocConsumer<ReportBloc, ReportState>(
        listener: (context, state) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            if (_controller.hasClients) {
              _controller.animateTo(
                _controller.position.maxScrollExtent,
                duration: kThemeAnimationDuration,
                curve: Curves.easeOut,
              );
            }
          });
        },
        bloc: _reportBloc,
        builder: (context, state) {
          if (state is ReportWithoutReport || state is ReportGettingReport) {
            return Center(child: Progress());
          }

          if (state is ReportGettingReportSuccess) {
            final reports = state.reports;
            log(reports.toString());
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'TESTE',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Color(0xffFFFFFF),
                            // letterSpacing: .5,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                ),
              ],
            );
          }
          return const Center(
            child: Text('Algo inesperado ocorreu'),
          );
        },
      ),
    );
  }
}
