import 'package:flutter/material.dart';
import 'package:frame_vault/db/db_handler.dart';
import 'package:frame_vault/screens/add_product.dart';
import 'package:frame_vault/components/product_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Prototype3'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  int _counter = 0;
  List<Map<String, dynamic>> _data = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      debugPrint("index pressed: $index");
    });
    switch(index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage(title: "Prototype3")),
        );
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddProduct()),
       );
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage(title: "Prototype3")),
      );
    }

  }

  void _refreshEntries() async {
    final filler = await DbHandler.getProducts();
    setState(() {
      _data = filler;
    });
    debugPrint("data recieved: $_data");
  }

  @override
  void initState() {
    super.initState();
    _refreshEntries();
  }


  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:
          ListView.builder(
            itemCount: _data.length,
            itemBuilder: (context, index) => Card(
              color: Theme.of(context).cardColor,
              margin: const EdgeInsets.all(15),
      child: ProductTile(
        name: _data[index]['name'],
        sold: "True",
        purchasePrice: _data[index]['purchasePrice'],
        picturePath: _data[index]['picturePath'],
      ),
          ),
          ),

      bottomNavigationBar: BottomNavigationBar (
        type: BottomNavigationBarType.fixed,
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: "Add Item",
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.edit_note),
            label: "Archive",
          ),

           BottomNavigationBarItem(
           icon: Icon(Icons.file_copy),
           label: "Export",
         )

        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
