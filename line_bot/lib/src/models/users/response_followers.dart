part of '../users.dart';

@JsonSerializable()
class Followers {
  @JsonKey(name: 'userIds')
  List<String> userIds;
  @JsonKey(name: 'next')
  String next;

  Followers({this.userIds, this.next});

  factory Followers.fromJson(Map<String, dynamic> json) =>
      _$FollowersFromJson(json);

  Map<String, dynamic> toJson() => _$FollowersToJson(this);
}
