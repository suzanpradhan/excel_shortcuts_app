import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:excel_shortcuts_app/link.dart';
import 'package:excel_shortcuts_app/linkCard.dart';
import 'package:excel_shortcuts_app/repository/firestore_repo.dart';

part 'displaynamebloc_event.dart';
part 'displaynamebloc_state.dart';

class DisplaynameblocBloc
    extends Bloc<DisplaynameblocEvent, DisplaynameblocState> {
  FirestoreRepo _firestoreRepo = FirestoreRepo();
  DisplaynameblocBloc() : super(DisplaynameblocInitial());

  @override
  Stream<DisplaynameblocState> mapEventToState(
    DisplaynameblocEvent event,
  ) async* {
    if (event is RequestSpecificLinks) {
      yield DisplaynameblocLoading();
      yield* getAllLinkDatas(event: event);
    }
  }

  Stream<DisplaynameblocState> getAllLinkDatas(
      {required RequestSpecificLinks event}) async* {
    try {
      List<Link> datas = await _firestoreRepo.loadAllCollection(
          collectionID: event.collectionID);
      yield DisplaynameblocLoaded(linkListOfDatas: datas);
    } catch (e) {
      yield DisplaynameblocFailed(message: "Cant't Load Datas.");
    }
  }
}
