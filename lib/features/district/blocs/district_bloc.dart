import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:territoriei/repositories/idistrict_repository.dart';

import '../../../models/district.dart';

part 'district_event.dart';

part 'district_state.dart';

class DistrictBloc extends Bloc<DistrictEvent, DistrictState> {
  final IDistrictRepository repository;

  DistrictBloc({
    required this.repository,
  }) : super(DistrictWithoutDistrict()) {
    on<DistrictGetDistrictEvent>(_getDistricts);
    //on<DistrictSendResponseEvent>(_sendResponse);
  }

  FutureOr<void> _getDistricts(
      DistrictGetDistrictEvent event, Emitter<DistrictState> emitter) async {
    emitter(DistrictGettingDistrict());
    try {
      final districts = await repository.getDistricts();
      emitter(DistrictGettingDistrictSuccess(districts: districts));
    } catch (e) {
      emitter(DistrictGettingDistrictFailure(e));
      rethrow;
    }
  }
}
