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
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'Home',
            style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
          ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              expandedHeight: 360,
              flexibleSpace: FlexibleSpaceBar(
                background: UserHeader(),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 10,
                (context, index) => const ContactListTile(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
