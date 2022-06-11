import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/ui/screens/qr_scanner_screen.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () { 
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => const QrScannerScreen())
        );
      },
      child: const Icon(Icons.qr_code_scanner_outlined),
      backgroundColor: ColorConsts.navBarSelectedItemColor, 
    );
  }
}