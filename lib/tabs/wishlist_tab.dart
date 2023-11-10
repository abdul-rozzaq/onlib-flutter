import 'package:flutter/cupertino.dart';
import 'package:onlib/components/product_component.dart';
import 'package:onlib/components/scroll_physics.dart';
import 'package:onlib/services/themes.dart';

class WishListTab extends StatefulWidget {
  const WishListTab({super.key});

  @override
  State<WishListTab> createState() => _WishListTabState();
}

class _WishListTabState extends State<WishListTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 15,
            ),
            child: Text(
              'Tanlanganlar',
              style: Styles.headline1,
            ),
          ),
          Expanded(
            child: GridView.builder(
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
