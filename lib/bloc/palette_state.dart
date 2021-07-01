part of 'palette_bloc.dart';

@immutable
abstract class PaletteState extends Equatable {
  const PaletteState();
  @override
  List<Object> get props => [];
}

class PaletteInitial extends PaletteState {}

class PaletteLoading extends PaletteState {}

class PaletteLoaded extends PaletteState {
  final List? paletteData;
  PaletteLoaded({this.paletteData});
}

class PaletteError extends PaletteState {
  final error;
  PaletteError({this.error});
  List<Object> get props => [error];
}
