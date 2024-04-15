import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';

final data = {
  "Category A": [
    "Item 1 (A)",
    "Item 2 (A)",
    "Item 3 (A)",
    "Item 4 (A)",
  ],
  "Category B": [
    "Item 1 (B)",
    "Item 2 (B)",
  ],
  "Category C": [
    "Item 1 (C)",
    "Item 2 (C)",
    "Item 3 (C)",
    "Item 4 (C)",
    "Item 5 (C)",
  ],
  "Category D": [
    "Item 1 (D)",
    "Item 2 (D)",
    "Item 3 (D)",
    "Item 4 (D)",
    "Item 5 (D)",
    "Item 6 (D)",
    "Item 7 (D)",
    "Item 8 (D)",
    "Item 9 (D)",
  ],
};

class TransactonUI extends StatelessWidget {
  const TransactonUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                height: 300,
                color: Colors.blue,
                child: Center(
                  child: Text("First Container"),
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: StickyHeaderDelegate(
                minHeight: 60,
                maxHeight: 60,
                child: Container(
                  color: Colors.green,
                  child: Center(
                    child: Text("Second Container"),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ListTile(title: Text("Index: $index"));

                  // ScrollableListTabScroller(
                  //   tabBuilder:
                  //       (BuildContext context, int index, bool active) =>
                  //           Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: 10),
                  //     child: Text(
                  //       data.keys.elementAt(index),
                  //       style: !active
                  //           ? null
                  //           : TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.green),
                  //     ),
                  //   ),
                  //   itemBuilder: (BuildContext context, int index) => Column(
                  //     children: [
                  //       Text(
                  //         data.keys.elementAt(index),
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold, fontSize: 20),
                  //       ),
                  //       ...data.values
                  //           .elementAt(index)
                  //           .asMap()
                  //           .map(
                  //             (index, value) => MapEntry(
                  //               index,
                  //               ListTile(
                  //                 leading: Container(
                  //                   height: 40,
                  //                   width: 40,
                  //                   decoration: BoxDecoration(
                  //                       shape: BoxShape.circle,
                  //                       color: Colors.grey),
                  //                   alignment: Alignment.center,
                  //                   child: Text(index.toString()),
                  //                 ),
                  //                 title: Text(value),
                  //               ),
                  //             ),
                  //           )
                  //           .values
                  //     ],
                  //   ),
                  //   itemCount: data.length,
                  // );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Hello"),
          ),
        )
      ],
    );
  }
}

class StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;
  StickyHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext contex, double shrinkOffset, bool overlapContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(StickyHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
