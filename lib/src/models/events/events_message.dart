part of 'webhook_event.dart';

@JsonSerializable()
class Emojis {
  @JsonKey(name: 'index')
  int index;
  @JsonKey(name: 'productId')
  String productId;
  @JsonKey(name: 'emojiId')
  String emojiId;

  Emojis({this.index, this.productId, this.emojiId});
  factory Emojis.fromJson(Map<String, dynamic> json) => _$EmojisFromJson(json);

  Map<String, dynamic> toJson() => _$EmojisToJson(this);
}

@JsonSerializable()
class TextMessage {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'text')
  String text;
  @JsonKey(name: 'emojis', includeIfNull: false)
  List<Emojis> emojis;

  TextMessage({this.id, this.type, this.text, this.emojis});
  factory TextMessage.fromJson(Map<String, dynamic> json) =>
      _$TextMessageFromJson(json);

  Map<String, dynamic> toJson() => _$TextMessageToJson(this);
}

@JsonSerializable()
class ContentProvider {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'originalContentUrl')
  String originalContentUrl;
  @JsonKey(name: 'previewImageUrl')
  String previewImageUrl;

  ContentProvider({this.type, this.originalContentUrl, this.previewImageUrl});
  factory ContentProvider.fromJson(Map<String, dynamic> json) =>
      _$ContentProviderFromJson(json);

  Map<String, dynamic> toJson() => _$ContentProviderToJson(this);
}

@JsonSerializable()
class ImageMessage {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'contentProvider')
  ContentProvider contentProvider;

  ImageMessage({this.id, this.type, this.contentProvider});
  factory ImageMessage.fromJson(Map<String, dynamic> json) =>
      _$ImageMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageMessageToJson(this);
}

@JsonSerializable()
class VideoMessage {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'duration')
  int duration;
  @JsonKey(name: 'contentProvider')
  ContentProvider contentProvider;

  VideoMessage({this.id, this.type, this.duration, this.contentProvider});
  factory VideoMessage.fromJson(Map<String, dynamic> json) =>
      _$VideoMessageFromJson(json);

  Map<String, dynamic> toJson() => _$VideoMessageToJson(this);
}

@JsonSerializable()
class AudioMessage {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'duration')
  int duration;
  @JsonKey(name: 'contentProvider')
  ContentProvider contentProvider;

  AudioMessage({this.id, this.type, this.duration, this.contentProvider});
  factory AudioMessage.fromJson(Map<String, dynamic> json) =>
      _$AudioMessageFromJson(json);

  Map<String, dynamic> toJson() => _$AudioMessageToJson(this);
}

@JsonSerializable()
class FileMessage {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'fileName')
  String fileName;
  @JsonKey(name: 'fileSize')
  int fileSize;

  FileMessage({this.id, this.type, this.fileName, this.fileSize});
  factory FileMessage.fromJson(Map<String, dynamic> json) =>
      _$FileMessageFromJson(json);

  Map<String, dynamic> toJson() => _$FileMessageToJson(this);
}

@JsonSerializable()
class LocationMessage {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'address')
  String address;
  @JsonKey(name: 'latitude')
  double latitude;
  @JsonKey(name: 'longitude')
  double longitude;

  LocationMessage(
      {this.id,
      this.type,
      this.title,
      this.address,
      this.latitude,
      this.longitude});
  factory LocationMessage.fromJson(Map<String, dynamic> json) =>
      _$LocationMessageFromJson(json);

  Map<String, dynamic> toJson() => _$LocationMessageToJson(this);
}

@JsonSerializable()
class StickerMessage {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'packageId')
  String packageId;
  @JsonKey(name: 'stickerId')
  String stickerId;
  @JsonKey(name: 'stickerResourceType')
  String stickerResourceType;
  @JsonKey(name: 'keywords')
  List<String> keywords;

  StickerMessage(
      {this.id,
      this.type,
      this.packageId,
      this.stickerId,
      this.stickerResourceType,
      this.keywords});
  factory StickerMessage.fromJson(Map<String, dynamic> json) =>
      _$StickerMessageFromJson(json);

  Map<String, dynamic> toJson() => _$StickerMessageToJson(this);
}
