part of 'displaynamebloc_bloc.dart';

abstract class DisplaynameblocEvent extends Equatable {
  const DisplaynameblocEvent();

  @override
  List<Object> get props => [];
}

class RequestSpecificLinks extends DisplaynameblocEvent {
  final String collectionID;
  RequestSpecificLinks({required this.collectionID});

  @override
  List<Object> get props => [collectionID];
}
