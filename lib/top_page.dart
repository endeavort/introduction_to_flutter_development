import 'package:flutter/material.dart';
import 'phase2/responsive_design_page.dart';
import 'phase2/container_properties_page.dart';
import 'phase2/grid_view_page.dart';
import 'phase2/shrinkable_footer_page.dart';
import 'phase2/sliver_app_bar_page.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          _buildPhaseHeader('Phase 2'),
          _buildPageTile(
            context,
            'Container Properties',
            const ContainerPropertiesPage(),
            Icons.widgets,
          ),
          _buildPageTile(
            context,
            'Grid View',
            const GridViewPage(),
            Icons.grid_on,
          ),
          _buildPageTile(
            context,
            'Sliver App Bar',
            const SliverAppBarPage(),
            Icons.web_asset,
          ),
          _buildPageTile(
            context,
            'Shrinkable Footer',
            const ShrinkableFooterPage(),
            Icons.expand_less,
          ),
          _buildPageTile(
            context,
            'Responsive Design',
            const ResponsiveDesignPage(),
            Icons.devices,
          ),
          const SizedBox(height: 16), // フェーズ間のスペース

          // Phase 3 以降を追加
          _buildPhaseHeader('Phase 3'),
          // Phase 3 のページを追加
          // 例:
          // _buildPageTile(
          //   context,
          //   'Phase 3 Example Page',
          //   const Phase3ExamplePage(),
          //   Icons.example,
          // ),
        ],
      ),
    );
  }

  Widget _buildPhaseHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _buildPageTile(
      BuildContext context, String title, Widget page, IconData icon) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}
