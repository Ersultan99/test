import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  double v = 200;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomPaint(
          painter: FaceOutlinePainter(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Box(), Box1()],
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
    );
  }
}

class Box extends StatefulWidget {
  final bool isChecked;
  final double size;
  final double iconSize;
  final Color selectedColor;
  final Color selectedIconColor;

  Box(
      {this.isChecked,
      this.size,
      this.iconSize,
      this.selectedColor,
      this.selectedIconColor});
  @override
  _BoxState createState() => _BoxState();
}

class _BoxState extends State<Box> {
  bool _isSelected = false;

  @override
  void initState() {
    _isSelected = widget.isChecked ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.only(left: 164),
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
            color: _isSelected
                ? widget.selectedColor ?? Colors.blue
                : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(200)),
            border: _isSelected ? null : Border.all(color: Colors.blue)),
        width: widget.size ?? 30,
        height: widget.size ?? 30,
        child: _isSelected
            ? Icon(
                Icons.check,
                color: widget.selectedIconColor ?? Colors.white,
                size: widget.iconSize ?? 20,
              )
            : null,
      ),
    );
  }
}

class Box1 extends StatefulWidget {
  final bool isChecked;
  final double size;
  final double iconSize;
  final Color selectedColor;
  final Color selectedIconColor;

  Box1(
      {this.isChecked,
      this.size,
      this.iconSize,
      this.selectedColor,
      this.selectedIconColor});

  @override
  _Box1State createState() => _Box1State();
}

class _Box1State extends State<Box1> {
  bool _isSelected = false;

  @override
  void initState() {
    _isSelected = widget.isChecked ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.only(right: 168),
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
            color: _isSelected
                ? widget.selectedColor ?? Colors.green
                : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(200)),
            border: _isSelected
                ? null
                : Border.all(
                    color: Colors.green,
                    width: 2.0,
                  )),
        width: widget.size ?? 30,
        height: widget.size ?? 30,
        child: _isSelected
            ? Icon(
                Icons.check,
                color: widget.selectedIconColor ?? Colors.white,
                size: widget.iconSize ?? 20,
              )
            : null,
      ),
    );
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
