import 'package:flutter/material.dart';
import 'package:territoriei/features/group/group.dart';
import 'package:territoriei/features/home/home.dart';
import 'package:territoriei/features/initScreen.dart';
import 'package:territoriei/features/report/report.dart';
import 'package:territoriei/utils/modal_route_extension.dart';

final Map<String, WidgetBuilder> routes = {
  InitScreen.route: (context) {
    return const InitScreen();
  },
  Home.route: (context) {
    return const Home();
  },
  GroupScreen.route: (context) {
    return const GroupScreen();
  },
  ReportByGroupScreen.route: (context) {
    final arguments =
        ModalRoute.of(context).arguments<ReportByGroupScreenArguments>()!;

    return ReportByGroupScreen(arguments: arguments);
  }
};
