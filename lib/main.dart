// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:country_codes/country_codes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:territoriei/features/district/district.dart';
import 'package:territoriei/features/group/blocs/blocs.dart';
import 'package:territoriei/features/initScreen.dart';
import 'package:territoriei/features/report/blocs/blocs.dart';
import 'package:territoriei/i18n/translations.i18n.dart';
import 'package:territoriei/routes.dart';
import 'package:territoriei/repositories/repositories.dart';
import 'package:territoriei/utils/dio_http_client.dart';
import 'package:territoriei/utils/interfaces/ihttp_client.dart';
import 'package:territoriei/utils/simple_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //LocaleSettings.useDeviceLocale();
  //await Firebase.initializeApp();
  final _client = DioHttpClient(client: Dio());
  await CountryCodes.init();
  BlocOverrides.runZoned(
    () => runApp(
      TranslationProvider(
        child: RepositoryProvider<IHttpClient>.value(
          value: _client,
          child: Territoriei(),
        ),
      ),
    ),
    blocObserver: SimpleBlocObserver(),
  );
}

// ignore: use_key_in_widget_constructors
class Territoriei extends StatefulWidget {
  @override
  TerritorieiState createState() => TerritorieiState();
}

class TerritorieiState extends State<Territoriei> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    final language = Translations.of(context).shared;

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IGroupRepository>(
          create: (context) =>
              GroupRepository(client: RepositoryProvider.of(context)),
        ),
        RepositoryProvider<IDistrictRepository>(
          create: (context) =>
              DistrictRepository(client: RepositoryProvider.of(context)),
        ),
        RepositoryProvider<IReportRepository>(
          create: (context) =>
              ReportRepository(client: RepositoryProvider.of(context)),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (context) =>
                GroupBloc(repository: RepositoryProvider.of(context)),
          ),
          BlocProvider(
            lazy: false,
            create: (context) =>
                DistrictBloc(repository: RepositoryProvider.of(context)),
          ),
          BlocProvider(
            lazy: false,
            create: (context) =>
                ReportBloc(repository: RepositoryProvider.of(context)),
          ),
        ],
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          theme: ThemeData(
            primaryColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xff3E434C),
              iconTheme: IconThemeData(color: Color(0xffcc39191)),
              actionsIconTheme: IconThemeData(color: Color(0xffcc39191)),
              centerTitle: false,
              elevation: 15,
              titleTextStyle: TextStyle(color: Color(0xffFFC000), fontSize: 25),
            ),
          ),
          locale: TranslationProvider.of(context).flutterLocale,
          supportedLocales: LocaleSettings.supportedLocales,
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          onGenerateTitle: (context) => language.appName,
          routes: routes,
          initialRoute: InitScreen.route,
        ),
      ),
    );
  }
}
