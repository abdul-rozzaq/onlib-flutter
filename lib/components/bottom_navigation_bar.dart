import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onTap, required this.currentIndex});

  final Function(int) onTap;
  final int currentIndex;

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 1,
            offset: Offset(1, -3),
            color: Color.fromARGB(30, 50, 120, 244),
          ),
        ],
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CIconButton(
            isSelected: widget.currentIndex == 0,
            onTab: () => widget.onTap(0),
            iconData: Icons.home_rounded,
          ),
          CIconButton(
            isSelected: widget.currentIndex == 1,
            onTab: () => widget.onTap(1),
            iconData: Icons.category_rounded,
          ),
          CIconButton(
            isSelected: widget.currentIndex == 2,
            onTab: () => widget.onTap(2),
            iconData: Icons.shopping_basket_rounded,
          ),
          CIconButton(
            isSelected: widget.currentIndex == 3,
            onTab: () => widget.onTap(3),
            iconData: Icons.favorite_rounded,
          ),
          CIconButton(
            isSelected: widget.currentIndex == 4,
            onTab: () => widget.onTap(4),
            iconData: Icons.person_2_rounded,
          ),
        ],
      ),
    );
  }
}

class CIconButton extends StatelessWidget {
  const CIconButton({
    super.key,
    required this.iconData,
    required this.isSelected,
    this.onTab,
  });

  final IconData iconData;
  final VoidCallback? onTab;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: isSelected ? 1.15 : 1,
      child: Transform.translate(
        offset: Offset(1, isSelected ? -15 : 1),
        child: InkWell(
          onTap: onTab,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blueAccent : null,
              borderRadius: BorderRadius.circular(50),
              boxShadow: isSelected
                  ? [
                      const BoxShadow(
                        blurRadius: 3,
                        spreadRadius: 3,
                        blurStyle: BlurStyle.solid,
                        color: Color.fromARGB(70, 68, 137, 255),
                      ),
                    ]
                  : null,
            ),
            child: Icon(
              iconData,
              size: 25,
              color: isSelected ? Colors.white : Colors.grey[700],
            ),
          ),
        ),
      ),
    );
  }
}
