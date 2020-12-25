part of '../messages.dart';

@JsonSerializable()
class Item {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'imageUrl')
  String imageUrl;
  @JsonKey(name: 'action')
  dynamic action;

  Item({this.type, this.imageUrl, this.action});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class QuickReply {
  @JsonKey(name: 'items')
  List<Item> items;

  QuickReply({this.items});

  factory QuickReply.fromJson(Map<String, dynamic> json) =>
      _$QuickReplyFromJson(json);

  Map<String, dynamic> toJson() => _$QuickReplyToJson(this);
}
