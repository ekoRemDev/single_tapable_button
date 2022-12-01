import 'dart:async';

import 'package:flutter/material.dart';

class SingleTapableButton extends StatefulWidget {
  final void Function(StreamSink<bool> canBePressed) onPressed;
  final Widget? child;
  final String? text;
  final Color backgroundColor;
  final bool disabled;

  const SingleTapableButton({
    required this.onPressed,
    this.child,
    this.text,
    this.backgroundColor = Colors.blue,
    this.disabled = false,
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

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: StreamBuilder(
          stream: canButtonBePressedStream.stream,
          builder: (context, snapshot) {
            var _canBePressed = (snapshot.data ?? false);
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: widget.backgroundColor,
                elevation: 0,
              ),
              onPressed: _canBePressed
                  ? () {
                      canButtonBePressedStream.sink.add(false);
                      widget.onPressed(canButtonBePressedStream.sink);
                    }
                  : null,
              child: widget.text != null
                  ? Text(
                      widget.text!,
                    )
                  : widget.child ?? const SizedBox(),
            );
          }),
    );
  }
}
