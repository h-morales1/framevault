import 'package:flutter/material.dart';

class ProductTile extends StatefulWidget {
  const ProductTile({required this.name, required this.sold, required this.purchasePrice, required this.picturePath, super.key});
  final String name;
  final String sold;
  final String purchasePrice;
  final String picturePath;

  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  // do something with state
  String tilePrice = "\$";


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text("Temp"),
      title: Text(widget.name),
      subtitle: Row(
        children: [
          Icon(Icons.business_center),
          const SizedBox(
            width: 10.0,
          ),
          Text("$tilePrice${widget.purchasePrice}")
        ],
      ),

    );
  }
}