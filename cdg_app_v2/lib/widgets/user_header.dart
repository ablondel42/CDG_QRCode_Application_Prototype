import 'package:cdg_app_v2/widgets/avatar_frame.dart';
import 'package:cdg_app_v2/widgets/user_actions.dart';
import 'package:flutter/material.dart';

class UserHeader extends StatefulWidget {
  const UserHeader({super.key});

  @override
  State<UserHeader> createState() => _UserHeaderState();
}

class _UserHeaderState extends State<UserHeader> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const AvatarFrame(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Xx. Firstname',
                            ),
                            Text(
                              'Lastname',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(
                                Icons.menu_rounded,
                                color: Color(0xCD009E00),
                                size: 24,
                              ),
                              onPressed: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return const UserActions();
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
            child: Material(
              color: Colors.transparent,
              elevation: 0.42,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Container(
                width: double.infinity,
                // height: 225,
                constraints: const BoxConstraints(
                    // maxWidth: 340,
                    ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                ),
                alignment: const AlignmentDirectional(0, 0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        'assets/images/CDG_NO_LOGO.png',
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {},
                child: const Icon(
                  Icons.qr_code_rounded,
                  // size: 15,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Icon(
                  Icons.qr_code_scanner_rounded,
                  // size: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
