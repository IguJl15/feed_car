import 'package:flutter/material.dart';

class ToggleIconButton extends StatefulWidget {
  const ToggleIconButton(
      {required this.icon,
      required this.activeIcon,
      required this.onPress,
      this.initialState = false,
      Key? key})
      : super(key: key);
  final Icon icon;
  final Icon activeIcon;
  final bool initialState;
  final Function(bool newValue) onPress;

  @override
  State<ToggleIconButton> createState() => _ToggleIconButtonState(initialState);
}

class _ToggleIconButtonState extends State<ToggleIconButton> {
  _ToggleIconButtonState(this.activated);
  var activated;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => setState(() {
        activated = !activated;
        widget.onPress(activated);
        // Do your things like post into the server or whatever you'd like
      }),
      icon: activated ? widget.activeIcon : widget.icon,
      color: activated ? Theme.of(context).colorScheme.primary : null,
    );
  }
}
