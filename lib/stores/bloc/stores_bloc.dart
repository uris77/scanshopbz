import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:scanshop_models/models.dart';

part 'stores_event.dart';
part 'stores_state.dart';

class StoresBloc extends Bloc<StoresEvent, StoresState> {
  StoresBloc() : super(StoresLoadInProgress());

  @override
  Stream<StoresState> mapEventToState(
    StoresEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
