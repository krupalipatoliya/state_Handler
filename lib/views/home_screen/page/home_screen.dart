import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/colours.dart';
import '../../../utils/string.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhbKPTSB91lqZzowomglCCujZWwZ-OV26qoA&usqp=CAU'),
                ),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              page1First,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: black7,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              page1Second,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: black6,
              ),
            ),
            const Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 20)),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
              child: const Text(
                page1Third,
                style: TextStyle(
                    color: green, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
