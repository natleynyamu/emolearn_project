import 'package:flutter/material.dart';

class PageButton extends StatelessWidget {
  final Function()? onTap;
  const PageButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 59.0,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFF52143F),
          borderRadius: BorderRadius.circular(26),
        ),
        child: const Center(
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: Color(0xFFF0F0F4),
              fontSize: 24.0,
              fontFamily: 'Exo Space',
            ),
          ),
        ),
      ),
    );
  }
}
