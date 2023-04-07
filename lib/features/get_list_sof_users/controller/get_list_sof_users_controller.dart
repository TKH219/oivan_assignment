import 'package:get/get.dart';
import 'package:oivan_assignment/domain/use_cases/sof_user_use_case.dart';
import 'package:oivan_assignment/utils/utils.dart';

import '../../../domain/model/models.dart';
import '../../../utils/constants/constants.dart';

class GetListSofUsersController extends GetxController {
  SofUserUseCase sofUserUseCase;

  GetListSofUsersController(this.sofUserUseCase);

  RxList<SofUserModel> listSofUsersDisplay = <SofUserModel>[].obs;

  int currentPage = 1;

  bool hasMore = true;

  Future<void> getListSofUsers({bool showLoading = true}) async {
    final result = await sofUserUseCase.onGetSofUsers(
      limit: limitUser,
      page: currentPage,
    );

    result.fold((failure) {
      failure.handleError();
    }, (data) {
      final List<SofUserModel> listData = data.items.map((element) => SofUserModel.fromEntity(element)).toList();
      listSofUsersDisplay.addAll(listData);
      hasMore = data.hasMore ?? false;
      if (hasMore) {
        currentPage += 1;
      }

      update();
    });
  }

  @override
  void dispose() {
    listSofUsersDisplay.close();
    super.dispose();
  }
}
