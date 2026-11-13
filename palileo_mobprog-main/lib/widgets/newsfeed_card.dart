import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import 'custom_text.dart';

class NewsFeedCard extends StatelessWidget {
  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numOfLikes = 0,
    this.hasImage = false,
    this.imageUrl,
    this.avatarUrl,
  });

  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final bool hasImage;
  final String? imageUrl;
  final String? avatarUrl;

  String get _userInitials {
    final names = userName
        .trim()
        .split(RegExp(r'\s+'))
        .where((name) => name.isNotEmpty)
        .toList();

    if (names.isEmpty) return '?';
    if (names.length == 1) return names.first[0].toUpperCase();
    return '${names.first[0]}${names.last[0]}'.toUpperCase();
  }

  Widget _buildAvatarFallback() {
    return Text(
      _userInitials,
      style: TextStyle(
        color: Colors.white,
        fontSize: ScreenUtil().setSp(13),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildAvatar() {
    final profileImageUrl = avatarUrl;
    final avatarSize = ScreenUtil().setWidth(40);

    return CircleAvatar(
      radius: avatarSize / 2,
      backgroundColor: FB_PRIMARY,
      child: profileImageUrl == null || profileImageUrl.isEmpty
          ? _buildAvatarFallback()
          : ClipOval(
              child: Image.network(
                profileImageUrl,
                width: avatarSize,
                height: avatarSize,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildAvatarFallback(),
              ),
            ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      width: double.infinity,
      color: Colors.grey.shade200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_outlined,
            size: ScreenUtil().setSp(40),
            color: Colors.grey,
          ),
          SizedBox(height: ScreenUtil().setHeight(6)),
          Text(
            'Image preview',
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: ScreenUtil().setSp(12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostImage() {
    final postImageUrl = imageUrl;
    if (!hasImage && (postImageUrl == null || postImageUrl.isEmpty)) {
      return const SizedBox.shrink();
    }

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ScreenUtil().setSp(8)),
        child: postImageUrl == null || postImageUrl.isEmpty
            ? _buildImagePlaceholder()
            : Image.network(
                postImageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildImagePlaceholder(),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildAvatar(),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: userName,
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: date,
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(3)),
                        Icon(
                          Icons.public,
                          color: Colors.grey,
                          size: ScreenUtil().setSp(15),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.more_horiz),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            CustomText(
              text: postContent,
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            _buildPostImage(),
            SizedBox(height: ScreenUtil().setHeight(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _PostAction(
                  icon: Icons.thumb_up_outlined,
                  label: numOfLikes.toString(),
                ),
                _PostAction(icon: Icons.comment_outlined, label: 'Comment'),
                _PostAction(icon: Icons.redo, label: 'Share'),
              ],
            ),
            Row(
              children: [
                _buildAvatar(),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setSp(10),
                    ),
                    alignment: Alignment.centerLeft,
                    height: ScreenUtil().setHeight(36),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(
                        Radius.circular(ScreenUtil().setSp(18)),
                      ),
                    ),
                    child: CustomText(
                      text: 'Write a comment...',
                      fontSize: ScreenUtil().setSp(11),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            CustomText(
              text: 'View comments',
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class _PostAction extends StatelessWidget {
  const _PostAction({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: ScreenUtil().setSp(18), color: FB_DARK_PRIMARY),
        SizedBox(width: ScreenUtil().setWidth(4)),
        Text(
          label,
          style: TextStyle(
            color: FB_DARK_PRIMARY,
            fontSize: ScreenUtil().setSp(12),
          ),
        ),
      ],
    );
  }
}
