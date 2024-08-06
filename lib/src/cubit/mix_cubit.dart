import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:workshop_flutterfriends/src/repository/dbus_repository.dart';

part 'mix_state.dart';

class MixCubit extends Cubit<MixState> {
  MixCubit({
    required this.dBusRepository,
  }) : super(MixInitial());

  final DBusRepository dBusRepository;

  Future<void> mixCandies(int duration) async {
    assert(duration > 0 && duration <= 10);

    if (duration == 0) {
      emit(const MixError('Duration must be greater than 0'));
      return;
    }

    emit(MixLoading());
    try {
      // Call the repository to mix the candies
      final result =
          await dBusRepository.throttleMotor(duration: duration / 10);

      log('Throttle motor result: $result');

      emit(MixLoaded());
    } catch (e) {
      emit(MixError('Failed to mix candies: $e'));
    }
  }
}
