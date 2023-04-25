import 'package:flutter/material.dart';

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
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Pomme, Poire, Ananas"),
      ),
      body: ListView.builder(
        itemCount: _counter,
        itemBuilder: (BuildContext context, counter) {
          return Center(
            child: SizedBox(
              width: 200,
              height: 30,
              child: Stack(
                children: [
                  Text(
                    ('Clic numéro : $counter'),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      backgroundColor: (counter.isEven
                          ? const Color.fromARGB(255, 99, 227, 236)
                          : const Color.fromARGB(255, 44, 47, 239)),
                    ),
                  ),
                  Image.asset(counter.isEven
                      ? 'assets/images/poire.png'
                      : 'assets/images/pomme.png')
                ],
              ),
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
