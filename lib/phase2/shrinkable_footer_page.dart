import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShrinkableFooterPage extends StatefulWidget {
  const ShrinkableFooterPage({
    super.key,
  });
  @override
  ShrinkableFooterPageState createState() => ShrinkableFooterPageState();
}

class ShrinkableFooterPageState extends State<ShrinkableFooterPage> {
  final _scrollController = ScrollController();
  bool isHiding = false;

  @override
  void initState() {
    super.initState();
    _listenScroll();
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    super.dispose();
  }

  void _listenScroll() {
    _scrollController.addListener(() {
      // スクロールが上向き（ユーザーが下にスクロールしている）かどうかをチェック
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        isHiding = false;
      } else {
        isHiding = true;
      }
      // 状態を更新してUIを再構築
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: _scrollController,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 50),
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
              color: Color(0xFFFEEAE6),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // Columnのサイズをその中身に合わせる
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 70),
                Text(
                  'スクロールに応じて\nBottomNavigationBarが\n縮みます。',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Color(0xFF442C2E),
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Image.network(
              'https://images.unsplash.com/photo-1528164344705-47542687000d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1369&q=80'),
          const SizedBox(height: 20.0),
          Image.network(
              'https://images.unsplash.com/photo-1532236204992-f5e85c024202?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1372&q=80'),
          const SizedBox(height: 20.0),
          Image.network(
              'https://images.unsplash.com/photo-1493479874819-4303c36fa0f9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80'),
          const SizedBox(height: 20.0),
          Image.network(
              'https://images.unsplash.com/photo-1463319611694-4bf9eb5a6e72?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80'),
          const SizedBox(height: 20.0),
          Image.network(
              'https://images.unsplash.com/photo-1469998265221-245c7148df5d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80'),
          const SizedBox(height: 20.0),
        ],
      ),
      bottomNavigationBar: _BottomNavigationBar(
        isHiding: isHiding,
      ),
    );
  }
}

class _IconTextItem extends StatelessWidget {
  final double deviceWidth;
  final IconData icon;
  final String title;

  const _IconTextItem({
    required this.deviceWidth,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.25 * (deviceWidth - 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color(0xFF442C2E),
            size: 24,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({required this.isHiding});

  final bool isHiding;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: isHiding ? 32 : 60,
      color: const Color(0xFFFEEAE6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _IconTextItem(
              deviceWidth: width,
              icon: Icons.home,
              title: 'Home',
            ),
            _IconTextItem(
              deviceWidth: width,
              icon: Icons.star,
              title: 'Favorite',
            ),
            _IconTextItem(
              deviceWidth: width,
              icon: Icons.favorite,
              title: 'Like',
            ),
            _IconTextItem(
              deviceWidth: width,
              icon: Icons.settings,
              title: 'Menu',
            ),
          ],
        ),
      ),
    );
  }
}
