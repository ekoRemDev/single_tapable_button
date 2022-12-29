import 'dart:async';

import 'package:flutter/material.dart';

class SingleTapableButton extends StatefulWidget {
  final void Function(StreamSink<bool> canBePressed) onPressed;
  final Widget? child;
  final Color backgroundColor;
  final bool disabled;
  final double? height;
  final double? width;
  final double? borderRadius;

  const SingleTapableButton({
    required this.onPressed,
    this.child,
    this.backgroundColor = Colors.blue,
    this.disabled = false,
    this.height = 48,
    this.width = double.infinity,
    this.borderRadius = 12,
  });

  @override
  State<SingleTapableButton> createState() => _SingleTapableButtonState();
}

class _SingleTapableButtonState extends State<SingleTapableButton> {
  final StreamController<bool> canButtonBePressedStream = StreamController();

  @override
  void initState() {
    super.initState();
    canButtonBePressedStream.sink.add(!widget.disabled);
  }

  @override
  void dispose() {
    canButtonBePressedStream.close();
    super.dispose();
  }

  @override
  void didUpdateWidget(SingleTapableButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.disabled != widget.disabled) {
      canButtonBePressedStream.sink.add(!widget.disabled);
    }
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.disabled,
    };
    if (states.any(interactiveStates.contains)) {
      return widget.backgroundColor.withOpacity(0.5);
    }
    return widget.backgroundColor;
  }

  RoundedRectangleBorder getBorder(Set<MaterialState> states) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 100),
    );
  }

  double getElevation(Set<MaterialState> states) {
    return 0;
  }

  Size getSize(Set<MaterialState> states) {
    return Size(widget.height ?? double.infinity, widget.width ?? 48);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: StreamBuilder(
          stream: canButtonBePressedStream.stream,
          builder: (context, snapshot) {
            var canBePressed = (snapshot.data ?? false);
            return ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.resolveWith(getSize),
                backgroundColor: MaterialStateProperty.resolveWith(getColor),
                shape: MaterialStateProperty.resolveWith(getBorder),
                elevation: MaterialStateProperty.resolveWith(getElevation),
              ),
              onPressed: canBePressed
                  ? () {
                      canButtonBePressedStream.sink.add(false);
                      widget.onPressed(canButtonBePressedStream.sink);
                    }
                  : null,
              child: canBePressed
                  ? widget.child
                  : const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    ),
            );
          }),
    );
  }
}
