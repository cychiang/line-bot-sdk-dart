part of '../group.dart';

@JsonSerializable()
class Count {
  @JsonKey(name: 'count')
  int count;

  Count({this.count});

  factory Count.fromJson(Map<String, dynamic> json) => _$CountFromJson(json);

  Map<String, dynamic> toJson() => _$CountToJson(this);
}
