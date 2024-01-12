import 'package:cdg_app_v1/pages/qrpage.dart';
import 'package:cdg_app_v1/pages/widgets/home/new_button.dart';
import 'package:cdg_app_v1/services/database.dart';
import 'package:cdg_app_v1/services/user_model.dart';
import 'package:flutter/material.dart';
import 'widgets/home/edit_button.dart';
import 'widgets/home/search_bar.dart';
import 'widgets/home/scan_button.dart';
import 'widgets/home/view_button.dart';
import 'widgets/components/appbar.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.userData});

  final UserData userData;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  late List<UserData> allCards;

  @override
  void initState() {
    super.initState();
    getCards();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void getCards() async {
    final queryAllCards = await DatabaseProvider().getAllCards();
    if (mounted) {
      setState(() {
        allCards = queryAllCards;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Appbar(title: 'Home', showBackButton: false),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: CustomScrollView(
          slivers: [
            SliverStickyHeader(
              header: Container(
                color: Theme.of(context).colorScheme.background,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Header(widget: widget),
                    ),
                    Material(elevation: 0, child: Searchbar(searchController: searchController)),
                  ],
                ),
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => InkWell(
                    onTap: () {
                      if (context.mounted) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return QrPage(userData: widget.userData);
                            },
                          ),
                        );
                      }
                    },
                    child: BuildCardListItem(
                      userData: widget.userData,
                    ),
                  ),
                  childCount: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.widget,
  });

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.2),
      ),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.contacts_outlined,
                color: Theme.of(context).colorScheme.primary,
                size: 32,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.userData.firstName,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    widget.userData.lastName,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.userData.title,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    widget.userData.organization,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    widget.userData.email,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              tileColor: Theme.of(context).colorScheme.primary,
              dense: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.2),
              ),
            ),
            Divider(
              thickness: 0.42,
              indent: 4.2,
              endIndent: 4.2,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 6, 0, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  EditButton(userData: widget.userData),
                  const ScanButton(),
                  CreateButton(userData: widget.userData),
                  ViewButton(userData: widget.userData),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildCardListItem extends StatefulWidget {
  const BuildCardListItem({super.key, required this.userData});

  final UserData userData;

  @override
  State<BuildCardListItem> createState() => _BuildCardListItemState();
}

class _BuildCardListItemState extends State<BuildCardListItem> {
  AssetImage logoSelector(String company) {
    switch (company) {
      case ('GIS' || '006'):
        return const AssetImage('assets/images/CDG_CARD_GIS.png');
      case ('ESRI' || '027'):
        return const AssetImage('assets/images/CDG_CARD_ESRI.png');
      default:
        return const AssetImage('assets/images/CDG_CARD_CDG.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Material(
            elevation: 0.42,
            child: Padding(
              padding: const EdgeInsets.all(0.042),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          width: 320,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: logoSelector('GIS'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(27, 60, 0, 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        widget.userData.firstName,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium?.copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                      ),
                                      Text(
                                        widget.userData.lastName,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium?.copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                      ),
                                      Text(
                                        widget.userData.title,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall?.copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                      ),
                                      Text(
                                        widget.userData.organization,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall?.copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        widget.userData.mobilePhone,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelSmall?.copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                      ),
                                      Text(
                                        widget.userData.email,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelSmall?.copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
