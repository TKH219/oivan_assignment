import 'package:dartz/dartz.dart';
import 'package:oivan_assignment/domain/model/sof_user/sof_user_model.dart';

import '../../../core/failure.dart';
import '../../../data/response/response.dart';
import '../../repositories/sof_user_repository.dart';
import '../sof_user_use_case.dart';

class SofUserUseCaseImpl implements SofUserUseCase {
  SofUserRepository sofUserRepository;

  SofUserUseCaseImpl(this.sofUserRepository);

  @override
  Future<Either<Failure, GetListSofUsersResponse>> onGetSofUsers({
    required int limit,
    required int page,
  }) async {
    final result = await sofUserRepository.onGetSofUsers(
      page: page,
      limit: limit,
    );
    return result;
  }

  @override
  Future<Either<Failure, GetSofUserReputationResponse>> onGetSofUserDetail({
    required int limit,
    required int page,
    required int userId,
  }) async {
    final result = await sofUserRepository.onGetSofUserDetail(
      userId: userId,
      page: page,
      limit: limit,
    );

    return result;
  }

  @override
  List<SofUserModel> onGetSofBookmarkedUsers() {
    final result = sofUserRepository.onGetSofBookmarkedUsers();
    return result;
  }

  @override
  void setSofBookmarkedUsers({required List<SofUserModel>listUser}) {
    sofUserRepository.setSofBookmarkedUsers(listUser: listUser);
  }
}
