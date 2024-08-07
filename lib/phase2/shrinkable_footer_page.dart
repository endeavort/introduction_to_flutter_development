import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:introduction_to_flutter_development/top_page.dart';

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
        backgroundColor: Colors.grey.shade100,
        // iPhoneのホームバー等に被らないようにする
        body: SafeArea(
          // 重ねて表示する
          child: Stack(
            children: [
              ListView(
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
              // 位置を指定
              Positioned(
                bottom: 0,
                child: _BottomNavigationBar(isHiding: isHiding),
              )
            ],
          ),
        ));
  }
}

class _IconTextItem extends StatelessWidget {
  final double deviceWidth;
  final bool isHiding;
  final IconData icon;
  final String title;
  final VoidCallback? onTap; // onTapコールバックを追加

  const _IconTextItem({
    required this.deviceWidth,
    required this.isHiding,
    required this.icon,
    required this.title,
    this.onTap, // onTapコールバックを受け取る
  });

  @override
  Widget build(BuildContext context) {
    // ジェスチャー（タップ、スワイプ、ドラッグ、ダブルタップなど）を検出
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 0.25 * (deviceWidth - 32),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Icon(
                icon,
                color: const Color(0xFF442C2E),
                size: 24,
              ),
            ),
            AnimatedOpacity(
              opacity: isHiding ? 0 : 1,
              duration: const Duration(milliseconds: 120),
              curve: Curves.easeInQuart,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
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
    return AnimatedOpacity(
      opacity: isHiding ? 0.5 : 1.0, // 透明度を変更
      duration: const Duration(milliseconds: 200),
      child: AnimatedContainer(
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
                isHiding: isHiding,
                icon: Icons.home,
                title: 'Home',
                onTap: () {
                  // 新しいページに遷移する処理を開始
                  Navigator.pushAndRemoveUntil(
                    context,
                    // 新しいページとしてTopPageウィジェットを指定
                    MaterialPageRoute(builder: (context) => const TopPage()),
                    // すべての既存のルートを削除(戻るボタンを押しても元の画面に戻らない)
                    (route) => false,
                  );
                },
              ),
              _IconTextItem(
                deviceWidth: width,
                isHiding: isHiding,
                icon: Icons.star,
                title: 'Favorite',
              ),
              _IconTextItem(
                deviceWidth: width,
                isHiding: isHiding,
                icon: Icons.favorite,
                title: 'Like',
              ),
              _IconTextItem(
                deviceWidth: width,
                isHiding: isHiding,
                icon: Icons.settings,
                title: 'Menu',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
