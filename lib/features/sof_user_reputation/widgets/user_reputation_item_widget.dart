import 'package:flutter/material.dart';
import 'package:oivan_assignment/domain/model/models.dart';

import '../../../components/information_item_row.dart';

class UserReputationItemWidget extends StatelessWidget {
  final SofUserReputationModel model;

  UserReputationItemWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(4.0),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Column(
        children: [
          InformationItemRow('Reputation Type', model.reputationHistoryType),
          InformationItemRow('Change', model.reputationChange.toString()),
          InformationItemRow('Created At', model.creationDate.toString()),
          InformationItemRow('Post ID', model.postId.toString()),
        ],
      ),
    );
  }
}
