



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlib/screens/search_result.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
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
                      onSubmitted: (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SearchResultScreen(
                            searchResult: value,
                          ),
                        ),
                      ),
                      focusNode: focusNode,
                      controller: searchController,
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
          ],
        ),
      ),
    );
  }
}
