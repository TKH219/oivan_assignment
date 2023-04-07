import 'package:oivan_assignment/core/base_client.dart';
import '../../../response/response.dart';
import '../sof_user_client.dart';

class SofUserClientImpl extends BaseClient implements SofUserClient {
  @override
  Future<GetListSofUsersResponse> onGetSofUsers({
    required int limit,
    required int page,
  }) async {
    final response = await get(
      "/2.2/users?",
      params: {
        'pagesize': limit,
        'page': page,
        'site': 'stackoverflow',
      },
    );

    return GetListSofUsersResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<GetSofUserReputationResponse> onGetSofUserDetail({
    required int limit,
    required int page,
    required int userId,
  }) async {
    final response = await get(
      "/2.2/users/$userId/reputation-history?",
      params: {
        'pagesize': limit,
        'page': page,
        'site': 'stackoverflow',
      },
    );

    return GetSofUserReputationResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
