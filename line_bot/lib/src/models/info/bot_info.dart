part of '../info.dart';

@JsonSerializable()
class BotInfo {
  @JsonKey(name: 'userId')
  String userId;
  @JsonKey(name: 'basicId')
  String basicId;
  @JsonKey(name: 'premiumId')
  String premiumId;
  @JsonKey(name: 'displayName')
  String displayName;
  @JsonKey(name: 'pictureUrl')
  String pictureUrl;
  @JsonKey(name: 'chatMode')
  String chatMode;
  @JsonKey(name: 'markAsReadMode')
  String markAsReadMode;

  BotInfo(
      {this.userId,
      this.basicId,
      this.premiumId,
      this.displayName,
      this.pictureUrl,
      this.chatMode,
      this.markAsReadMode});

  factory BotInfo.fromJson(Map<String, dynamic> json) =>
      _$BotInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BotInfoToJson(this);
}
