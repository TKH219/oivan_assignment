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

  test('Get bookmarked list should throw exception', () {
    when(mockUS.onGetSofBookmarkedUsers()).thenThrow(GeneralFailure('General Failure'));
    controller.getListBookmarkedUsers();
    expect(controller.listBookmarkedUsersDisplay, throwsException);
  });
  // test('Current bookmarked list should be the same with local bookmarked list', () {
  //   final controller = Get.find<GetListBookmarkedUserController>();
  //   final _currentListUser = controller.listBookmarkedUsersDisplay;
  //   controller.setListBookmarkedUsers();
  //   controller.getListBookmarkedUsers();
  //   final _localListUser = controller.listBookmarkedUsersDisplay;
  //   expect(_currentListUser.length, _localListUser.length);
  // });
  //
  // test('Current bookmarked list should be the same with local bookmarked list', () {
  //   final controller = Get.find<GetListBookmarkedUserController>();
  //   final _currentListUser = controller.listBookmarkedUsersDisplay;
  //   controller.setListBookmarkedUsers();
  //   controller.getListBookmarkedUsers();
  //   final _localListUser = controller.listBookmarkedUsersDisplay;
  //   expect(_currentListUser.length, _localListUser.length);
  // });
  //
  // test("fetch() should return an instance of student on remoteDataSource's fetch success", () {
  //   //Arrange
  //   MockGetListBookmarkedUserController mockDS = MockGetListBookmarkedUserController();
  //   Repository repo = Repository(mockDS);
  //   when(mockDS.fetch()).thenReturn("Mock Result");
  //   //Act
  //   final result = repo.fetch();
  //   //Assert
  //   expect(result, isInstanceOf<Student>());
  // });
  //
  // test("fetch() should throw an exception on remoteDataSource's fetch throws any exception", () {
  //   MockRemoteDateSource mockDS = MockRemoteDateSource();
  //   Repository repo = Repository(mockDS);
  //   when(mockDS.fetch()).thenThrow(SocketException("Mock exception"));
  //   expect(() => repo.fetch(), throwsException);
  // });
}


// void getListBookmarkedUsers({bool showLoading = true}) {
//   final listData = sofUserUseCase.onGetSofBookmarkedUsers();
//   listBookmarkedUsersDisplay.clear();
//   listBookmarkedUsersDisplay.addAll(listData);
//   update();
// }
//
// void setListBookmarkedUsers() {
//   sofUserUseCase.setSofBookmarkedUsers(listUser: listBookmarkedUsersDisplay);
//   update();
// }
//
// void deleteBookmarkedUser(SofUserModel model) {
//   listBookmarkedUsersDisplay.remove(model);
//   update();
// }