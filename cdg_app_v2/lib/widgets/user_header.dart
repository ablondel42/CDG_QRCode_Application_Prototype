import 'package:cdg_app_v2/themes/custom_styles.g.dart';
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 4, top: 4),
            child: Material(
              // borderRadius: const BorderRadius.all(Radius.circular(4)),
              elevation: .2,
              color: Theme.of(context).colorScheme.onPrimary,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const AvatarFrame(),
                  Expanded(
                    child: ListTile(
                      visualDensity: VisualDensity.comfortable,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      isThreeLine: true,
                      dense: true,
                      tileColor: Theme.of(context).colorScheme.onPrimary,
                      title: const Text('Xx. Firstname Lastname'),
                      subtitle: const Text('Job / occupation'),
                      trailing: SizedBox(
                        height: 32,
                        width: 32,
                        child: IconButton(
                          onPressed: () {},
                          padding: const EdgeInsets.only(left: 8),
                          icon: const Icon(Icons.menu_rounded),
                        ),
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: Column(
                  //     mainAxisSize: MainAxisSize.max,
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: <Widget>[
                  //       Row(
                  //         mainAxisSize: MainAxisSize.max,
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: <Widget>[
                  //           const Column(
                  //             mainAxisSize: MainAxisSize.max,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: <Widget>[
                  //               Text(
                  //                 'Xx. Firstname',
                  //               ),
                  //               Text(
                  //                 'Lastname',
                  //               ),
                  //               Text(
                  //                 'Job / Occupation',
                  //               ),
                  //             ],
                  //           ),
                  //           IconButton(
                  //             icon: const Icon(
                  //               Icons.menu_rounded,
                  //               size: 24,
                  //             ),
                  //             onPressed: () async {
                  //               await showModalBottomSheet(
                  //                 isScrollControlled: true,
                  //                 backgroundColor: Colors.transparent,
                  //                 context: context,
                  //                 builder: (context) {
                  //                   return const UserActions();
                  //                 },
                  //               );
                  //             },
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
            child: Material(
              elevation: 0.2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 340,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                alignment: const AlignmentDirectional(0, 0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        'assets/images/CDG_CARD_CDG.png',
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
                style: customButtonStyle(context),
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(
                      Icons.qr_code_rounded,
                    ),
                    SizedBox(width: 8.0),
                    Text('View'),
                  ],
                ),
              ),
              TextButton(
                style: customButtonStyle(context),
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(
                      Icons.qr_code_scanner_rounded,
                    ),
                    SizedBox(width: 8.0),
                    Text('Scan'),
                  ],
                ),
              ),
              TextButton(
                style: customButtonStyle(context),
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(
                      Icons.share_outlined,
                    ),
                    SizedBox(width: 8.0),
                    Text('Share'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
