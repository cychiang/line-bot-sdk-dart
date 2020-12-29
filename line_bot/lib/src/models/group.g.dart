// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupSummary _$GroupSummaryFromJson(Map<String, dynamic> json) {
  return GroupSummary(
    groupId: json['groupId'] as String,
    groupName: json['groupName'] as String,
    pictureUrl: json['pictureUrl'] as String,
  );
}

Map<String, dynamic> _$GroupSummaryToJson(GroupSummary instance) =>
    <String, dynamic>{
      'groupId': instance.groupId,
      'groupName': instance.groupName,
      'pictureUrl': instance.pictureUrl,
    };

Count _$CountFromJson(Map<String, dynamic> json) {
  return Count(
    count: json['count'] as int,
  );
}

Map<String, dynamic> _$CountToJson(Count instance) => <String, dynamic>{
      'count': instance.count,
    };
