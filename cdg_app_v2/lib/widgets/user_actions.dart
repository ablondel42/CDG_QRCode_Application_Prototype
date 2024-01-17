import 'package:cdg_app_v2/widgets/avatar_frame.dart';
import 'package:flutter/material.dart';

class UserActions extends StatefulWidget {
  const UserActions({super.key});

  @override
  State<UserActions> createState() => _UserActionsState();
}

class _UserActionsState extends State<UserActions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 520,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFF8C8C8C),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                    child: AvatarFrame(),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Text(
                              'Xx. Firstname',
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Text(
                              'Lastname',
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 8),
                        child: Text(
                          'Job / occupation Company',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {},
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Icon(
                          Icons.manage_accounts_rounded,
                          size: 32,
                        ),
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Profile settings',
                                  ),
                                  Text(
                                    'Edit login, password and PIN',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {},
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Icon(
                          Icons.wallet_rounded,
                          size: 32,
                        ),
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Manage cards',
                                  ),
                                  Text(
                                    'Create, edit and delete cards',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Icon(
                        Icons.share_rounded,
                        size: 32,
                      ),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Share',
                                ),
                                Text(
                                  'Share with an external application',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Icon(
                        Icons.contact_page,
                        size: 32,
                      ),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sync',
                                ),
                                Text(
                                  'Add contacts from your smartphone',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 48),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Icon(
                          Icons.logout_rounded,
                          size: 32,
                        ),
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Logout',
                                  ),
                                  Text(
                                    'Terminate session',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
