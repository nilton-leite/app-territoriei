part of 'district_bloc.dart';

abstract class DistrictEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DistrictGetDistrictEvent extends DistrictEvent {
  final String? id;

  DistrictGetDistrictEvent({
    this.id,
  });

  @override
  List<Object?> get props => [id];
}

// class DistrictSendResponseEvent extends DistrictEvent {
//   final DistrictSendResponse response;

//   DistrictSendResponseEvent({
//     required this.response,
//   });
// }
