// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CameraAction _$CameraActionFromJson(Map<String, dynamic> json) {
  return CameraAction(
    type: json['type'] as String,
    label: json['label'] as String,
  );
}

Map<String, dynamic> _$CameraActionToJson(CameraAction instance) =>
    <String, dynamic>{
      'type': instance.type,
      'label': instance.label,
    };

CameraRollAction _$CameraRollActionFromJson(Map<String, dynamic> json) {
  return CameraRollAction(
    type: json['type'] as String,
    label: json['label'] as String,
  );
}

Map<String, dynamic> _$CameraRollActionToJson(CameraRollAction instance) =>
    <String, dynamic>{
      'type': instance.type,
      'label': instance.label,
    };

DatetimePickerAction _$DatetimePickerActionFromJson(Map<String, dynamic> json) {
  return DatetimePickerAction(
    type: json['type'] as String,
    label: json['label'] as String,
    data: json['data'] as String,
    mode: json['mode'] as String,
    initial: json['initial'] as String,
    max: json['max'] as String,
    min: json['min'] as String,
  );
}

Map<String, dynamic> _$DatetimePickerActionToJson(
        DatetimePickerAction instance) =>
    <String, dynamic>{
      'type': instance.type,
      'label': instance.label,
      'data': instance.data,
      'mode': instance.mode,
      'initial': instance.initial,
      'max': instance.max,
      'min': instance.min,
    };

LocationAction _$LocationActionFromJson(Map<String, dynamic> json) {
  return LocationAction(
    type: json['type'] as String,
    label: json['label'] as String,
  );
}

Map<String, dynamic> _$LocationActionToJson(LocationAction instance) =>
    <String, dynamic>{
      'type': instance.type,
      'label': instance.label,
    };

MessageAction _$MessageActionFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['type', 'text']);
  return MessageAction(
    type: json['type'] as String ?? 'message',
    label: json['label'] as String,
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$MessageActionToJson(MessageAction instance) =>
    <String, dynamic>{
      'type': instance.type,
      'label': instance.label,
      'text': instance.text,
    };

PostbackAction _$PostbackActionFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['type', 'data']);
  return PostbackAction(
    type: json['type'] as String ?? 'postback',
    label: json['label'] as String,
    data: json['data'] as String,
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$PostbackActionToJson(PostbackAction instance) =>
    <String, dynamic>{
      'type': instance.type,
      'label': instance.label,
      'data': instance.data,
      'text': instance.text,
    };

AltUri _$AltUriFromJson(Map<String, dynamic> json) {
  return AltUri(
    desktop: json['desktop'] as String,
  );
}

Map<String, dynamic> _$AltUriToJson(AltUri instance) => <String, dynamic>{
      'desktop': instance.desktop,
    };

UriAction _$UriActionFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['type', 'uri']);
  return UriAction(
    type: json['type'] as String ?? 'uri',
    label: json['label'] as String,
    uri: json['uri'] as String,
    altUri: json['altUri'] == null
        ? null
        : AltUri.fromJson(json['altUri'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UriActionToJson(UriAction instance) => <String, dynamic>{
      'type': instance.type,
      'label': instance.label,
      'uri': instance.uri,
      'altUri': instance.altUri,
    };
