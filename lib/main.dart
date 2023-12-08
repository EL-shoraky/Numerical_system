import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:number_system/number_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController BinaryController = TextEditingController();
  TextEditingController DecimalController = TextEditingController();
  TextEditingController OctalController = TextEditingController();
  TextEditingController HexController = TextEditingController();

  late String text;
  String binaryVal = "";
  int DecVal = 0;
  int OctVal = 0;
  String HexVal = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BinaryController.text = "";
            DecimalController.text = "";
            OctalController.text = "";
            HexController.text = "";
          },
          child: const Icon(Icons.clear),
        ),
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.info_outline)),
          centerTitle: true,
          title: const Text(
            "Numerical_system",
          ),
        ),
        body: SizedBox(
          width: 500,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "made by mostafa El-shoraky",
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        binaryVal = value;
                        DecimalController.text =
                            binaryVal.binaryToDec().toString();
                        OctalController.text =
                            binaryVal.binaryToDec().decToOctal().toString();
                        HexController.text =
                            binaryVal.binaryToDec().decToHex().toString();
                      });
                    },
                    controller: BinaryController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-1]'))
                    ],
                    decoration: InputDecoration(
                        label: (const Text(
                          "Binary (2)",
                          style: TextStyle(fontSize: 20),
                        )),
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        if (DecimalController.text == "") {
                          BinaryController.text = "";
                          HexController.text = "";
                          OctalController.text = "";
                        } else {
                          DecVal = int.parse(value);
                          BinaryController.text =
                              DecVal.decToBinary().toString();
                          OctalController.text = DecVal.decToOctal().toString();
                          HexController.text = DecVal.decToHex().toString();
                        }
                      });
                    },
                    controller: DecimalController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    decoration: InputDecoration(
                        label: (const Text(
                          "Decimal (10)",
                          style: TextStyle(fontSize: 20),
                        )),
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        if (OctalController.text == "") {
                          BinaryController.text = "";
                          DecimalController.text = "";
                          HexController.text = "";
                        } else {
                          OctVal = int.parse(value);
                          BinaryController.text =
                              OctVal.octalToDec().decToBinary().toString();
                          DecimalController.text =
                              OctVal.octalToDec().toString();
                          HexController.text = OctVal.octalToDec().decToHex();
                        }
                      });
                    },
                    controller: OctalController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-7]'))
                    ],
                    decoration: InputDecoration(
                        label: (const Text(
                          "Octal (8)",
                          style: TextStyle(fontSize: 20),
                        )),
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      setState(() {
                        if (HexController.text == "") {
                          BinaryController.text = "";
                          DecimalController.text = "";
                          OctalController.text = "";
                        } else {
                          HexVal = value;
                          BinaryController.text =
                              HexVal.hexToDEC().decToBinary().toString();
                          DecimalController.text = HexVal.hexToDEC().toString();
                          OctalController.text =
                              HexVal.hexToDEC().decToOctal().toString();
                        }
                      });
                    },
                    controller: HexController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9,A,B,C,D,E,F]'))
                    ],
                    decoration: InputDecoration(
                        label: (const Text(
                          "Hexadecimal (16)",
                          style: TextStyle(fontSize: 20),
                        )),
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text(
                    "Base 2 (Binary) : Represent any number using 2 digits [0-1]",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text(
                    "Base 10 (Decimal) : Represent any number using 10 digits [0-9]",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text(
                    "Base 8 (Octal) : Represent any number using 8 digits [0-7]",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text(
                    "Base 16 (Hexadecimal) : Represent any number using 10 digits and 6 characters [0-9, A, B, C, E, F]",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
