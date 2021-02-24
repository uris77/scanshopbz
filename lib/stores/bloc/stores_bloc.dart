import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:scanshop_api/api.dart';
import 'package:scanshop_models/models.dart';

part 'stores_event.dart';
part 'stores_state.dart';

/// The StoresBloc. It is responsible for persisting a store and loading stores.
class StoresBloc extends Bloc<StoresEvent, StoresState> {
  /// Constructor
  StoresBloc({this.storesDao}) : super(StoresLoadInProgress());

  /// The Stores DAO
  final Dao storesDao;

  /// Initial State
  StoresState get initialState => StoresLoadInProgress()

  @override
  Stream<StoresState> mapEventToState(
    StoresEvent event,
  ) async* {
   if(event is LoadStores) {
     yield StoresLoadInProgress();
     yield* _reloadStores();
   } else if (event is AddStore) {
     yield* _addStore(event);
   }
  }

  Stream<StoresState> _reloadStores() async* {
    final stores = await storesDao.getAllSortedByName() as List<Store>;
    yield StoresLoadSuccess(stores);
  }

  Stream<StoresState> _addStore(AddStore event) async* {
    await storesDao.insert(event.store);
    yield* _reloadStores();
  }
}
