import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class PhysicScreen extends StatefulWidget {
  const PhysicScreen({Key? key}) : super(key: key);

  @override
  _PhysicScreenState createState() => _PhysicScreenState();
}

class _PhysicScreenState extends State<PhysicScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.network(
                'https://images.unsplash.com/photo-1634195130430-2be61200b66a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80',
                fit: BoxFit.cover,
              ),
            ),
            DraggableCard(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastLinearToSlowEaseIn,
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1634034379073-f689b460a3fc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=580&q=80'),
                  ),
                  color: const Color(0xFF000000),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0C0416).withOpacity(0.7),
                      blurRadius: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DraggableCard extends StatefulWidget {
  final Widget child;

  // ignore: use_key_in_widget_constructors
  const DraggableCard({required this.child});

  @override
  _DraggableCardState createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  var _dragAlignment = Alignment.center;

  late Animation<Alignment> _animation;

  final _spring = const SpringDescription(
    mass: 7,
    stiffness: 1200,
    damping: 0.7,
  );

  double _normalizeVelocity(Offset velocity, Size size) {
    final normalizedVelocity = Offset(
      velocity.dx / size.width,
      velocity.dy / size.height,
    );
    return -normalizedVelocity.distance;
  }

  void _runAnimation(Offset velocity, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );

    final simulation =
        SpringSimulation(_spring, 0.0, 1.0, _normalizeVelocity(velocity, size));

    _controller.animateWith(simulation);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this)
      ..addListener(() => setState(() => _dragAlignment = _animation.value));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanStart: (details) => _controller.stop(canceled: true),
      onPanUpdate: (details) => setState(
        () => _dragAlignment += Alignment(
          details.delta.dx / (size.width / 2),
          details.delta.dy / (size.height / 2),
        ),
      ),
      onPanEnd: (details) =>
          _runAnimation(details.velocity.pixelsPerSecond, size),
      child: Align(
        alignment: _dragAlignment,
        child: Card(
          child: widget.child,
        ),
      ),
    );
  }
}
