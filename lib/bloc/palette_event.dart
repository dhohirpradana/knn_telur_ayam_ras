part of 'palette_bloc.dart';

@immutable
abstract class PaletteEvent extends Equatable {
  const PaletteEvent();
}

class GetPaletteData extends PaletteEvent {
  @override
  List<Object> get props => [];
}
