import 'package:oivan_assignment/data/entities/entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:oivan_assignment/data/response/response.dart';

part 'get_sof_user_reputation_response.g.dart';

@JsonSerializable()
class GetSofUserReputationResponse extends BaseResponse {
  @JsonKey(name: 'items')
  List<SofUserReputationEntity> items;

  GetSofUserReputationResponse({
    required this.items,
  }) : super();

  factory GetSofUserReputationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSofUserReputationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSofUserReputationResponseToJson(this);
}
