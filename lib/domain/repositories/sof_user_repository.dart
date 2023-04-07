import 'package:dartz/dartz.dart';
import 'package:oivan_assignment/domain/model/models.dart';

import '../../core/failure.dart';
import '../../data/response/response.dart';

abstract class SofUserRepository {
  Future<Either<Failure, GetListSofUsersResponse>> onGetSofUsers({
    required int limit,
    required int page,
  });

  Future<Either<Failure, GetSofUserReputationResponse>> onGetSofUserDetail({
    required int limit,
    required int page,
    required int userId,
  });

  List<SofUserModel> onGetSofBookmarkedUsers();

  void setSofBookmarkedUsers({
    required List<SofUserModel> listUser,
  });
}
