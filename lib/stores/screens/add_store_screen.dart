import 'package:flutter/material.dart';
import 'package:scanshop/constants/textLabels.dart';

/// Screen for creating a store
class AddStoreScreen extends StatefulWidget {
  @override
  _AddStoreScreenState createState() => _AddStoreScreenState();
}

class _AddStoreScreenState extends State<AddStoreScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
                child: Text('Create Store',
                    style: Theme.of(context).textTheme.headline4)),
            _form(context),
          ],
        ),
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(
                  hintText: 'Name of the Store', labelText: 'Name'),
              onSaved: (val) => _name = val,
            ),
            _saveButton(context),
          ],
        ));
  }

  Widget _saveButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          widthFactor: MediaQuery.of(context).size.width / 2,
          child: ElevatedButton(
            style: Theme.of(context).textButtonTheme.style,
            child: const Text('Save'),
            onPressed: () {
              print('saving store with name $_name');
            },
          ),
        ));
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: AppBarTitle(),
    );
  }
}
