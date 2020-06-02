import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class Search extends Equatable {
  final int id;
  final String title;
  final String content;

  const Search({this.id, this.title, this.content,
  });

  factory Search.fromJson(Map<String, dynamic> json) =>
      _$SearchFromJson(json);

  Map<String, dynamic> toJson() => _$SearchToJson(this);


  @override
  List<Object> get props => [id, title, content];

  @override
  String toString() => 'Shipping { id: $id }';
}
