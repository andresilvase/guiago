import 'package:flutter/material.dart';

final Color primaryColor = Color(0xFFD11621);
final Color secondaryColor = Color(0xFF1ABA8E);
final Color whiteColor = Color(0xFFF8F9FB);
final Color backgroundColor = Color(0xFFF0F0F0);
final Color textColor = Color(0xFF4B4B4B);

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
  Widget mano() {
    return Column(
      spacing: 16,
      children: [
        header(),
        myLocal(),
      ],
    );
  }

  Widget offers() {
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.all(8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0.1,
        color: whiteColor,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              width: 160,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.purple,
              ),
            ),
            Container(
              width: 200,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text("🔥", style: TextStyle(fontSize: 22), textAlign: TextAlign.left),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "motel savanas",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: textColor,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                "nossa senhora de lourdes - aparecida de goiânia",
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 11,
                                ),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "30% de desonto",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                        decorationThickness: .3,
                        color: textColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      "a partir de R\$ 57,98",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 6,
                      children: [
                        Column(
                          children: [
                            Text(
                              "reservar",
                              style: TextStyle(
                                color: whiteColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 2),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: whiteColor,
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            mano(),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height - 175,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        flexibleSpace: FlexibleSpaceBar(
                          background: offers(),
                        ),
                        floating: true,
                        pinned: false,
                        expandedHeight: 208,
                      ),
                      SliverPersistentHeader(
                        floating: true,
                        pinned: true,
                        delegate: PersistentHeaderDelegate(),
                      ),
                    ];
                  },
                  body: Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    color: whiteColor,
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

  Widget header() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, color: whiteColor),
          switcher(),
          Icon(Icons.search, color: whiteColor),
        ],
      ),
    );
  }

  Widget switcher() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      // height: 40,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          switcherOption(
            icon: Icons.flash_on_rounded,
            title: "ir agora",
            isSelected: true,
          ),
          switcherOption(
            icon: Icons.calendar_month_outlined,
            title: "ir outro dia",
            isSelected: false,
          ),
        ],
      ),
    );
  }

  Widget switcherOption({
    bool isSelected = false,
    required IconData icon,
    required String title,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? whiteColor : null,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
        children: [
          Icon(
            icon,
            color: isSelected ? primaryColor : whiteColor,
            size: 16,
          ),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.black : whiteColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget dashedLined() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(37, (int index) {
          return Container(
            margin: EdgeInsets.only(right: 2),
            color: Colors.white70,
            height: 0.6,
            width: 2,
          );
        }),
      ),
    );
  }

  Widget myLocal() {
    return Column(
      spacing: 4,
      children: [
        Row(
          spacing: 4,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'minha localização',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: whiteColor,
                fontSize: 14,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: whiteColor,
            )
          ],
        ),
        dashedLined(),
      ],
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
