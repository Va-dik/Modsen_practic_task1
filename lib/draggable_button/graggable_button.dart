import 'package:first_task_draggable_button/draggable_button/base_shape.dart';
import 'package:first_task_draggable_button/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  const CounterButton({super.key});

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int _counter = 0;
  double _circlePositionX = 0;
  double _circlePositionY = 0;
  double _grayContainerPositionX = 0;
  double _grayContainerPositionY = 0;
  bool showResetIcon = false;

  void _horizontalDrag(DragUpdateDetails details) {
    setState(() {
      _circlePositionX += details.delta.dx;
      _grayContainerPositionX = _circlePositionX / 3;
    });
  }

  void _verticalDrag(DragUpdateDetails details) {
    setState(() {
      _circlePositionY += details.delta.dy;
      _grayContainerPositionY = _circlePositionY / 6;
      showResetIcon = true;
    });
  }

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 49, 49, 49),
      appBar: AppBar(
        title: const Text('First task'),
        centerTitle: true,
      ),
      body: BaseShape(
        positionX: _grayContainerPositionX,
        positionY: _grayContainerPositionY,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      !showResetIcon
                          ? CustomIconButton(
                              onPressed: _decrement, icon: Icons.remove)
                          : const SizedBox(),
                      showResetIcon
                          ? const Icon(
                              Icons.close,
                              color: Color.fromRGBO(117, 117, 117, 1),
                            )
                          : const SizedBox(),
                      !showResetIcon
                          ? CustomIconButton(
                              onPressed: _increment, icon: Icons.add)
                          : const SizedBox(),
                    ]),
              ],
            ),
            Align(
              alignment: Alignment(
                _circlePositionX / screenSize.width * 1.8,
                _circlePositionY / screenSize.height * 6,
              ),
              child: GestureDetector(
                onHorizontalDragUpdate: _horizontalDrag,
                onVerticalDragUpdate: _verticalDrag,
                onHorizontalDragEnd: (details) {
                  setState(() {
                    if (_circlePositionX >= 150) {
                      _increment();
                    } else if (_circlePositionX <= -150) {
                      _decrement();
                    }
                    _circlePositionX = 0;
                    _grayContainerPositionX = 0;
                  });
                },
                onVerticalDragEnd: (details) {
                  setState(() {
                    if (_circlePositionY.abs() >= 220) {
                      _resetCounter();
                    }
                    _circlePositionY = 0;
                    _grayContainerPositionY = 0;
                    showResetIcon = false;
                  });
                },
                onTap: _increment,
                child: Container(
                  alignment: Alignment.center,
                  width: screenSize.width / 8,
                  height: screenSize.height / 16,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 71, 71, 71),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    _counter.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
