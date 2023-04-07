import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oivan_assignment/features/bookmarked_users/controller/get_list_bookmarked_user_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../components/custom_header_smart_refresher.dart';
import '../../../components/sof_user_item_widget.dart';

class GetListBookmarkedUserScreen extends StatefulWidget {
  @override
  GetListBookmarkedUserScreenState createState() => GetListBookmarkedUserScreenState();
}

class GetListBookmarkedUserScreenState extends State<GetListBookmarkedUserScreen> {
  late GetListBookmarkedUserController _controller;

  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _controller = Get.find<GetListBookmarkedUserController>();
    _controller.getListBookmarkedUsers(showLoading: false);
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
        onPressed: () {
          _controller.setListBookmarkedUsers();
          Get.back();
        },
      ),
      title: const Text(
        'Bookmarked Users',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: buildAppBar(),
        backgroundColor: Colors.white,
        body: GetBuilder<GetListBookmarkedUserController>(
          builder: (controller) {
            return SmartRefresher(
              controller: _refreshController,
              enablePullUp: false,
              enablePullDown: false,
              header: const CustomHeaderSmartRefresher(),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                itemCount: _controller.listBookmarkedUsersDisplay.length,
                itemBuilder: (context, index) {
                  return SofUserItemWidget(
                    model: _controller.listBookmarkedUsersDisplay[index],
                    isShowRemoveButton: true,
                    onRemove: () => _controller.deleteBookmarkedUser(_controller.listBookmarkedUsersDisplay[index]),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
