import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:oivan_assignment/core/failure.dart';
import 'package:oivan_assignment/data/response/response.dart';
import 'package:oivan_assignment/domain/model/models.dart';
import 'package:oivan_assignment/domain/use_cases/sof_user_use_case.dart';
import 'package:oivan_assignment/features/get_list_sof_users/controller/get_list_sof_users_controller.dart';
import 'package:oivan_assignment/injection.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_list_sof_users_test.mocks.dart';

@GenerateMocks([SofUserUseCase, SofUserModel, GetListSofUsersResponse])
void main() {
  injection();
  MockSofUserUseCase mockUS = MockSofUserUseCase();
  final controller = GetListSofUsersController(mockUS);
  final _mockUserModel = MockSofUserModel();
  final _response = MockGetListSofUsersResponse();

  test('Get list sof users should has data', () async {
    final Either<Failure, List<Product>> result = await repository.getProducts();
    when(mockUS.onGetSofUsers(limit: 10, page: 1)).thenReturn(Right(_response));
    controller.getListSofUsers();
    expect(controller.listSofUsersDisplay, [_mockUserModel]);
  });

  test('Get bookmarked list should has no data', () {
    when(mockUS.onGetSofBookmarkedUsers()).thenReturn([]);
    controller.getListSofUsers();
    expect(controller.listSofUsersDisplay, []);
  });

  // test('Get bookmarked list should throw exception', () {
  //   when(mockUS.onGetSofBookmarkedUsers()).thenThrow(GeneralFailure('General Failure'));
  //   controller.getListSofUsers();
  //   expect(controller.listSofUsersDisplay, throwsException);
  // });
}