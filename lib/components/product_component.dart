import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  final double horizontalPadding = 5;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  'https://barakot.uz/image/get-image?imageName=Ibodati%20Islomiya.jpg',
                  height: 230,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: const Text(
                  'Ibodati islomiya',
                  maxLines: 2,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 7),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: const Text(
                  'Ahmad Hodiy Maqsudiy',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: const Row(
                  children: [
                    Icon(Icons.star_rounded, color: Colors.amber, size: 15),
                    Text(
                      '4.5 (10 ta buyurtma)',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: const Text(
                  '65,000 so\'m',
                  maxLines: 2,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Icon(
            Icons.favorite,
            size: 23,
            color: Colors.grey[350],
          ),
        ),
        const Positioned(
          bottom: 5,
          right: 5,
          child: Icon(
            Icons.shopping_basket_rounded,
            color: Colors.blueAccent,
            size: 30,
          ),
        ),
      ],
    );
  }
}
