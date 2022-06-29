// ignore_for_file: unnecessary_this

import 'dart:io';
import 'dart:ui'; 
import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/consts/size_consts.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart'; 


class QrScannerScreen extends StatefulWidget{
  const QrScannerScreen({Key? key}) : super(key:  key);

  @override
  State<QrScannerScreen> createState() => QrScannerScreenState();
}

class QrScannerScreenState extends State<QrScannerScreen>{
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR'); 
  QRViewController? _controller;

  bool isFlashOn = false;

  void _onQRViewCreated(QRViewController controller){
    _controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text('QR Code is detected'),
          content: Text('Do you want to save the scanned information? Bla bla bla bla bla\n\nScanned information: ${scanData.code}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                controller.resumeCamera();
              }, 
              child: Text('NO')
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              }, 
              child: Text('YES')
            )
          ],
        )
      );
      debugPrint(scanData.code);
    });
  }

  @override
  void reassemble() {
    super.reassemble();

    if(Platform.isAndroid){
      _controller!.pauseCamera();
    }
    else if(Platform.isIOS){
      _controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){ 
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              QRView(
                key: qrKey, 
                onQRViewCreated: _onQRViewCreated, 
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                child: Container(
                  decoration: ShapeDecoration(
                    shape: QrScannerOverlayShape(
                      borderWidth: 10,
                      borderRadius: 10,
                      cutOutSize: MediaQuery.of(context).size.width * 0.45
                    ),
                  ),
                )
                ),
              Padding(
                padding: const EdgeInsets.only(left: PaddingConsts.horizontalPadding, right: PaddingConsts.horizontalPadding, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          CustomBackButton(buildContext: context, buttonSize: SizeConsts.kDefaultAppBarButtonSize, color: ColorConsts.white,),
                          SizedBox(width: SizeConsts.kDefaultAppBarButtonSize)
                        ],),
                      ],
                    ),
              ),
              Positioned(
                child:  GestureDetector( 
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    child: Container(
                      height: SizeConsts.kDefaultAppBarButtonSize + 10,
                      width: SizeConsts.kDefaultAppBarButtonSize + 10,
                      color: this.isFlashOn ? Colors.orange : ColorConsts.black,
                      child: Image.asset(
                        'assets/images/flash_button_image.png',
                        height: SizeConsts.kDefaultAppBarButtonSize,
                        width: SizeConsts.kDefaultAppBarButtonSize,
                      ),
                    )
                  ),
                  onTap:() {
                    _controller!.toggleFlash();
                    // qrScanState.changeFlashStatus();
                    this.isFlashOn = !this.isFlashOn;
                    debugPrint("flash is tapped");
                  },
                ),
                bottom: 60,
                left: MediaQuery.of(context).size.width * 0.5 - SizeConsts.kDefaultAppBarButtonSize / 2
              )
            ],
          )
        )
      ),
    );
  }
}