import 'package:flutter/material.dart';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  double result = 0;

  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    setState(() {
      result = double.parse(textEditingController.text) * 11.78;
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.amber),
        borderRadius: BorderRadius.all(Radius.circular(50.0)));

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Dollar 2 Cedi Converter'),
        centerTitle: true,
        titleTextStyle:
            const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'GHS ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
                style: const TextStyle(
                    fontSize: 45.0,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40.0),
              TextField(
                controller: textEditingController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(color: Colors.black, fontSize: 19),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.monetization_on, size: 40),
                  prefixIconColor: Colors.black,
                  hintText: 'Please Enter the amount in GHS',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 81, 80, 80)),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: convert,
                style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)))),
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 237, 17, 1),
                  ),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  minimumSize:
                      MaterialStatePropertyAll(Size(double.infinity, 50)),
                  textStyle: MaterialStatePropertyAll(
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                child: const Text('Convert'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
