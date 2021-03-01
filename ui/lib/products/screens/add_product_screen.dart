import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanshop/constants/textLabels.dart';
import 'package:scanshop/products/bloc/products_bloc.dart';
import 'package:scanshop/repositories/id_generator.dart';
import 'package:scanshop_models/models.dart';

typedef OnSaveCallback = Function(Product product);

/// The Widget for adding new Products
class AddProductScreen extends StatefulWidget {
  /// Constructor
  AddProductScreen({
    Key key,
    @required this.isEditing,
    this.product,
  }) : super(key: key);

  /// indicates that the form is being edited
  final bool isEditing;

  /// The product to save
  final Product product;

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  bool get isEditing => widget.isEditing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(context), body: _body(context));
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Center(
              child: Text('Create Product',
                  style: Theme.of(context).textTheme.headline4)),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: 3,
          ),
          _form(context),
        ],
      ),
    );
  }

  Widget _form(BuildContext context) {
    return _AddProductForm(
      widthScale: .75,
      margin: const EdgeInsets.all(20),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: AppBarTitle(),
    );
  }
}

class _AddProductForm extends StatefulWidget {
  _AddProductForm(
      {Key key,
      @required this.widthScale,
      @required this.margin,
      @required this.onSave})
      : super(key: key);

  final double widthScale;
  final EdgeInsets margin;

  /// callback when a product is saved
  final OnSaveCallback onSave;

  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<_AddProductForm> {
  String _name;
  String _description;
  String _manufacturer;
  ProductCategory _category;

  double widthScale;
  EdgeInsets margin;

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    widthScale = widget.widthScale;
    margin = widget.margin;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _form(context);
  }

  Widget _form(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
                hintText: 'The name of the product', labelText: 'Name'),
            validator: (val) {
              return val.trim().isEmpty
                  ? 'Please enter a name for the product'
                  : null;
            },
            onSaved: (val) => _name = val,
          ),
          TextFormField(
            decoration: const InputDecoration(
                hintText: 'A brief description', labelText: 'Description'),
            onSaved: (val) => _description = val,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Manufacturer. E.g. Marie Sharpe, Western Diaries, etc',
              labelText: 'Manufacturer',
            ),
            onSaved: (val) => _manufacturer = val,
          ),
          _categoriesOptions(context),
          _saveButton(context),
        ],
      ),
    );
  }

  Widget _categoriesOptions(BuildContext context) {
    var items = productCategories.map((i) {
      return DropdownMenuItem(value: i, child: Text(i.name));
    }).toList();
    return DropdownButtonFormField(
      decoration: const InputDecoration(
          hintText: 'Select a category', labelText: 'Category'),
      items: items,
      onChanged: (ProductCategory val) {
        _category = val;
      },
      onSaved: (ProductCategory val) {
        _category = val;
      },
      validator: (val) {
        return val == null ? 'Please select a category for the product' : null;
      },
    );
  }

  Widget _saveButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            widthFactor: MediaQuery.of(context).size.width / 2,
            child: ElevatedButton(
              style: Theme.of(context).textButtonTheme.style,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  var id = context.read<IdGenerator>().id;
                  var product = Product(
                      id: id,
                      name: _name,
                      description: _description,
                      category: _category,
                      manufacturer: _manufacturer);
                  context.read<ProductsBloc>().add(AddProduct(product));
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            )));
  }
}
