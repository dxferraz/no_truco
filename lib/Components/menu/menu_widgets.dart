import 'package:flutter/material.dart';

Widget configSwitch({
  required Icon icon,
  required String title,
  required bool value,
  required Function(bool) onChanged,
}) {
  return SwitchListTile.adaptive(
    value: value,
    onChanged: onChanged,
    title: Row(
      children: [
        icon,
        const SizedBox(width: 10),
        Text(
          title,
        ),
      ],
    ),
  );
}

Widget menuTile({
  required String title,
  required Function() onPressed,
}) {
  return TextButton(
    onPressed: onPressed,
    child: const Text(
      "Histórico",
      style: TextStyle(),
    ),
  );
}