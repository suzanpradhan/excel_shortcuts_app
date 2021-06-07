import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:excel_shortcuts_app/repository/firestore_repo.dart';
import 'package:excel_shortcuts_app/shortcut.dart';

part 'shortcutdata_event.dart';
part 'shortcutdata_state.dart';

class ShortcutdataBloc extends Bloc<ShortcutdataEvent, ShortcutdataState> {
  FirestoreRepo _firestoreRepo = FirestoreRepo();
  ShortcutdataBloc() : super(ShortcutdataInitial());

  @override
  Stream<ShortcutdataState> mapEventToState(
    ShortcutdataEvent event,
  ) async* {
    if (event is RequestSpecificShortcutDatas) {
      yield ShortcutDataLoading();
      yield* getAllShortCutsdatas(event: event);
    }
  }

  Stream<ShortcutdataState> getAllShortCutsdatas(
      {required RequestSpecificShortcutDatas event}) async* {
    try {
      List<Shortcut> datas = await _firestoreRepo.loadAllShortcuts(
          collectionID: event.collectionID);
      yield ShortcutDataLoaded(shorcutsListOfDatas: datas);
    } catch (e) {
      yield ShortcutDataLoadFailed(message: "Cant't Load Datas.");
    }
  }
}
