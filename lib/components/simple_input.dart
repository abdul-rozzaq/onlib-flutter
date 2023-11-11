import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleInput extends StatefulWidget {
  const SimpleInput({
    super.key,
    required this.icon,
    required this.label,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.color = Colors.white,
    this.focusNode,
  });

  final IconData icon;
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Color color;
  final FocusNode? focusNode;

  @override
  State<SimpleInput> createState() => _SimpleInputState();
}

class _SimpleInputState extends State<SimpleInput> {
  bool obscureText = false;

  @override
  void initState() {
    super.initState();

    obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            color: widget.color,
            size: 25,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              focusNode: widget.focusNode,
              keyboardType: widget.keyboardType,
              obscureText: obscureText,
              controller: widget.controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: widget.label,
                hintStyle: TextStyle(
                  color: widget.color.withOpacity(.8),
                ),
              ),
              style: TextStyle(
                color: widget.color,
              ),
            ),
          ),
          if (widget.obscureText)
            InkWell(
              onTap: () => setState(() => obscureText = !obscureText),
              child: Icon(
                obscureText ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill,
                color: widget.color,
                size: 25,
              ),
            ),
        ],
      ),
    );
  }
}
