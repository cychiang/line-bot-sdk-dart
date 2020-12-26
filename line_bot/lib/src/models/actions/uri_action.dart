part of '../actions.dart';

@JsonSerializable()
class AltUri {
  @JsonKey(
    name: 'desktop',
  )
  String desktop;
  AltUri({this.desktop});

  factory AltUri.fromJson(Map<String, dynamic> json) => _$AltUriFromJson(json);

  Map<String, dynamic> toJson() => _$AltUriToJson(this);
}

@JsonSerializable()
class UriAction {
  @JsonKey(name: 'type', defaultValue: 'uri')
  String type;
  @JsonKey(name: 'label')
  String label;
  @JsonKey(name: 'uri', required: true)
  String uri;
  @JsonKey(name: 'altUri')
  AltUri altUri;

  UriAction({this.type, this.label, this.uri, this.altUri});

  factory UriAction.fromJson(Map<String, dynamic> json) =>
      _$UriActionFromJson(json);

  Map<String, dynamic> toJson() => _$UriActionToJson(this);
}
