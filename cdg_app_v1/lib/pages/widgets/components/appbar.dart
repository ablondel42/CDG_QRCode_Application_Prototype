import 'package:flutter/material.dart';

/// This is an appbar component but maybe it would be better to create
/// a brand new custom scaffold widget and reuse it in the different screens.
class Appbar extends StatefulWidget {
  const Appbar({
    super.key,
    required this.title,
    required this.showBackButton,
  });

  final String title;
  final bool showBackButton;

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 48,
      backgroundColor: Theme.of(context).colorScheme.primary,
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
          child: Row(
            children: <Widget>[
              Text(
                'Logout',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.logout,
                  size: 16,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Auth().logout(context);
                  // prefs.remove('accessToken');
                  // prefs.remove('activeUser');
                },
              ),
            ],
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  widget.showBackButton && Navigator.of(context).canPop()
                      ? Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(8, 31, 0, 0),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: Navigator.of(context).canPop() ? Colors.white : Colors.transparent,
                              size: 16,
                            ),
                            onPressed: () async {
                              if (context.mounted && Navigator.canPop(context)) {
                                Navigator.pop(context);
                              }
                            },
                          ),
                        )
                      : const SizedBox(),
                  widget.showBackButton && Navigator.of(context).canPop()
                      ? Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 31, 0, 0),
                          child: Text(
                            'Back',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Navigator.of(context).canPop() ? Colors.white : Colors.transparent,
                                ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        expandedTitleScale: 1.0,
      ),
      elevation: 2,
    );
  }
}
