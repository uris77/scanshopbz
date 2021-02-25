import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanshop/constants/textLabels.dart';
import 'package:scanshop/stores/bloc/stores_bloc.dart';
import 'package:scanshop/styles/text.dart';
import 'package:scanshop_models/models.dart';

import '../../routes.dart';

/// The Main Screen for displaying Stores
class StoresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(context), body: _StoresScreenBody());
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(title: AppBarTitle(), actions: [
      _addButtonAppBar(context),
    ]);
  }

  Widget _addButtonAppBar(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 20),
        child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.addStore);
            },
            child: const Icon(Icons.add, size: 50)));
  }
}

class _StoresScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoresBloc, StoresState>(builder: (context, state) {
      if (state is StoresLoadInProgress) {
        return const CircularProgressIndicator();
      } else if (state is StoresLoadSuccess) {
        return _StoresList(key: UniqueKey(), stores: state.stores);
      } else {
        return Container(child: const Text('ERROR'));
      }
    });
  }
}

class _StoresList extends StatelessWidget {
  const _StoresList({Key key, this.stores}) : super(key: key);

  final List<Store> stores;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: stores.length,
        itemBuilder: (BuildContext context, int index) {
          var store = stores[index];
          return Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: _StoreItem(key: UniqueKey(), item: store),
              ));
        });
  }
}

class _StoreItem extends StatelessWidget {
  const _StoreItem({Key key, this.item}) : super(key: key);

  final Store item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: ListTile(
        title: Text(item.name, style: TextStyles.title),
      ),
    );
  }
}

class _EmptyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Add a store', style: TextStyles.large),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: _AddStoreButton(
                key: UniqueKey(),
                onTap: () {},
              ),
            )
          ],
        ));
  }
}

class _AddStoreButton extends StatelessWidget {
  const _AddStoreButton({Key key, this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Theme.of(context).accentColor,
                borderRadius: const BorderRadius.all(Radius.circular(50))),
            child: const Icon(Icons.add, size: 50)));
  }
}
