import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:scanshop_api/api.dart';
import 'package:scanshop_models/models.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final Dao productsDao;
  ProductsBloc({this.productsDao}) : super(ProductsLoadInProgress());

  ProductsState get initialState => ProductsLoadInProgress();

  @override
  Stream<ProductsState> mapEventToState(
    ProductsEvent event,
  ) async* {
    if (event is LoadProducts) {
      yield ProductsLoadInProgress();
      yield* _reloadProducts();
    }
  }

  Stream<ProductsState> _reloadProducts() async* {
    final products = await productsDao.getAllSortedByName();
    print('products: $products');
    yield ProductsLoadSuccess(products);
  }
}
