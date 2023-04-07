import 'package:oivan_assignment/data/entities/entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:oivan_assignment/data/response/base_response.dart';

part 'get_list_sof_users_response.g.dart';

@JsonSerializable()
class GetListSofUsersResponse extends BaseResponse {
  @JsonKey(name: 'items')
  List<SofUserEntity> items;

  GetListSofUsersResponse({
    required this.items,
  });

  factory GetListSofUsersResponse.fromJson(Map<String, dynamic> json) => _$GetListSofUsersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetListSofUsersResponseToJson(this);
}
