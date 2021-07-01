import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:knn_telur/helper/state_store.dart';

part 'show_widget_event.dart';
part 'show_widget_state.dart';

class ShowWidgetBloc extends Bloc<ShowWidgetEvent, ShowWidgetState> {
  ShowWidgetBloc() : super(ShowWidgetInitial());

  @override
  Stream<ShowWidgetState> mapEventToState(
    ShowWidgetEvent event,
  ) async* {
    if (event is GetPickedFile) {
      try {
        yield ShowWidgetInitial();
        final data = (base64 != '' && pickedFile == null)
            ? 1
            : (pickedFile != null)
                ? 2
                : 0;
        yield ShowWidgetLoaded(pageState: data);
      } catch (e) {
        yield ShowWidgetError(error: 'Error gan...');
      }
    }
  }
}
