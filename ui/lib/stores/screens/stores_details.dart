import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:scanshop/constants/textLabels.dart';
import 'package:scanshop/repositories/id_generator.dart';
import 'package:scanshop/routes.dart';
import 'package:scanshop/stores/bloc/stores_bloc.dart';
import 'package:scanshop_models/models.dart';

/// Displays the Stores Details.
class StoreDetailsScreen extends StatefulWidget {
  /// Constructor
  StoreDetailsScreen({Key key, @required this.store}) : super(key: key);

  /// The store we want to display
  final Store store;

  @override
  _StoreDetailsScreenState createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {
  Store _store;
  @override
  void initState() {
    _store = widget.store;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // context.read<StoresBloc>().add(LoadStores());
        return true;
      },
      child: Scaffold(
        appBar: _appBar(context),
        body: BlocConsumer<StoresBloc, StoresState>(listener: (context, state) {
          if (state is StoresSavingInProgress) {
            Scaffold.of(context).showSnackBar(const SnackBar(
              content: Text('updating store....'),
              duration: Duration(seconds: 1),
            ));
          }
          if (state is StoresSavedSuccessfully) {
            Scaffold.of(context).showSnackBar(const SnackBar(
              content: Text('store updated successfully...'),
              duration: Duration(seconds: 1),
            ));
          }
        }, builder: (context, state) {
          if (state is StoresLoadSuccess) {
            return _StoreDetails(store: widget.store);
          }
          if (state is StoresSavingInProgress) {
            return const CircularProgressIndicator();
          }
          if (state is StoresSavedSuccessfully) {
            return _StoreDetails(store: state.store);
          }
          return _StoreDetails(store: _store);
        }),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      // automaticallyImplyLeading: true,
      leading: IconButton(
        iconSize: 40,
        icon: const Icon(Icons.chevron_left),
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.stores, ModalRoute.withName(AppRoutes.home));
        },
      ),
      title: AppBarTitle(),
    );
  }
}

class _StoreDetails extends StatelessWidget {
  _StoreDetails({Key key, @required this.store}) : super(key: key);
  final Store store;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: const Color.fromARGB(200, 245, 245, 247),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 0,
                  child: Text(
                    store.name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                if (store.geoLocation != null)
                  Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                            '${store.address.street}, '
                            '${store.address.locality}',
                            style: Theme.of(context).textTheme.bodyText1),
                      )),
                RaisedButton(
                  child: const Text('Update Location'),
                  onPressed: () async {
                    var position = await _determinePosition();
                    var address = await (_getAddressFromLatLng(
                        context.read<IdGenerator>(), position));

                    var updatedStore = store.copyWith(
                        id: store.id,
                        geoLocation: GeoLocation(
                            lat: position.latitude, lon: position.longitude),
                        address: address);

                    var bloc = context.read<StoresBloc>();
                    bloc.add(UpdateStore(updatedStore));
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        ));
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, '
          '\nWe cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<Address> _getAddressFromLatLng(
      IdGenerator idGenerator, Position position) async {
    Address address;
    var p =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    if (p.isNotEmpty) {
      var place = p[0];

      address = Address(
        id: idGenerator.id,
        name: place.name,
        street: place.street,
        locality: place.locality,
        administrativeArea: place.administrativeArea,
        country: place.country,
      );
    }
    return address;
  }
}
