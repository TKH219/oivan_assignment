import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oivan_assignment/core/failure.dart';
import 'package:oivan_assignment/domain/model/models.dart';
import 'package:oivan_assignment/domain/use_cases/sof_user_use_case.dart';
import 'package:oivan_assignment/features/bookmarked_users/controller/get_list_bookmarked_user_controller.dart';
import 'package:oivan_assignment/injection.dart';
import 'get_list_bookmarked_user_controller_test.mocks.dart';

@GenerateMocks([SofUserUseCase, SofUserModel])

void main() {
  injection();
  MockSofUserUseCase mockUS = MockSofUserUseCase();
  final controller = GetListBookmarkedUserController(mockUS);
  final _mockUserModel = MockSofUserModel();

  test('Get bookmarked list should has data', () {
    when(mockUS.onGetSofBookmarkedUsers()).thenReturn([_mockUserModel]);
    controller.getListBookmarkedUsers();
    expect(controller.listBookmarkedUsersDisplay, [_mockUserModel]);
  });

  test('Get bookmarked list should has no data', () {
    when(mockUS.onGetSofBookmarkedUsers()).thenReturn([]);
    controller.getListBookmarkedUsers();
    expect(controller.listBookmarkedUsersDisplay, []);
  });

  test('Set bookmarked list success', () {
    mockUS.setSofBookmarkedUsers(listUser: [_mockUserModel]);
    when(mockUS.onGetSofBookmarkedUsers()).thenReturn([_mockUserModel]);
    controller.getListBookmarkedUsers();
    expect(controller.listBookmarkedUsersDisplay, [_mockUserModel]);
  });

  test('Set bookmarked list with empty list', () {
    mockUS.setSofBookmarkedUsers(listUser: []);
    when(mockUS.onGetSofBookmarkedUsers()).thenReturn([]);
    controller.getListBookmarkedUsers();
    expect(controller.listBookmarkedUsersDisplay, []);
  });

  test('Delete bookmarked list success', () {
    mockUS.setSofBookmarkedUsers(listUser: [_mockUserModel]);
    when(mockUS.onGetSofBookmarkedUsers()).thenReturn([_mockUserModel]);
    controller.getListBookmarkedUsers();
    controller.deleteBookmarkedUser(_mockUserModel);
    expect(controller.listBookmarkedUsersDisplay.length, 0);
  });
}