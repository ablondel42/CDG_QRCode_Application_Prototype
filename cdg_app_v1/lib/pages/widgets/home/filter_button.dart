// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 12),
        child: IconButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.secondary,
            ),
          ),
          icon: Icon(
            Icons.filter_list_alt,
            color: Theme.of(context).colorScheme.primary,
            size: 26,
          ),
          onPressed: () {}, /// TODO: filter the results in the listview
        ),
      ),
    );
  }
}
