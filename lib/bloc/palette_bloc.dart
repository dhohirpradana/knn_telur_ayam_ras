import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:knn_telur/helper/palette_gen.dart';
import 'package:knn_telur/helper/state_store.dart';
import 'package:meta/meta.dart';

part 'palette_event.dart';
part 'palette_state.dart';

class PaletteBloc extends Bloc<PaletteEvent, PaletteState> {
  PaletteBloc() : super(PaletteInitial());

  @override
  Stream<PaletteState> mapEventToState(
    PaletteEvent event,
  ) async* {
    if (event is GetPaletteData) {
      try {
        yield PaletteLoading();
        final data = await getImagePalette(pickedFile);
        await Future.delayed(Duration(seconds: 1));
        print('palette:' + data.toString());
        yield PaletteLoaded(paletteData: data);
      } catch (e) {
        yield PaletteError(error: 'Error gan...');
      }
    }
  }
}
