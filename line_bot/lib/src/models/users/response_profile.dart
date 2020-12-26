part of '../users.dart';

@JsonSerializable()
class Profile {
  @JsonKey(name: 'displayName')
  String displayName;
  @JsonKey(name: 'userId')
  String userId;
  @JsonKey(name: 'language')
  String language;
  @JsonKey(name: 'pictureUrl')
  String pictureUrl;
  @JsonKey(name: 'statusMessage')
  String statusMessage;

  Profile(
      {this.displayName,
      this.userId,
      this.language,
      this.pictureUrl,
      this.statusMessage});

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
