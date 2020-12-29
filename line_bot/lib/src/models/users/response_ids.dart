part of '../users.dart';

@JsonSerializable()
class UserIds {
  @JsonKey(name: 'userIds')
  List<String> userIds;
  @JsonKey(name: 'next')
  String next;

  UserIds({this.userIds, this.next});

  factory UserIds.fromJson(Map<String, dynamic> json) =>
      _$UserIdsFromJson(json);

  Map<String, dynamic> toJson() => _$UserIdsToJson(this);
}
