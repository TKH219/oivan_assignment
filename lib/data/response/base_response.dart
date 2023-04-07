
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse extends Object {
  @JsonKey(name: 'has_more')
  bool? hasMore;
  @JsonKey(name: 'quota_max')
  int? quotaMax;
  @JsonKey(name: 'quota_remaining')
  int? quotaRemaining;

  BaseResponse({
    this.hasMore,
    this.quotaMax,
    this.quotaRemaining,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

}