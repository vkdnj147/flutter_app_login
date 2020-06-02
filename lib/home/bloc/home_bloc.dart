import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kicksonapp/authentication_bloc/authentication_bloc.dart';
import 'package:kicksonapp/models/search.dart';

import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthenticationBloc _authenticationBloc;

  HomeBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  HomeState get initialState => HomeState.empty();

  @override
  Stream<Transition<HomeEvent, HomeState>> transformEvents(
    Stream<HomeEvent> events,
    TransitionFunction<HomeEvent, HomeState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(
        Duration(milliseconds: 500),
      ),
      transitionFn,
    );
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is Loaded) {
//      print("======Loaded======== ${event.email} ::: ${event.password}");
      yield* _mapEmptyToState(event.search);
    }
  }

  Stream<HomeState> _mapEmptyToState(String search) async* {
    try {
      final search = new Search(id: 1, title: "HhHHHHHH");
//      print("======search======== ${search}");
      yield state.updateLoadedSuccess(search: search);
    } catch (e) {
      print("]-----] error [-----[ ${e}");
    }
  }
}
