import 'package:flutter/material.dart';
import 'package:stack_overflow/_util/extensions.dart';

class CustomVideoPlayerChild extends StatefulWidget {
  const CustomVideoPlayerChild({
    super.key,
    required this.isVisible,
  });
  final bool? isVisible;

  @override
  State<CustomVideoPlayerChild> createState() => _CustomVideoPlayerChildState();
}

class _CustomVideoPlayerChildState extends State<CustomVideoPlayerChild> {
  late int counter;

  @override
  void initState() {
    "Child Init State called >>>>>>".logIt;
    init();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    "Child Did Change Dependecies called>>>>>".logIt;
    super.didChangeDependencies();
  }

  void init() {
    counter = 0;
  }

  @override
  void didUpdateWidget(CustomVideoPlayerChild oldWidget) {
    "CHild Did Update widget is called".logIt;
    if (widget.isVisible != oldWidget.isVisible) {
      "Inside condition>>>>>".logIt;
      init();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    "CHild Build method called>>>>>".logIt;
    return Container(
      child: Column(
        children: [
          Text("data"),
          GestureDetector(
            onTap: () {
              refresh();
              counter++;
            },
            child: Text("Counter: $counter"),
          )
        ],
      ),
    );
  }

  void refresh() {
    if (mounted) {}
    setState(() {});
  }
}
