import 'package:flutter/material.dart';
import 'package:frame_vault/product/product.dart';

class AddProduct extends StatelessWidget {
  // no requirements for constructor
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body:
      ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Name",
            ),
          ),

           SizedBox(
             height: 20.0,
           ),

           TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Medium",
            ),
          ),

           SizedBox(
             height: 20.0,
           ),

           TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Purchase Price",
            ),
          ),

           SizedBox(
             height: 20.0,
           ),

           TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Location",
            ),
          ),

           SizedBox(
             height: 20.0,
           ),

           TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Purchase Date",
            ),
          ),

           SizedBox(
             height: 20.0,
           ),

           TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Creation Date",
            ),
          ),

           SizedBox(
             height: 20.0,
           ),

           TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Note",
            ),
          ),

          CheckboxListTile(
            title: const Text("Framed"),
            value: isChecked,
            onChanged: (bool? value) {
            },
          ),

          CheckboxListTile(
            title: const Text("Sold"),
            value: isChecked,
            onChanged: (bool? value) { isChecked = value!;},
          ),

          CheckboxListTile(
            title: const Text("On Web Store"),
            value: isChecked,
            onChanged: (bool? value) { isChecked = value!;},
          ),

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
               SizedBox(
                width: 20.0,
               ),
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

             ],
           ),


          SizedBox(
            height: 20.0,
          ),

           TextField(
           decoration: InputDecoration(
             border: OutlineInputBorder(),
             hintText: "Note",
           ),
         ),

          SizedBox(
            height: 40.0,
          ),
          ElevatedButton(onPressed: () => {}, child: Text("Save Product")),

        ],
      ),

    );
  }


}
