import 'package:flutter/material.dart';
import 'package:guiago/core/theme/go_colors.dart';
import 'package:guiago/features/home/logic/models.dart';
import 'package:guiago/features/home/ui/widgets/header.dart';
import 'package:guiago/features/home/ui/widgets/highlight_offer_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GOColors.primaryColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Header(onDepartureTimeChange: () {}),
            SizedBox(height: 16),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverToBoxAdapter(
                        child: Container(
                          color: GOColors.backgroundColor,
                          padding: EdgeInsets.all(8),
                          height: 224,
                          child: Center(
                            child: HighlightOfferWidget(offers: HighlightOffer.list()),
                          ),
                        ),
                      ),
                      SliverPersistentHeader(
                        floating: false,
                        pinned: true,
                        delegate: PersistentHeaderDelegate(),
                      ),
                    ];
                  },
                  body: Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    color: GOColors.whiteColor,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Item $index'),
                        );
                      },
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

class PersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  Widget cardOffers() {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      color: Colors.green,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            color: Colors.purple,
            width: 120,
            height: 40,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: cardOffers(),
    );
  }

  final extent = 56.0;

  @override
  double get maxExtent => extent;

  @override
  double get minExtent => extent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
