import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:oivan_assignment/data/datasources/local/storage_manager.dart';
import '../../core/failure.dart';
import '../../domain/model/models.dart';
import '../../domain/repositories/sof_user_repository.dart';
import '../datasources/remote/sof_user_client.dart';
import '../response/response.dart';

class SofUserRepositoryImpl extends SofUserRepository {
  SofUserClient sofUserClient;

  SofUserRepositoryImpl(this.sofUserClient);

  @override
  Future<Either<Failure, GetListSofUsersResponse>> onGetSofUsers({
    required int limit,
    required int page,
  }) async {
    try {
      final GetListSofUsersResponse response = await sofUserClient.onGetSofUsers(
        limit: limit,
        page: page,
      );

      return Right(response);
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error));
      } else {
        return Left(GeneralFailure(error));
      }
    }
  }

  @override
  Future<Either<Failure, GetSofUserReputationResponse>> onGetSofUserDetail({
    required int limit,
    required int page,
    required int userId,
  }) async {
    try {
      final GetSofUserReputationResponse response = await sofUserClient.onGetSofUserDetail(
        userId: userId,
        limit: limit,
        page: page,
      );

      return Right(response);
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error));
      } else {
        return Left(GeneralFailure(error));
      }
    }
  }

  @override
  List<SofUserModel> onGetSofBookmarkedUsers() {
    try {
      final List<SofUserModel>? listUser = StorageManager.instance.getSofBookmarkedUsers;
      return listUser ?? [];
    } catch (error) {
      throw GeneralFailure(error);
    }
  }

  @override
  void setSofBookmarkedUsers({required List<SofUserModel> listUser}) {
    try {
      StorageManager.instance.setSofBookmarkedUsers(listUser);
    } catch (error) {
      throw GeneralFailure(error);
    }
  }
}
