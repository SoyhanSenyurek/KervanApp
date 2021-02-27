import 'package:flutter/material.dart';
import 'package:kervan_app/pages/explore.dart';
import 'package:kervan_app/pages/match.dart';
import 'package:kervan_app/pages/profile.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawerScrimColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: getAppBar(),
      ),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    var items = [
      pageIndex == 0 ? Icons.home : Icons.home_outlined,
      pageIndex == 1 ? Icons.verified : Icons.verified_outlined,
      pageIndex == 2 ? Icons.account_circle : Icons.account_circle_outlined
    ];
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.white,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(items.length, (index) {
              return IconButton(
                  icon: Icon(
                    items[index],
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      pageIndex = index;
                    });
                  });
            })),
      ),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [ExploreScreen(), MatchScreen(), ProfileScreen()],
    );
  }
}
