part of 'webhook_event.dart';

@JsonSerializable()
class SourceUser {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'userId')
  String userId;

  SourceUser({this.type, this.userId});
  factory SourceUser.fromJson(Map<String, dynamic> json) =>
      _$SourceUserFromJson(json);

  Map<String, dynamic> toJson() => _$SourceUserToJson(this);
}

@JsonSerializable()
class SourceGroup {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'groupId')
  String groupId;
  @JsonKey(name: 'userId')
  String userId;

  SourceGroup({this.type, this.groupId, this.userId});
  factory SourceGroup.fromJson(Map<String, dynamic> json) =>
      _$SourceGroupFromJson(json);

  Map<String, dynamic> toJson() => _$SourceGroupToJson(this);
}

@JsonSerializable()
class SourceRoom {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'roomId')
  String roomId;
  @JsonKey(name: 'userId')
  String userId;

  SourceRoom({this.type, this.roomId, this.userId});
  factory SourceRoom.fromJson(Map<String, dynamic> json) =>
      _$SourceRoomFromJson(json);

  Map<String, dynamic> toJson() => _$SourceRoomToJson(this);
}
