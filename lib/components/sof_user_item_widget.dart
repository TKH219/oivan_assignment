import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:oivan_assignment/domain/model/models.dart';

import 'information_item_row.dart';
import 'loading_circle.dart';

class SofUserItemWidget extends StatelessWidget {
  final SofUserModel model;
  final Function()? onTap;
  final bool isShowRemoveButton;
  final Function()? onRemove;

  const SofUserItemWidget({
    required this.model,
    this.isShowRemoveButton = false,
    this.onRemove,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 2),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Row(
          children: [
            _buildAvatarWidget(),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: _buildInfoWidget(),
            ),
            _buildRemoveButton(),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: CachedNetworkImage(
        imageUrl: model.profileImage,
        height: 60,
        width: 60,
        progressIndicatorBuilder: (context, url, downloadProgress) => LoadingCircle(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }

  Widget _buildInfoWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InformationItemRow('User Name', model.displayName),
        InformationItemRow('Location', model.location),
        InformationItemRow('Reputation', model.reputation.toString()),
        InformationItemRow('User Age', model.age?.toString()),
      ],
    );
  }

  Widget _buildRemoveButton() {
    if (!isShowRemoveButton) return const SizedBox.shrink();
    return IconButton(
      onPressed: onRemove,
      icon: Icon(
        Icons.delete_outlined,
        color: Colors.red,
        size: 32,
      ),
    );
  }
}
