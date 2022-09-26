import 'package:flutter/material.dart';

class ItemButton extends StatelessWidget {
  const ItemButton({Key? key, required this.function, required this.btnTitle}) : super(key: key);
  final Function function;
  final String btnTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
          height: 40,
          width: 200,
          color: Colors.green,
          child: Center(
            child: Text(
              btnTitle,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
