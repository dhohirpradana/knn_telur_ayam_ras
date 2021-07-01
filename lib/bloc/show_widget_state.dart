part of 'show_widget_bloc.dart';

abstract class ShowWidgetState extends Equatable {
  const ShowWidgetState();

  @override
  List<Object> get props => [];
}

class ShowWidgetInitial extends ShowWidgetState {}

class ShowWidgetLoading extends ShowWidgetState {}

class ShowWidgetLoaded extends ShowWidgetState {
  final int pageState;
  ShowWidgetLoaded({required this.pageState});
  List<Object> get props => [];
}

class ShowWidgetError extends ShowWidgetState {
  final error;
  ShowWidgetError({this.error});
  List<Object> get props => [error];
}
