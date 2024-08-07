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
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 60,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              "Flutter is Google's UI toolkit for building beautiful, natively compiled",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.85,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          const FlutterLogo(
            size: 240,
          ),
          const SizedBox(
            height: 60,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              'Fast Development Paint your app to life in milliseconds with Stateful Hot Reload. Use a rich set of ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                height: 1.85,
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          SizedBox(
            height: 42,
            width: 300,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    )),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Text(
                    'get started',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
