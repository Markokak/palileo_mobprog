import 'package:flutter/material.dart';

import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsFeedCard(
          userName: 'Mark Aeron Palileo',
          postContent: 'HI GUYSSSS',
          numOfLikes: 347,
          date: 'October 11',
          avatarUrl: 'assets/images/markprofile.jpg',
          imageUrl: 'assets/images/markpost.png',
        ),
        NewsFeedCard(
          userName: 'Leni Robredo',
          postContent: 'OTW para iligtas ang mundo',
          numOfLikes: 450,
          date: 'December 2',
          avatarUrl: 'assets/images/leni.jpg',
          imageUrl: 'assets/images/otw.jpg',
        ),
      ],
    );
  }
}
