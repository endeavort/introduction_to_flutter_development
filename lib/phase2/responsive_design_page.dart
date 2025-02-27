import 'package:flutter/material.dart';

class ResponsiveDesignPage extends StatelessWidget {
  const ResponsiveDesignPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
        title: const Text('様々なデバイスに対応する'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isPortrait = height > width;

    return Center(
      // 子ウィジェットに対して制約
      child: ConstrainedBox(
        // 子ウィジェットの最大幅を650ピクセルに制限
        constraints: const BoxConstraints(
          maxWidth: 650,
        ),
        child: Column(
          children: <Widget>[
            // 利用可能な空きスペースを動的に占有
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "Flutter is Google's UI toolkit for building beautiful, natively compiled",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15 * (height + width) / (926 + 438),
                  height: 1.85,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            if (isPortrait)
              FlutterLogo(
                size: height * 0.3,
              ),
            if (isPortrait) const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Fast Development Paint your app to life in milliseconds with Stateful Hot Reload. Use a rich set of ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15 * (height + width) / (926 + 438),
                  height: 1.85,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: SizedBox(
                width: double.infinity,
                // ボタンウィジェットを作成
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      )),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Text(
                      'get started',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15 * (height + width) / (926 + 438),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
