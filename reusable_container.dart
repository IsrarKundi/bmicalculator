import 'package:flutter/material.dart';

class reusableContainer extends StatelessWidget {
  reusableContainer(this.colour, this.cardChild);
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}
