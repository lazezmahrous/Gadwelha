import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'play_sound_state.dart';

class PlaySoundCubit extends Cubit<PlaySoundState> {
  PlaySoundCubit() : super(PlaySoundInitial());


  void playSound(){
    
  }
}
