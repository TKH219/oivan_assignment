import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oivan_assignment/components/sof_user_item_widget.dart';
import 'package:oivan_assignment/features/bookmarked_users/page/get_list_bookmarked_users_screen.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../components/custom_header_smart_refresher.dart';
import '../../sof_user_reputation/page/sof_user_reputation_screen.dart';
import '../controller/get_list_sof_users_controller.dart';

class GetListSofUsersScreen extends StatefulWidget {
  @override
  GetListSofUsersScreenState createState() => GetListSofUsersScreenState();
}

class GetListSofUsersScreenState extends State<GetListSofUsersScreen> {
  late GetListSofUsersController _controller;

  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _controller = Get.find<GetListSofUsersController>();
    _controller.getListSofUsers(showLoading: false);
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'List Stackoverflow Users',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: [
        _buildBookmarkedListButton(),
      ],
    );
  }

  Widget _buildBookmarkedListButton() {
    return IconButton(
      onPressed: () => Get.to(
        () => GetListBookmarkedUserScreen(),
      ),
      icon: Icon(
        Icons.bookmark_added_sharp,
        size: 24,
        color: Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: GetBuilder<GetListSofUsersController>(
        builder: (controller) {
          return SmartRefresher(
            controller: _refreshController,
            enablePullUp: _controller.hasMore,
            enablePullDown: false,
            onLoading: onLoading,
            header: const CustomHeaderSmartRefresher(),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              itemCount: _controller.listSofUsersDisplay.length,
              itemBuilder: (context, index) {
                return SofUserItemWidget(
                  model: _controller.listSofUsersDisplay[index],
                  onTap: () => Get.to(
                    () => SofUserReputationScreen(
                      _controller.listSofUsersDisplay[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> onLoading() async {
    await _controller.getListSofUsers(showLoading: false);
    _refreshController.loadComplete();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
