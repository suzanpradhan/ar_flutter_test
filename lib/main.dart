import 'package:ar_location_viewer/ar_location_viewer.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'annotation_viewer.dart';
import 'annotations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AR Test',
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
  List<Annotation> annotations = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AR Test"),
      ),
      body: ArLocationWidget(
          annotations: annotations,
          showDebugInfoSensor: false,
          annotationViewerBuilder: (context, annotation) {
            return AnnotationViewer(
              key: ValueKey(annotation.uid),
              annotation: annotation as Annotation,
            );
          },
          onLocationChange: (Position position) {
            Future.delayed(const Duration(seconds: 5), () {
              annotations =
                  fakeAnnotation(position: position, numberMaxPoi: 50);
              setState(() {});
            });
          },
        ),
    );
  }
}
