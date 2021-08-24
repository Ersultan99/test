import 'package:flutter/material.dart';

import 'widgets/checkbox.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: CustomCheckbox(),
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double v = 200;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              painter: FaceOutlinePainter(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedIconButton(),
                  AnimatedIconButton1(),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text('Animation duration'),
            SliderTheme(
                data: SliderThemeData(trackHeight: 1.0),
                child: Slider(
                    min: 200,
                    max: 2000,
                    value: v,
                    label: v.round().toString(),
                    onChanged: (value) => setState(() => this.v = value))),
            Text('$v ms')
          ],
        ),
      ),
    );
  }
}

class AnimatedIconButton extends StatefulWidget {
  @override
  _AnimatedIconButtonState createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton>
    with TickerProviderStateMixin {
  AnimationController _iconAnimationController;
  AnimationController _colorAnimationController;
  Animation _iconColorAnimation;
  Animation _backgroundColorAnimation;
  bool _active = false;

  @override
  void initState() {
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 125),
      value: 1.0,
      lowerBound: 1.0,
      upperBound: 1.75,
    );

    _colorAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 125),
    );

    _iconColorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.white,
    ).animate(_colorAnimationController)
      ..addListener(() {
        setState(() {});
      });

    _backgroundColorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.blue,
    ).animate(_colorAnimationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        margin: EdgeInsets.only(left: 164),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(200)),
            color: _backgroundColorAnimation.value),
        child: ScaleTransition(
          scale: _iconAnimationController,
          child: Icon(
            Icons.check,
            size: 20,
            color: _iconColorAnimation.value,
          ),
        ),
      ),
    );
  }

  void _onTap() {
    _iconAnimationController.forward().then((value) {
      _active
          ? _colorAnimationController.forward()
          : _colorAnimationController.reverse();
      _iconAnimationController.reverse();
    });

    _active = !_active;
  }
}

class AnimatedIconButton1 extends StatefulWidget {
  @override
  _AnimatedIconButton1State createState() => _AnimatedIconButton1State();
}

class _AnimatedIconButton1State extends State<AnimatedIconButton1>
    with TickerProviderStateMixin {
  AnimationController _iconAnimationController;
  AnimationController _colorAnimationController;
  Animation _iconColorAnimation;
  Animation _backgroundColorAnimation;
  bool _active = false;

  @override
  void initState() {
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 125),
      value: 1.0,
      lowerBound: 1.0,
      upperBound: 1.75,
    );

    _colorAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 125),
    );

    _iconColorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.white,
    ).animate(_colorAnimationController)
      ..addListener(() {
        setState(() {});
      });

    _backgroundColorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.green,
    ).animate(_colorAnimationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        margin: EdgeInsets.only(right: 168),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(200)),
            color: _backgroundColorAnimation.value),
        child: ScaleTransition(
          scale: _iconAnimationController,
          child: Icon(
            Icons.check,
            size: 20,
            color: _iconColorAnimation.value,
          ),
        ),
      ),
    );
  }

  void _onTap() {
    _iconAnimationController.forward().then((value) {
      _active
          ? _colorAnimationController.forward()
          : _colorAnimationController.reverse();
      _iconAnimationController.reverse();
    });

    _active = !_active;
  }
}

class FaceOutlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.blueAccent
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2.3, size.height / 2);

    canvas.drawCircle(center, 15, paint);

    final paint1 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.green
      ..strokeCap = StrokeCap.round;

    Offset center1 = Offset(size.width / 1.8, size.height / 2);

    canvas.drawCircle(center1, 15, paint1);
  }

  @override
  bool shouldRepaint(FaceOutlinePainter oldDelegate) => false;
}
