import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oivan_assignment/domain/model/models.dart';
import 'package:oivan_assignment/features/sof_user_reputation/controller/sof_user_reputation_controller.dart';
import 'package:oivan_assignment/features/sof_user_reputation/widgets/user_reputation_item_widget.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../components/custom_header_smart_refresher.dart';

class SofUserReputationScreen extends StatefulWidget {
  final SofUserModel userModel;

  SofUserReputationScreen(this.userModel);

  @override
  SofUserReputationScreenState createState() => SofUserReputationScreenState();
}

class SofUserReputationScreenState extends State<SofUserReputationScreen> {
  late SofUserReputationController _controller;

  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _controller = Get.find<SofUserReputationController>();
    _controller.getListReputation(widget.userModel.userId);
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
        onPressed: Get.back,
      ),
      actions: [
        _buildBookmarkButton(),
      ],
      title: const Text(
        'List Reputation Users',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildBookmarkButton() {
    return IconButton(
      onPressed: () => _controller.bookmarkUser(widget.userModel),
      icon: Icon(
        Icons.bookmark_add,
        color: Colors.lightBlue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: GetBuilder<SofUserReputationController>(
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
              itemCount: _controller.listReputationDisplay.length,
              itemBuilder: (context, index) {
                return UserReputationItemWidget(
                  _controller.listReputationDisplay[index],
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> onLoading() async {
    await _controller.getListReputation(widget.userModel.userId);
    _refreshController.loadComplete();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
