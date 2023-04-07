import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:oivan_assignment/core/failure.dart';
import 'package:oivan_assignment/data/response/response.dart';
import 'package:oivan_assignment/domain/model/models.dart';
import 'package:oivan_assignment/domain/use_cases/sof_user_use_case.dart';
import 'package:oivan_assignment/features/get_list_sof_users/controller/get_list_sof_users_controller.dart';
import 'package:oivan_assignment/features/sof_user_reputation/controller/sof_user_reputation_controller.dart';
import 'package:oivan_assignment/injection.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'sof_user_reputation_controller_test.mocks.dart';

@GenerateMocks([SofUserUseCase, SofUserModel])
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injection();
  MockSofUserUseCase mockUS = MockSofUserUseCase();
  final controller = SofUserReputationController(mockUS);
  final _mockUserModel = MockSofUserModel();

  test('Bookmark new user', () {
    when(mockUS.onGetSofBookmarkedUsers()).thenReturn([]);
    controller.bookmarkUser(_mockUserModel);
    expect(mockUS.onGetSofBookmarkedUsers(), [_mockUserModel]);
  });
}