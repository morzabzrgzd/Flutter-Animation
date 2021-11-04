import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';

class CircleParticleScreen extends StatelessWidget {
  const CircleParticleScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: CircularParticle(
          key: UniqueKey(),
          awayRadius: size.width/5,
          numberOfParticles: 150,
          speedOfParticles: 1.5,
          height: size.height,
          width: size.width,
          onTapAnimation: true,
          particleColor: Colors.white.withAlpha(150),
          awayAnimationDuration: const Duration(milliseconds: 600),
          maxParticleSize: 10,
        
          isRandSize: true,
          isRandomColor: false,
          // randColorList: [
          //   Colors.red.withAlpha(210),
          //   Colors.white.withAlpha(210),
          //   Colors.yellow.withAlpha(210),
          //   Colors.green.withAlpha(210)
          // ],
          awayAnimationCurve: Curves.easeInOutBack,
          enableHover: false,
          hoverColor: Colors.white,
          hoverRadius: 90,
          connectDots: false, //not recommended
        ),
      ),
    );
  }
}