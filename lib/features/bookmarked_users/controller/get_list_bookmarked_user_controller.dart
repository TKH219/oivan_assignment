import 'package:get/get.dart';
import 'package:oivan_assignment/domain/use_cases/sof_user_use_case.dart';
import 'package:oivan_assignment/utils/utils.dart';

import '../../../domain/model/models.dart';
import '../../../utils/constants/constants.dart';

class GetListBookmarkedUserController extends GetxController {
  SofUserUseCase sofUserUseCase;

  GetListBookmarkedUserController(this.sofUserUseCase);

  RxList<SofUserModel> listBookmarkedUsersDisplay = <SofUserModel>[].obs;

  void getListBookmarkedUsers({bool showLoading = true}) {
    final listData = sofUserUseCase.onGetSofBookmarkedUsers();
    listBookmarkedUsersDisplay.clear();
    listBookmarkedUsersDisplay.addAll(listData);
    update();
  }

  void setListBookmarkedUsers() {
    sofUserUseCase.setSofBookmarkedUsers(listUser: listBookmarkedUsersDisplay);
    update();
  }

  void deleteBookmarkedUser(SofUserModel model) {
    listBookmarkedUsersDisplay.remove(model);
    update();
  }

  @override
  void dispose() {
    listBookmarkedUsersDisplay.close();
    super.dispose();
  }
}
