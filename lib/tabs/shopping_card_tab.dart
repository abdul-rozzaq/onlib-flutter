import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlib/components/scroll_physics.dart';
import 'package:onlib/services/themes.dart';

class ShoppingCartTab extends StatefulWidget {
  const ShoppingCartTab({super.key});

  @override
  State<ShoppingCartTab> createState() {
    return _ShoppingCartTabState();
  }
}

class _ShoppingCartTabState extends State<ShoppingCartTab> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: Text(
              'Savat',
              style: Styles.headline1,
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) => const CardItem(),
              itemCount: 15,
              shrinkWrap: true,
              physics: CustomScrollPhysics(),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 1,
                  offset: Offset(1, -3),
                  color: Color.fromARGB(30, 50, 120, 244),
                )
              ],
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 5,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Jami: 150,000 so\'m',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                button(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container button() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(3),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(1, 1),
              color: Color.fromARGB(50, 68, 137, 255),
            ),
          ],
        ),
        child: const Text(
          'Buyurtma berish',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      );
}

class CardItem extends StatefulWidget {
  const CardItem({
    super.key,
  });

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      height: 120,
      // color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: isSelected,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (value) => setState(() => isSelected = value!),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? Colors.grey[200] : null,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  width: 1,
                  color: Colors.grey.shade200,
                ),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Image.network(
                      'https://barakot.uz/image/get-image?imageName=Ibodati%20Islomiya.jpg',
                      width: 85,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Ibodati islomiya',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Ahmad Hodiy Maqsudiy',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '65,000 so\'m',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
