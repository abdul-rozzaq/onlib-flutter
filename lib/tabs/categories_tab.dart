import 'package:flutter/material.dart';
import 'package:onlib/services/themes.dart';

class Category {
  String title;
  IconData icon;

  Category(this.title, this.icon);
}

// [
//   Category('Badiiy', Icons.book),
//   Category('Biznes', Icons.bar_chart_rounded),
//   Category('Moda', Icons.groups_rounded),
//   Category('Love', Icons.heart_broken_sharp),
//   Category('Tarix', Icons.history),
//   Category('Retsept', Icons.book),
// ];

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  final List<Category> categories = [
    Category('Badiiy', Icons.book_rounded),
    Category('Detektiv', Icons.search_rounded),
    Category('Triller', Icons.videocam_rounded),
    Category('Dahshat', Icons.warning_rounded),
    Category('Tarixiy', Icons.history_rounded),
    Category('Romantika', Icons.favorite_rounded),
    Category('Biografiyalar', Icons.person_rounded),
    Category('Diniy', Icons.my_library_books_rounded),
    Category('Fantastika', Icons.explore_rounded),
    Category('Biznes', Icons.work_rounded),
    Category('Moda', Icons.accessibility_rounded),
    Category('Ilmiy', Icons.edit_rounded),
    Category('Psixologiya', Icons.psychology_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'Janrlar',
              style: Styles.headline1,
            ),
          ),
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 15, crossAxisSpacing: 15),
              itemBuilder: (context, index) => categoryWidget(categories[index]),
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryWidget(Category category) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Color.fromARGB(50, 68, 137, 255),
              offset: Offset(1, 1),
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(3),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              category.icon,
              size: 35,
              color: Colors.blueAccent,
            ),
            const SizedBox(height: 8),
            Text(
              category.title,
              style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w600),
            ),
            const Text(
              '28 dona',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 10),
            ),
          ],
        ),
      );
}
