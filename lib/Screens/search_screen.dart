import 'package:evaluationtest/Screens/articlelist_screen.dart';
import 'package:evaluationtest/Services/nytimes_api.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  Future<void> _performSearch(BuildContext context) async {
    const String apiKey = 'uCAnE2GaFavW8Q3ma13DUMQXgtsnJoxq';
    final String searchQuery = _searchController.text;

    try {
      // ignore: unused_local_variable
      final response = await NYTimesAPI.searchArticles(apiKey, searchQuery);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ArticleListScreen(searchQuery: searchQuery, articles: response),
        ),
      );
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    final boxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: boxHeight * 0.05),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search articles here...',
              ),
            ),
          ),
          SizedBox(height: boxHeight * 0.05),
          ElevatedButton(
            onPressed: () {
              _performSearch(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(100, 50),
            ),
            child: Text(
              'Search',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045),
            ),
          ),
        ],
      ),
    );
  }
}
