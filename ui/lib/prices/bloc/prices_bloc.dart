import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:scanshop_models/models.dart';
import 'package:sembast_dao/sembast_dao.dart';

part 'prices_event.dart';
part 'prices_state.dart';

/// This  bloc is responsible for persisting and loading prices information.
class PricesBloc extends Bloc<PricesEvent, PricesState> {
  /// Constructor
  PricesBloc({this.pricesDao}) : super(PricesLoadInProgress());

  /// The Prices DAO.
  final PricesDao pricesDao;

  @override
  Stream<PricesState> mapEventToState(
    PricesEvent event,
  ) async* {
    if (event is LoadPricesForProduct) {
      yield* _getPricesForProduct(event.product);
    }
  }

  Stream<PricesState> _getPricesForProduct(Product product) async* {
    final prices = await pricesDao.getAllForProduct(product);
    yield PricesLoadSuccess(prices);
  }
}
