import 'dart:developer';
import 'package:logging/logging.dart' show Level;

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    log(
      'OnCreate ...',
      level: Level.WARNING.value,
      name: '${bloc.runtimeType}',
    );
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log(
      'OnChange'
      ' CurrentState=${change.currentState.runtimeType}'
      ' NextState=${change.nextState.runtimeType}',
      level: Level.INFO.value,
      name: '${bloc.runtimeType}',
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log(
      'OnError $error',
      level: Level.SEVERE.value,
      name: '${bloc.runtimeType}',
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }
}
