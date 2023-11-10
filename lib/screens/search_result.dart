import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key, required this.searchResult});

  final String searchResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                children: [
                  GestureDetector(
                    child: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: CupertinoTextField(
                      controller: TextEditingController(text: searchResult),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      prefix: const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.search_rounded,
                          color: Colors.grey,
                        ),
                      ),
                      prefixMode: OverlayVisibilityMode.always,
                      placeholder: 'Qidiruv ...',
                      placeholderStyle: const TextStyle(color: Colors.grey),
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                ],
              ),
            ),
            const Text('asdasdasdadasda')
          ],
        ),
      ),
    );
  }
}
