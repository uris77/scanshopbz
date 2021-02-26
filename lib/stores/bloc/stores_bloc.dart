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
  StoresState get initialState => StoresLoadInProgress();

  @override
  Stream<StoresState> mapEventToState(
    StoresEvent event,
  ) async* {
    print('mapping event: $event');
    if (event is LoadStores) {
      yield StoresLoadInProgress();
      yield* _reloadStores();
    } else if (event is AddStore) {
      yield StoresSavingInProgress(event.store);
      yield* _addStore(event);
    } else if (event is UpdateStore) {
      yield StoresSavingInProgress(event.store);
      yield* _updateStore(event);
    }
  }

  Stream<StoresState> _reloadStores() async* {
    try {
      final stores = await storesDao.getAllSortedByName() as List<Store>;
      yield StoresLoadSuccess(stores);
    } on Exception {
      print('failed to load stores');
      yield StoresLoadFailure();
    }
  }

  Stream<StoresState> _addStore(AddStore event) async* {
    try {
      await storesDao.insert(event.store);
      yield StoresSavedSuccessfully(event.store);
    } on Exception {
      print('failed to save store');
      yield StoreFailedToSave(event.store);
    }
  }

  Stream<StoresState> _updateStore(UpdateStore event) async* {
    try {
      await storesDao.update(event.store);
      yield StoresSavedSuccessfully(event.store);
    } on Exception{
      print('failed to update store');
      yield StoreFailedToSave(event.store);
    }
  }
}
