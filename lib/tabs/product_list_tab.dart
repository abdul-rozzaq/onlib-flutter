import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:onlib/components/product_component.dart';
import 'package:onlib/components/scroll_physics.dart';
import 'package:onlib/screens/search_screen.dart';

class ProductListTab extends StatefulWidget {
  const ProductListTab({super.key});

  @override
  State<ProductListTab> createState() => _ProductListTabState();
}

class _ProductListTabState extends State<ProductListTab> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0) {
          debugPrint('Skroll boshida!');
        } else {
          debugPrint('Skroll oxiri!');
        }
      }

      if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
        debugPrint('tepaga!');
      } else {
        debugPrint('pastga!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SearchScreen())),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: const Row(
                children: [
                  Icon(
                    Icons.search_rounded,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Qidiruv ...',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              controller: scrollController,
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                mainAxisExtent: 330,
              ),
              itemBuilder: (context, index) => const ProductWidget(),
              itemCount: 11,
              shrinkWrap: true,
              physics: CustomScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
