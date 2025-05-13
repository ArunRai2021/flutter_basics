import 'package:flutter/material.dart';
import 'package:flutter_poc/todoApp/demo_buttons.dart';

class UiUpdatesDemo extends StatelessWidget {
  const UiUpdatesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    print("UIUpdatesDemo Build called");
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Every Flutter Developer Should Have a Basic UnderStanding of Flutter",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Do You underStand how Flutter Updates Uis?",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 24,
            ),
            DemoButtons()
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     TextButton(
            //         onPressed: () {
            //           setState(() {
            //             _isUnderStood = false;
            //           });
            //         },
            //         child: const Text("No")),
            //     TextButton(
            //         onPressed: () {
            //           setState(() {
            //             _isUnderStood = true;
            //           });
            //         },
            //         child: const Text("Yes"))
            //   ],
            // ),
            // if (_isUnderStood) const Text("Awesome")
          ],
        ),
      ),
    );
  }
}
