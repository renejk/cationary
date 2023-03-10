import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final bool isback;

  const HeaderWidget({Key? key, required this.title, this.isback = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (isback)
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        Expanded(
          child: SizedBox(
            height: 100,
            width: double.infinity,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        if (isback) const SizedBox(),
      ],
    );
  }
}
