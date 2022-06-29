import 'package:flutter/material.dart';



class AlternativesSlidingUpPanel extends StatefulWidget {
  const AlternativesSlidingUpPanel({ Key? key }) : super(key: key);

  @override
  State<AlternativesSlidingUpPanel> createState() => _AlternativesSlidingUpPanelState();
}

class _AlternativesSlidingUpPanelState extends State<AlternativesSlidingUpPanel> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Center(
        child: Text("There should be some alternatives")
      ),
    );
  }
}