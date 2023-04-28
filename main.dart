import 'package:flutter/material.dart';
import 'package:prime_numbers/prime_numbers.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late String text;

  final List<int> _listNumbers = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
      _listNumbers.add(_counter);
    });
  }

  String getImage(int nb) {
    String image = 'assets/images/poire.png';
    if (nb.isPrime) {
      image = 'assets/images/ananas.png';
    } else if (nb.isOdd) {
      image = 'assets/images/pomme.png';
    } else if (nb.isEven) {
      image = 'assets/images/poire.png';
    }

    return image;
  }

  String getText(int nb) {
    String text = 'est un nombre';
    if (nb.isPrime) {
      text = '$nb est un nombre premier.';
    } else if (nb.isOdd) {
      text = '$nb est un nombre impair.';
    } else if (nb.isEven) {
      text = '$nb est un nombre pair.';
    }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Pomme, Poire, Ananas"),
      ),
      body: ListView.builder(
        itemCount: _listNumbers.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: (_listNumbers[index].isEven
                ? const Color.fromARGB(255, 99, 227, 236)
                : const Color.fromARGB(255, 44, 47, 239)),
            leading: Image.asset(getImage(_listNumbers[index])),
            title: Text(
              (getText(_listNumbers[index])),
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/* body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),*/
