part of 'play_sound_cubit.dart';

@immutable
sealed class PlaySoundState {}

final class PlaySoundInitial extends PlaySoundState {}
final class PlaySoundSuccess extends PlaySoundState {}
final class PlaySoundFailure extends PlaySoundState {}
