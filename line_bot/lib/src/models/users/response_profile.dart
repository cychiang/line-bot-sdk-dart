part of '../profile.dart';

@JsonSerializable()
class Profile {
  @JsonKey(name: 'displayName')
  String displayName;
  @JsonKey(name: 'userId')
  String userId;
  @JsonKey(name: 'pictureUrl')
  String pictureUrl;
  @JsonKey(name: 'statusMessage')
  String statusMessage;

  Profile({this.displayName, this.userId, this.pictureUrl, this.statusMessage});

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
