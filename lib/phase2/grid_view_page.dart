import 'package:flutter/material.dart';
import 'dart:math' as math;

class GridViewPage extends StatefulWidget {
  const GridViewPage({super.key});
  @override
  GridViewPageState createState() => GridViewPageState();
}

class GridViewPageState extends State<GridViewPage> {
  int _columnsCount = 2;
  double _scrollPosition = 0;
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 基本的なレイアウト構造
      appBar: AppBar(
        // アプリの上部に表示されるAppBarを設定
        title: Text('${_scrollPosition.toStringAsFixed(0)} pixels'),
      ),

      // 画面右下に表示されるボタン
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end, // 下部に配置
        children: <Widget>[
          // 列数を増やすボタン
          FloatingActionButton(
            onPressed: () {
              if (_columnsCount < 3) {
                setState(() {
                  _columnsCount++;
                });
              }
            },
            child: const Icon(
              Icons.grid_on,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          // 列数を減らすボタン
          FloatingActionButton(
            onPressed: () {
              if (_columnsCount > 2) {
                setState(() {
                  _columnsCount--;
                });
              }
            },
            child: const Icon(
              Icons.grid_off,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          // 画面をトップに戻すボタン
          FloatingActionButton(
            onPressed: () {
              _scrollController.animateTo(
                0, // 移動先のスクロール位置
                duration: const Duration(milliseconds: 600), // アニメーションの時間
                curve: Curves.easeInQuint, // 動きのパターン
              );
            },
            child: const Icon(
              Icons.arrow_upward,
              color: Colors.white,
            ),
          ),
        ],
      ),

      // グリッドレイアウト
      body: GridView.builder(
        controller: _scrollController,
        // 設定
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _columnsCount, // 列数
          crossAxisSpacing: 10, // 列間のスペース
          mainAxisSpacing: 10, // 行間のスペース
        ),

        // itemCount: 10, // 表示される上限

        // グリッド内の各アイテムを生成するビルダー
        itemBuilder: (context, index) {
          final _gridItemColor =
              Color((math.Random(index).nextDouble() * 0x00FFFFFF).toInt())
                  .withOpacity(1);
          return Stack(
            children: [
              Container(
                color: _gridItemColor,
                child: Center(
                  // テキストを中央に配置
                  child: Text(
                    index.toString(),
                    style: const TextStyle(
                      fontSize: 42, // フォントサイズ
                      color: Colors.white, // 色
                    ),
                  ),
                ),
              ),
              Positioned(
                  right: 10,
                  bottom: 10,
                  child: Text(
                    _gridItemColor
                        .toString()
                        .toUpperCase()
                        .substring(6, 16)
                        .replaceAll('0X', '#'),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ))
            ],
          );
        },
      ),
    );
  }
}
