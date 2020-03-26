import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

class OpenCamera extends StatefulWidget {
  final CameraDescription camera;

  const OpenCamera({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  OpenCameraState createState() => OpenCameraState();
}

class OpenCameraState extends State<OpenCamera> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState(){
    initCamera();
    super.initState();
  }


  void initCamera() async {
    final cameras = await availableCameras();

    _controller = CameraController(cameras.first, ResolutionPreset.medium);
    sleep(Duration(milliseconds: 1));
    _initializeControllerFuture = _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Preview
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'fabChatCam',
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          Directory appDir = await getApplicationDocumentsDirectory();
          try {
            await _initializeControllerFuture;
            final path = join(
              appDir.path,
              '${DateTime.now()}.png',
            );

            await _controller.takePicture(path);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(imagePath: path,),
              ),
            );
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: Text('Messaging'),
        ),
        body: Center(
          child: Image.file(File(imagePath),fit: BoxFit.fitHeight,),
        )
    );
  }
}
