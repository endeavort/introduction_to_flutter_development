import 'dart:ui';

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
            backgroundColor: Colors.blueAccent.withOpacity(1),
            floating: true, // スクロール時にAppBarが表示されるようにする
            pinned: true, // スクロール時にAppBarが固定されるようにする
            snap: false, // スクロール時にAppBarが一瞬で表示されるようにする
            expandedHeight: 180, // 展開時の高さ
            toolbarHeight: 60, // 通常時の高さ
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                '記事カテゴリー',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              background: Stack(
                children: [
                  SizedBox(
                    // 親ウィジェットの幅に対して全幅を使用
                    width: double.infinity,
                    child: Image.network(
                      'https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                      fit: BoxFit.cover, // 画像を枠に合わせて表示
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      // 線形グラデーション
                      gradient: LinearGradient(
                          // グラデーションの開始位置を上部中央に設定
                          begin: FractionalOffset.topCenter,
                          // グラデーションの終了位置を下部中央に設定
                          end: FractionalOffset.bottomCenter,
                          // グラデーションの各色の位置を設定
                          stops: const [
                            0.5,
                            1
                          ],
                          colors: [
                            // 上部の色
                            Colors.grey.withOpacity(0),
                            // 下部の色
                            Colors.black,
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // リストをスクロール可能にする
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 20.0),
                    child: Column(
                      // 左揃え（Rowの場合は上揃え）
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          // 中央揃え
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            // 利用可能な空間を最大限に使用
                            const Expanded(
                              child: Text(
                                'Sept. 29 2020',
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.share,
                                color: Colors.blueAccent,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const Text(
                          '記事タイトル記事タイトル記事タイトル記事タイトル記事タイトル記事タイトル',
                        ),
                        // 横線
                        const Divider(
                          height: 30,
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: const NetworkImage(
                                  'https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                              radius: 26,
                              backgroundColor: Colors.grey[200],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '山田 太郎',
                                ),
                                Text(
                                  'ITジャーナリスト',
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: SizedBox(),
                            ),
                            Icon(
                              Icons.favorite_border,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '350',
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            Icon(
                              Icons.comment,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '25',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          '私は場合おもにその周旋めという事の所を受けですな。もし今日を通用違いはとにかく同じ意見たたほどをさて行くでしょをは懊悩おっしゃれませつで、実際とはできるでななくっです。釣に申し上げたら事はすでに前をちょうどないたた。同時に岡田さんが吟味落語それだけ批評にしでしょ秩序漠然たる一団私か発展にという皆経過たないなたから、このほかは私か人飯にして、大森君の事に主義の私の無論ご汚辱として私手がご誘惑でしようにぼんやりお学問で述べべきでて、毫もさぞ満足としたているたので出ないた。もしくはまたはお主義の向いのはこう馬鹿としたて、その賞には見えですでという辞令にいうておきました。こんな日言葉の日その国家も私ごろをさましかと三宅さんに知れでます、expectsの当時ですというご講演ますうならが、人間の以上が陰に場合までの個人を十月聴こけれどもいるて、それほどの今に描いからこうした中をどうもしましなと行かましのないと、ないたたて全くご個人できるだ訳たなけれた。つまり通りか無事か尊重が流れるなつつ、今ごろ力をしばいるない上を肝不足の場合で見たなけれ。時間でももちろんいうがつけよたますないなけれて、どうも勢い作るば話はまだなかっですものた。しかもご学習が食っからもいならはずんて、下働きでは、さぞこれか愛するからあっせよですた知れせないですと下げて、支はもつからしまいたくっます。いよいよしかるにさえ同時にウォーズウォースというくれますて、そこをも生涯上かも私のお病気はないししまうんまし。私もそのうち発展の事がご記憶はしていでたくますありと、五一の自我にこう重んずるましという諷刺たて、しかしその人の自力をしがらて、だれかを私の名に養成にしていうのたなと反抗云いて批評充たす来ますあっ。教師にそこで大森さんにあるいは一応あるたものなかっでない。岡田さんははっきりろを申し上げて知れでものならずです。（また人で倒さためですなけれたてなかっはいうだなて、）それほど立てるでモーニングに、ジクソンの相場でもするて投げといった、自我の変化も昔の中でもし生きのにありでが説明院しけれどもいれずについてご評語たものなけれ。',
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => _ClipRRectArticle(),
                              ),
                            ),
                            child: const Text(
                              'ぼかしサンプル',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ClipRRectArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width; // 画面の幅を取得
    return Scaffold(
      body: Stack(
        // 重ね合わせ(インデックス順に下から上に重なっていく)
        children: [
          // 背景画像の設定
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.pexels.com/photos/2834219/pexels-photo-2834219.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                // 角丸長方形に切り抜き
                ClipRRect(
                    borderRadius: BorderRadius.circular(12), // 角の丸み
                    child: BackdropFilter(
                      filter:
                          ImageFilter.blur(sigmaX: 5, sigmaY: 5), // ぼかしフィルタの適用
                      child: Container(
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 24, left: 24),
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: const NetworkImage(
                                          'https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                                      radius: 26,
                                      backgroundColor: Colors.grey[200],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '山田 太郎',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'ITジャーナリスト',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const Expanded(
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(24),
                                child: Text(
                                    '私は場合おもにその周旋めという事の所を受けですな。もし今日を通用違いはとにかく同じ意見たたほどをさて行くでしょをは懊悩おっしゃれませつで、実際とはできるでななくっです。\n\n釣に申し上げたら事はすでに前をちょうどないたた。同時に岡田さんが吟味落語それだけ批評にしでしょ秩序漠然たる一団私か発展にという皆経過たないなたから、このほかは私か人飯にして、大森君の事に主義の私の無論ご汚辱として私手がご誘惑でしようにぼんやりお学問で述べべきでて、毫もさぞ満足としたているたので出ないた。\n\nもしくはまたはお主義の向いのはこう馬鹿としたて、その賞には見えですでという辞令にいうておきました。こんな日言葉の日その国家も私ごろをさましかと三宅さんに知れでます',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 15,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
