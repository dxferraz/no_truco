import 'package:flutter/material.dart';

class RenameTeamPopUp extends StatefulWidget {
  const RenameTeamPopUp({Key? key}) : super(key: key);

  @override
  State<RenameTeamPopUp> createState() => _RenameTeamPopUpState();
}

class _RenameTeamPopUpState extends State<RenameTeamPopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Text(
        "Renomear time",
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 18,
          color: Colors.grey.shade100,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Dê outro nome para o time:',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Time A',
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancelar',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Confirmar',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
