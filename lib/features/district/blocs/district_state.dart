part of 'district_bloc.dart';

abstract class DistrictState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DistrictWithoutDistrict extends DistrictState {}

class DistrictRefreshingDistrict extends DistrictState {}

class DistrictGettingDistrict extends DistrictState {}

class DistrictGettingDistrictSuccess extends DistrictState {
  final List<District> districts;

  DistrictGettingDistrictSuccess({required this.districts});

  @override
  List<Object?> get props => [
        districts,
      ];

  DistrictGettingDistrictSuccess copyWith({List<District>? districts}) {
    return DistrictGettingDistrictSuccess(
        districts: districts ?? this.districts);
  }
}

class DistrictGettingDistrictFailure extends DistrictState {
  final Object exception;

  DistrictGettingDistrictFailure(this.exception);

  @override
  List<Object> get props => [exception];
}
