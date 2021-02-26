import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanshop/constants/textLabels.dart';
import 'package:scanshop/stores/bloc/stores_bloc.dart';
import 'package:scanshop_models/models.dart';

/// Screen for creating a store
class AddStoreScreen extends StatefulWidget {
  @override
  _AddStoreScreenState createState() => _AddStoreScreenState();
}

class _AddStoreScreenState extends State<AddStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<StoresBloc, StoresState>(
          builder: (context, state) {
            if (state is StoresSavingInProgress) {
              return const CircularProgressIndicator();
            }
            if (state is StoreFailedToSave) {
              return _form(context, 'Error while saving!');
            }

            if (state is StoresSavedSuccessfully) {
              return Container(child: const Text('Successfully Saved!'));
            }

            return _form(context, null);
          },
        ),
      ),
    );
  }

  Widget _form(BuildContext context, String errorMessage) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Center(
              child: Text('Create Store',
                  style: Theme.of(context).textTheme.headline4)),
        ),
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 0.0, left: 12.0, right: 12.0, bottom: 0.0),
              child: _AddStoreForm(),
            )),
        if (errorMessage != null)
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, left: 20, right: 20, bottom: 20),
              child: Center(
                  child: Card(
                      color: const Color(0x88EEEAE6),
                      child: (Center(
                          child: Text(errorMessage,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(color: Colors.red)))))),
            ),
          )
      ],
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: AppBarTitle(),
    );
  }
}

class _AddStoreForm extends StatefulWidget {
  @override
  _AddStoreFormState createState() => _AddStoreFormState();
}

class _AddStoreFormState extends State<_AddStoreForm> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name;

  @override
  Widget build(BuildContext context) {
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
              var store = Store(name: _name);
              context.read<StoresBloc>().add(AddStore(store));
            },
          ),
        ));
  }
}
