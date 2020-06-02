
import 'package:kicksonapp/models/search.dart';
import 'package:meta/meta.dart';

@immutable
class HomeState {
  final bool isLoaded;
  final bool isLoading;
  final Search search;

  HomeState({
    @required this.isLoaded,
    @required this.isLoading,
    @required this.search,
  });

  factory HomeState.empty() {
    return HomeState(
      isLoaded: false,
      isLoading: false,
      search: null,
    );
  }

  HomeState updateLoadedSuccess({
    Search search,
  }) {
    return copyWith(search: search, isLoaded: true);
  }

  HomeState copyWith({
    bool isLoaded,
    bool isLoading,
    Search search,
  }) {
    return HomeState(
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      search: search ?? this.search,
    );
  }
}
