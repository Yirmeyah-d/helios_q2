import 'package:flutter/material.dart';

class PackagingResultDisplay extends StatelessWidget {
  final String packedItems;
  const PackagingResultDisplay({
    Key? key,
    required this.packedItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: <Widget>[
          Text(
            "Packed Items: $packedItems",
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
