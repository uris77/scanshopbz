import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:scanshop/constants/textLabels.dart';
import 'package:scanshop/stores/bloc/stores_bloc.dart';
import 'package:scanshop_models/models.dart';

/// Displays the Stores Details.
class StoreDetailsScreen extends StatelessWidget {
  /// Constructor
  StoreDetailsScreen({Key key, @required this.store}) : super(key: key);

  /// The store we want to display
  final Store store;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<StoresBloc>().add(LoadStores());
        return true;
      },
      child: Scaffold(
        appBar: _appBar(context),
        body: BlocListener<StoresBloc, StoresState>(
            listener: (context, state) {
              if (state is StoresSavingInProgress) {
                Scaffold.of(context).showSnackBar(
                    const SnackBar(content: Text('updating store....')));
              }
            },
            child: _StoreDetails(store: store)),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: AppBarTitle(),
    );
  }
}

class _StoreDetails extends StatefulWidget {
  _StoreDetails({Key key, @required this.store}) : super(key: key);
  final Store store;

  @override
  __StoreDetailsState createState() => __StoreDetailsState();
}

class __StoreDetailsState extends State<_StoreDetails> {
  Store store;

  @override
  void initState() {
    store = widget.store;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: const Color.fromARGB(200, 245, 245, 247),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Card(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    store.name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                if (store.geoLocation != null)
                  Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Text('Lat: ${store.geoLocation?.lat}'),
                        ],
                      )),
                RaisedButton(
                  child: const Text('Get Location'),
                  onPressed: () async {
                    var position = await _determinePosition();
                    await (_getAddressFromLatLng(position));

                    setState(() {
                      store = store.copyWith(
                          geoLocation: GeoLocation(
                              lat: position.latitude, lon: position.longitude));
                    });
                    var bloc = context.read<StoresBloc>();
                    bloc.add(UpdateStore(store));
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

  Future<void> _getAddressFromLatLng(Position position) async {
    try {
      var p =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (p.isNotEmpty) {
        var place = p[0];

        print('${place.locality}, ${place.postalCode}, ${place.country}');
      }
    } catch (e) {
      print(e);
    }
  }
}
