import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:scanshop_api/api.dart';
import 'package:scanshop_models/models.dart';

part 'products_event.dart';
part 'products_state.dart';

/// The ProductsBloc. It is responsible for persisting a product and loading
/// products.
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  /// Constructor
  ProductsBloc({this.productsDao}) : super(ProductsLoadInProgress());

  /// The Products DAO.
  final Dao productsDao;

  /// The initial state
  ProductsState get initialState => ProductsLoadInProgress();

  @override
  Stream<ProductsState> mapEventToState(
    ProductsEvent event,
  ) async* {
    if (event is LoadProducts) {
      yield ProductsLoadInProgress();
      yield* _reloadProducts();
    } else if (event is AddProduct) {
      yield* _addProduct(event);
    }
  }

  Stream<ProductsState> _reloadProducts() async* {
    final products = await productsDao.getAllSortedByName() as List<Product>;
    yield ProductsLoadSuccess(products);
  }

  Stream<ProductsState> _addProduct(AddProduct event) async* {
    await productsDao.insert(event.product);
    yield* _reloadProducts();
  }
}
