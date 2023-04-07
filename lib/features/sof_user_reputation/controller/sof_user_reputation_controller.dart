import 'package:get/get.dart';
import 'package:oivan_assignment/domain/use_cases/sof_user_use_case.dart';
import 'package:oivan_assignment/utils/utils.dart';

import '../../../domain/model/models.dart';
import '../../../utils/constants/constants.dart';

class SofUserReputationController extends GetxController {
  SofUserUseCase sofUserUseCase;

  SofUserReputationController(this.sofUserUseCase);

  RxList<SofUserReputationModel> listReputationDisplay = <SofUserReputationModel>[].obs;
  int currentPage = 1;

  bool hasMore = true;

  Future<void> getListReputation(int userId) async {
    final result = await sofUserUseCase.onGetSofUserDetail(
      limit: limitUser,
      page: currentPage,
      userId: userId,
    );

    result.fold((failure) {
      failure.handleError();
    }, (data) {
      final List<SofUserReputationModel> listData = data.items.map((element) => SofUserReputationModel.fromEntity(element)).toList();
      listReputationDisplay.addAll(listData);
      hasMore = data.hasMore ?? false;
      if (hasMore) {
        currentPage += 1;
      }

      update();
    });
  }

  void bookmarkUser(SofUserModel model) {
    final result = sofUserUseCase.onGetSofBookmarkedUsers();

    final userAdded = result.firstWhereOrNull((element) => element.userId == model.userId);
    if (userAdded != null) {
      showToastMessage('User already on bookmarked list');
    } else {
      result.add(model);
      sofUserUseCase.setSofBookmarkedUsers(listUser: result);
      showToastMessage('Bookmark success!');
    }
  }

  @override
  void dispose() {
    listReputationDisplay.close();
    super.dispose();
  }
}