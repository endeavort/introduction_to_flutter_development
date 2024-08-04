import 'package:flutter/material.dart';

class SliverAppBarPage extends StatefulWidget {
  const SliverAppBarPage({super.key});

  @override
  SliverAppBarPageState createState() => SliverAppBarPageState();
}

class SliverAppBarPageState extends State<SliverAppBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // スクロール可能な領域を作成
      body: CustomScrollView(
        slivers: [
          // スクロール度合いに応じて高さが変更できるAppBar
          SliverAppBar(
            backgroundColor: Colors.blueAccent.withOpacity(0.3),
            floating: true, // スクロール時にAppBarが表示されるようにする
            pinned: true, // スクロール時にAppBarが固定されるようにする
            snap: false, // スクロール時にAppBarが一瞬で表示されるようにする
            expandedHeight: 180, // 展開時の高さ
            toolbarHeight: 60, // 通常時の高さ
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('記事カテゴリー'),
              background: SizedBox(
                width: double.infinity,
                child: Image.network(
                  'https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                  fit: BoxFit.cover, // 画像を枠に合わせて表示
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
