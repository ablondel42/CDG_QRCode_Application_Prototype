import 'package:cdg_app_v1/pages/widgets/home/filter_button.dart';
import 'package:flutter/material.dart';

/// This widget holds the textfield for searching the listview.
/// You can use the data in the controller.text property. then
/// perform a query with the onChange property, filter and set the
/// state to the filtered users.
/// SEE: https://api.flutter.dev/flutter/material/SearchBar-class.html
class Searchbar extends StatefulWidget {
  const Searchbar({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 12),
              child: TextFormField(
                controller: widget.searchController,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Search...',
                  labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                  alignLabelWithHint: false,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1,
                    ),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.background,
                ),
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          const FilterButton(),
        ],
      ),
    );
  }
}
