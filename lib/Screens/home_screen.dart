import 'package:evaluationtest/Screens/articlelist_screen.dart';
import 'package:evaluationtest/Screens/search_screen.dart';
import 'package:evaluationtest/Services/nytimes_api.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String apiKey = 'uCAnE2GaFavW8Q3ma13DUMQXgtsnJoxq';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: const Border(
            bottom: BorderSide(color: Colors.black, width: 3.0),
          ),
          title: const Center(child: Text('NYT')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            _buildClickableRowWithSearch(context, 'Search Articles'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            _buildGroupedRow(
              title: 'Popular',
              rows: [
                _buildClickableRow(
                  context,
                  'Most Viewed',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticleListScreen(
                        searchQuery: 'Most Viewed',
                        articles: NYTimesAPI.getMostViewedArticles(apiKey, 7),
                      ),
                    ),
                  ),
                ),
                _buildClickableRow(
                  context,
                  'Most Shared',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticleListScreen(
                        searchQuery: 'Most Shared',
                        articles: NYTimesAPI.getMostSharedArticles(apiKey, 7),
                      ),
                    ),
                  ),
                ),
                _buildClickableRow(
                  context,
                  'Most Emailed',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticleListScreen(
                        searchQuery: 'Most Emailed',
                        articles: NYTimesAPI.getMostEmailedArticles(apiKey, 7),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGroupedRow({required String title, required List<Widget> rows}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Column(
            children: rows,
          ),
        ],
      ),
    );
  }

  Widget _buildClickableRow(
      BuildContext context, String hintText, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.black),
            bottom: BorderSide(color: Colors.black),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                hintText,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const Icon(Icons.keyboard_arrow_right),
          ],
        ),
      ),
    );
  }

  Widget _buildClickableRowWithSearch(BuildContext context, String hintText) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchScreen()),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.black),
            bottom: BorderSide(color: Colors.black),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                hintText,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const Icon(Icons.keyboard_arrow_right),
          ],
        ),
      ),
    );
  }
}
