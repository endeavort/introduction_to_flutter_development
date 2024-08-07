import 'package:flutter/material.dart';

class ShrinkableFooterPage extends StatefulWidget {
  const ShrinkableFooterPage({
    super.key,
  });
  @override
  ShrinkableFooterPageState createState() => ShrinkableFooterPageState();
}

class ShrinkableFooterPageState extends State<ShrinkableFooterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _BottomNavigationBar(
        isHiding: false,
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
    return Container(
      height: 60,
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
