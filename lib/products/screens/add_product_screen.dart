import 'package:flutter/material.dart';
import 'package:scanshop/styles/text.dart';
import 'package:scanshop_models/models.dart';

typedef OnSaveCallback = Function(Product product);

class AddProductScreen extends StatefulWidget {
  final bool isEditing;
  final OnSaveCallback onSave;
  final Product product;

  AddProductScreen({
    Key key,
    @required this.onSave,
    @required this.isEditing,
    this.product,
  }) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name;
  String _description;
  String _manufacturer;
  ProductCategory _category;

  bool get isEditing => widget.isEditing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(context), body: _body(context));
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'The name of the product', labelText: 'Name'),
              validator: (val) {
                return val.trim().isEmpty
                    ? 'Please enter a name for the product'
                    : null;
              },
              onSaved: (val) => _name = val,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'A brief description', labelText: 'Description'),
              onSaved: (val) => _description = val,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText:
                    'Manufacturer. E.g. Marie Sharpe, Western Diaries, etc',
                labelText: 'Manufacturer',
              ),
              onSaved: (val) => _manufacturer = val,
            ),
            _categoriesOptions(context),
            _saveButton(context),
          ],
        ),
      ),
    );
  }

  Widget _categoriesOptions(BuildContext context) {
    var items = productCategories.map((i) {
      return DropdownMenuItem(value: i, child: Text(i.name));
    }).toList();
    return DropdownButtonFormField(
      decoration:
          InputDecoration(hintText: 'Select a category', labelText: 'Category'),
      items: items,
      onChanged: (ProductCategory val) {
        print('category selected: $val');
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
        padding: EdgeInsets.all(20),
        child: Center(
            widthFactor: MediaQuery.of(context).size.width / 2,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  Product product = Product(
                      name: _name,
                      description: _description,
                      category: _category,
                      manufacturer: _manufacturer);
                  widget.onSave(product);
                  Navigator.pop(context);
                }
              },
              child: Text('Save', style: TextStyles.largeButton),
            )));
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      title: Text('Add Product'),
    );
  }
}
