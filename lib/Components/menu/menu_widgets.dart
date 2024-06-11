import 'package:flutter/material.dart';

Widget configSwitch({
  required Icon icon,
  required String title,
  required bool value,
  required Function(bool) onChanged,
  required context,
}) {
  return SizedBox(
    width: double.infinity,
    child: TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFFCCCCCC),
        textStyle: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 24,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.dark_mode),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget menuTile({
  required String title,
  required Function() onPressed,
  required context,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFFCCCCCC),
          textStyle: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 24,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    ],
  );
}
