part of 'mix_cubit.dart';

@immutable
sealed class MixState {
  const MixState();
}

final class MixInitial extends MixState {}

final class MixLoading extends MixState {}

final class MixLoaded extends MixState {}

final class MixError extends MixState {
  const MixError(this.message);

  final String message;
}
