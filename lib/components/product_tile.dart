import 'package:flutter/material.dart';
import 'dart:io';

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
      leading: SizedBox(
        width: 100,
        height: 100,
        child: _imageBuilder(),
      ) ,
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
  Widget _imageBuilder() {
  try {
    debugPrint("this path: ${widget.picturePath}");
    return Image.file(File(widget.picturePath));
  } catch (e) {
    debugPrint("Error loading image: $e");
    debugPrint("error this path: ${widget.picturePath}");
    return Icon(Icons.error);
  }
}
}

