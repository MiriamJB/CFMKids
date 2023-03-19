import 'package:flutter/material.dart';

class ChangeSize extends StatefulWidget {
  const ChangeSize({super.key});

  @override
  State<ChangeSize> createState() => _ChangeSizeState();
}

class _ChangeSizeState extends State<ChangeSize> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          _isOpen = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return const Text("Sign up");
          },
          body: const Text("Aqui va a ir el sign up widget"),
          isExpanded: _isOpen,
        ),
      ],
    );
  }
}
