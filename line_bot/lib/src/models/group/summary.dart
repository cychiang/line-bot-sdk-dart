part of '../group.dart';

@JsonSerializable()
class GroupSummary {
  @JsonKey(name: 'groupId')
  String groupId;
  @JsonKey(name: 'groupName')
  String groupName;
  @JsonKey(name: 'pictureUrl')
  String pictureUrl;

  GroupSummary({this.groupId, this.groupName, this.pictureUrl});

  factory GroupSummary.fromJson(Map<String, dynamic> json) =>
      _$GroupSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$GroupSummaryToJson(this);
}
