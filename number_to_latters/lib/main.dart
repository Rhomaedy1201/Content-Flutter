import 'package:flutter/material.dart';
import 'package:number_to_latters/convertNumberToLatter.dart';
import 'package:number_to_latters/thousandsSeparatorInputFormatter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
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
  var hargaC = TextEditingController(text: '0');
  String? result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Convert Number To Latter"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            // Harga
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Harga",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            ThousandsSeparatorInputFormatter(),
                          ],
                          style: const TextStyle(
                            color: Color(0xFF616161),
                          ),
                          cursorColor: Color(0xFF737373),
                          decoration: const InputDecoration(
                            hintText: '2,000,000',
                            prefixText: "Rp. ",
                            prefixStyle: TextStyle(
                                color: Color(0xFF515151), fontSize: 15),
                            hintStyle: TextStyle(
                                color: Color(0xFF616161), fontSize: 15),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1, color: Color(0xFF515151)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1, color: Color(0xFFE4E4E4)),
                            ),
                          ),
                          autocorrect: false,
                          maxLines: 1,
                          controller: hargaC,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print(hargaC.text.replaceAll(RegExp('[^A-Za-z0-9]'), ''));
                      var number =
                          hargaC.text.replaceAll(RegExp('[^A-Za-z0-9]'), '');
                      setState(() {
                        result = ConvertNumberToLatter().numberToLetters(
                          number == '' ? 0 : int.parse(number),
                        );
                      });
                    },
                    child: Text(
                      'Convert to Latter',
                      style: TextStyle(fontSize: 14),
                    ),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(1),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Result :",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Text(
                  result != null ? result! : "-",
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.brown,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: Text(
                "@Rhm3dy",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
