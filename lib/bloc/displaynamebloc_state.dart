part of 'displaynamebloc_bloc.dart';

abstract class DisplaynameblocState extends Equatable {
  const DisplaynameblocState();

  @override
  List<Object> get props => [];
}

class DisplaynameblocInitial extends DisplaynameblocState {}

class DisplaynameblocLoading extends DisplaynameblocState {}

class DisplaynameblocLoaded extends DisplaynameblocInitial {
  final List<Link> linkListOfDatas;

  DisplaynameblocLoaded({required this.linkListOfDatas});
  @override
  List<Object> get props => [linkListOfDatas];
}

class DisplaynameblocFailed extends DisplaynameblocInitial {
  final String message;

  DisplaynameblocFailed({required this.message});
  @override
  List<Object> get props => [message];
}
