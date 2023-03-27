import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:get_it/get_it.dart';

import '../../navigator/main_navigator.dart';
import '../../theme/theme_colors.dart';
import '../../vm/init/data_init_vm.dart';
import '../../widget/progress/circular_progress.dart';
import '../../widget/progress/line_progress.dart';
import '../../widget/provider/provider_widget.dart';

/// Screen to visualise progress when data is being loaded to the app
class DataInit extends StatefulWidget {
  static const String routeName = 'init';

  const DataInit({Key? key}) : super(key: key);

  @override
  DataInitState createState() => DataInitState();
}

class DataInitState extends State<DataInit>
    with SingleTickerProviderStateMixin
    implements DataInitNavigator {
  Size? size;
  double? radius;
  late Scene mainScene;
  Object? mainCube;
  late AnimationController animController;

  void onSceneCreated(Scene scene) {
    mainScene = scene;
    scene.camera.position.z = 50;
    mainCube = Object(
      scale: Vector3(3.0, 3.0, 3.0),
      backfaceCulling: false,
      fileName: 'assets/cube/app.obj',
    );
    const int samples = 50;
    const double radius = 12;
    const double offset = 2 / samples;
    final double increment = pi * (3 - sqrt(5));
    for (var i = 0; i < samples; i++) {
      final y = (i * offset - 1) + offset / 2;
      final r = sqrt(1 - pow(y, 2));
      final phi = ((i + 1) % samples) * increment;
      final x = cos(phi) * r;
      final z = sin(phi) * r;
      final Object cube = Object(
        position: Vector3(x, y, z)..scale(radius),
        fileName: 'assets/cube/app.obj',
      );
      mainCube!.add(cube);
    }
    scene.world.add(mainCube!);
  }

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
        duration: const Duration(milliseconds: 30000), vsync: this)
      ..addListener(() {
        if (mainCube != null) {
          mainCube!.rotation.y = animController.value * 360;
          mainCube!.updateTransform();
          mainScene.update();
        }
      })
      ..repeat();
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    radius = size!.width / 2.5;

    return ProviderWidget<DataInitVm>(
      create: () => GetIt.I()..init(this),
      childBuilderWithViewModel: (context, vm, theme, localization) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: vm.isLoading
              ? const CircularProgress()
              : Center(
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: size!.height / 1.4,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: size!.height / 9,
                            ),
                            child: LineProgress(
                              key: const ValueKey('data_init_progress'),
                              isVertical: true,
                              size: size!.width / 3,
                              progress: vm.progress,
                              borderColor: Colors.black,
                              progressColor: ThemeColors.primary,
                              backgroundColor: ThemeColors.accent,
                            ),
                          ),
                          Text(
                            vm.state.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w800,
                              fontSize: radius! / 9,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Cube(
                        onSceneCreated: onSceneCreated,
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  @override
  void goToHome() => MainNavigator.of(context).goToHome();
}
