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
    // TODO 1: Start by signaling that the mixing process has begun.
    //         We need to notify the user that the operation is in progress.

    // TODO 2: now its time to communicate with the D-Bus service.
    //         You can use the [dBusRepository] to throttle the motor for the specified duration.

    // TODO 3: Check out the response from the D-Bus service and if it was successful.
    //         notify the user that the operation was successful.

    // TODO 4: If the operation was not successful, notify the user that the operation failed.
    //         you can use try-catch to handle the exception.
  }
}
