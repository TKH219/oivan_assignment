import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/remote/impl/sof_user_client_impl.dart';
import 'data/datasources/remote/sof_user_client.dart';
import 'data/repositories/sof_user_repository_impl.dart';
import 'domain/repositories/sof_user_repository.dart';
import 'domain/use_cases/impl/sof_user_use_case_impl.dart';
import 'domain/use_cases/sof_user_use_case.dart';
import 'features/bookmarked_users/controller/get_list_bookmarked_user_controller.dart';
import 'features/get_list_sof_users/controller/get_list_sof_users_controller.dart';
import 'features/sof_user_reputation/controller/sof_user_reputation_controller.dart';

final getIt = GetIt.instance;

void injection() {

  /// Controller
  Get.lazyPut(() => GetListSofUsersController(getIt()), fenix: true);
  Get.lazyPut(() => SofUserReputationController(getIt()), fenix: true);
  Get.lazyPut(() => GetListBookmarkedUserController(getIt()), fenix: true);

  /// Use case
  getIt.registerLazySingleton<SofUserUseCase>(() => SofUserUseCaseImpl(getIt()));

  /// Repository
  getIt.registerLazySingleton<SofUserRepository>(() => SofUserRepositoryImpl(getIt()));

  /// Client
  getIt.registerLazySingleton<SofUserClient>(() => SofUserClientImpl());
}
