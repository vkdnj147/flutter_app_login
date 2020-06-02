import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class Loaded extends HomeEvent {
  final String search;

  const Loaded({
    @required this.search,
  });

  @override
  List<Object> get props => [search];

  @override
  String toString() => 'HomesLoadedWithSearch';
}
