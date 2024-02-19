import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frame_vault/db/db_handler.dart';
import 'package:frame_vault/product/product.dart';
import 'package:frame_vault/cropper/image_helper.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

final imageHelper = ImageHelper();

class _AddProductState extends State<AddProduct> {
  List<Map<String, dynamic>> _data = [];
  bool isFramed = false; // isProduct framed
  bool isSold = false; // is product sold
  bool isOnWebStore = false; // is product on webstore
  String prodImagPath = "";
  File? _image;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mediumController= TextEditingController();
  final TextEditingController _purchasePriceController= TextEditingController();
  final TextEditingController _locationController= TextEditingController();
  final TextEditingController _purchaseDateController= TextEditingController();
  final TextEditingController _creationDateController= TextEditingController();
  final TextEditingController _noteController= TextEditingController();
  final TextEditingController _categoriesController= TextEditingController();

  Future<void> _saveProduct() async {
    //
    Product prodSave = Product();
    prodSave.name = _nameController.text;
    prodSave.medium = _mediumController.text;
    prodSave.purchasePrice = _purchasePriceController.text;
    prodSave.location = _locationController.text;
    prodSave.purchaseDate = _purchaseDateController.text;
    prodSave.creationDate = _creationDateController.text;
    prodSave.note = _noteController.text;
    prodSave.categories = _categoriesController.text;
    prodSave.picturePath = prodImagPath;

    DbHandler.createProduct(prodSave);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          TextField(
            key: ValueKey('nameKey'),
            controller: _nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Name",
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _mediumController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Medium",
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _purchasePriceController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Purchase Price",
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _locationController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Location",
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _purchaseDateController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Purchase Date",
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _creationDateController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Creation Date",
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _noteController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Note",
            ),
          ),
          SizedBox(height: 20.0),
          CheckboxListTile(
            title: const Text("Framed"),
            value: isFramed,
            onChanged: (bool? value) {
              setState(() {
                isFramed = value!;
              });
            },
          ),
          SizedBox(height: 20.0),
          CheckboxListTile(
            title: const Text("Sold"),
            value: isSold,
            onChanged: (bool? value) {
              setState(() {
                isSold = value!;
              });
            },
          ),
          SizedBox(height: 20.0),
          CheckboxListTile(
            title: const Text("On Web Store"),
            value: isOnWebStore,
            onChanged: (bool? value) {
              setState(() {
                isOnWebStore= value!;
              });
            },
          ),
          SizedBox(height: 20.0),
          Row(
            children: [
              SizedBox(
                width: 60.0,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "H",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              SizedBox(
                width: 60.0,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "W",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              SizedBox(
                width: 60.0,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "D",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _categoriesController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Categories",
            ),
          ),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => {},
                iconSize: 40.0,
                icon: Icon(Icons.camera),
              ),
              SizedBox(width: 40.0),
              IconButton(
                onPressed: () async {
                  final files = await imageHelper.pickImage();
                  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
                  if(files.isNotEmpty) {
                    final croppedFile = await imageHelper.crop(
                      file: files.first,
                      cropStyle: CropStyle.rectangle,
                    );
                    if(croppedFile != null) {
                      //final stors = File(croppedFile.path).copy(appDocumentsDir.path);
                      setState(() {
                        _image = File(croppedFile.path);
                        _image?.copy("${appDocumentsDir.path}/${_nameController.text}_img.jpg");
                        prodImagPath = "${appDocumentsDir.path}/${_nameController.text}_img.jpg";
                        debugPrint("path: ${croppedFile.path}");
                      });
                    }
                  }
                },
                iconSize: 40.0,
                icon: Icon(Icons.folder),
              ),
            ],
          ),
          SizedBox(height: 40.0),
          ElevatedButton(
            onPressed: () => {},
            child: Text("Archive Product"),
          ),
          SizedBox(height: 40.0),
          ElevatedButton(
            onPressed: () => {
              _saveProduct()
            },
            child: Text("Save Product"),
          ),
        ],
      ),
    );
  }
}

