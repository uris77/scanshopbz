import 'package:flutter_bloc/flutter_bloc.dart';

/// A Bloc Observer to track changes in blocs
class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(Bloc bloc) {
    super.onCreate(bloc);
    print('onCreate -- cubit: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print('onError -- cubit: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(Bloc bloc) {
    super.onClose(bloc);
    print('onClose -- cubit: ${bloc.runtimeType}');
  }
}
