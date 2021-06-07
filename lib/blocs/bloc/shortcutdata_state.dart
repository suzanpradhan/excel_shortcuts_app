part of 'shortcutdata_bloc.dart';

abstract class ShortcutdataState extends Equatable {
  const ShortcutdataState();

  @override
  List<Object> get props => [];
}

class ShortcutdataInitial extends ShortcutdataState {}

class ShortcutDataLoading extends ShortcutdataState {}

class ShortcutDataLoaded extends ShortcutdataState {
  final List<Shortcut> shorcutsListOfDatas;

  ShortcutDataLoaded({required this.shorcutsListOfDatas});
  @override
  List<Object> get props => [shorcutsListOfDatas];
}

class ShortcutDataLoadFailed extends ShortcutdataState {
  final String message;

  ShortcutDataLoadFailed({required this.message});
  @override
  List<Object> get props => [message];
}
