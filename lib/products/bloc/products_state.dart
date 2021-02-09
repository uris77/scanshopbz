part of 'products_bloc.dart';

@immutable
abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsLoadInProgress extends ProductsState {}

class ProductsLoadSuccess extends ProductsState {
  final List<Product> products;

  const ProductsLoadSuccess([this.products = const []]);

  @override
  List<Object> get props => [products];
}

class ProductsLoadFailure extends ProductsState {}
