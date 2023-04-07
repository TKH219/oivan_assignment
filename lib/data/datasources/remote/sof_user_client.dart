
import 'package:oivan_assignment/data/response/response.dart';

abstract class SofUserClient {
  Future<GetListSofUsersResponse> onGetSofUsers({
    required int limit,
    required int page,
  });

  Future<GetSofUserReputationResponse> onGetSofUserDetail({
    required int limit,
    required int page,
    required int userId,
  });
}
