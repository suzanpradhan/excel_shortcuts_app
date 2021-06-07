part of 'shortcutdata_bloc.dart';

abstract class ShortcutdataEvent extends Equatable {
  const ShortcutdataEvent();

  @override
  List<Object> get props => [];
}

class RequestSpecificShortcutDatas extends ShortcutdataEvent {
  final String collectionID;
  RequestSpecificShortcutDatas({required this.collectionID});

  @override
  List<Object> get props => [collectionID];
}
