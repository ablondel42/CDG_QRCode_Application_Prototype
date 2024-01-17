import 'package:cdg_app_v2/themes/custom_styles.g.dart';
import 'package:cdg_app_v2/widgets/avatar_frame.dart';
import 'package:cdg_app_v2/widgets/user_header.dart';
import 'package:cdg_app_v2/widgets/contact_list_tile.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff122e0c),
          title: Text(
            'Home',
            style: TextStyle(color: Theme.of(context).colorScheme.background),
          ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              expandedHeight: 392,
              flexibleSpace: FlexibleSpaceBar(
                background: UserHeader(),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 10,
                (context, index) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Material(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    elevation: .2,
                    child: ListTile(
                      visualDensity: VisualDensity.comfortable,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      isThreeLine: true,
                      dense: true,
                      tileColor: Theme.of(context).colorScheme.onPrimary,
                      title: Text('Xx. Firstname Lastname $index'),
                      subtitle: Text('Job / occupation $index'),
                      trailing: SizedBox(
                        height: 32,
                        width: 32,
                        child: IconButton(
                          onPressed: () {},
                          padding: const EdgeInsets.only(left: 24),
                          icon: const Icon(Icons.more_vert_rounded),
                        ),
                      ),
                    ),
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
