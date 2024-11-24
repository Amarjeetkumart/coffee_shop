import 'package:coffee_shop_ui/screens/notifications_scr.dart';
import 'package:coffee_shop_ui/widgets/home_bottom_bar.dart';
import 'package:coffee_shop_ui/widgets/item_widget.dart';
import 'package:coffee_shop_ui/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 0,
    );
    _tabController.addListener(_handelTabSelection);
    super.initState();
  }

  _handelTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.sort_rounded, size: 35),
            color: Colors.white.withOpacity(0.5),
            tooltip: "Menu",
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, size: 35),
            color: Colors.white.withOpacity(0.5),
            tooltip: "Notification",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const NotificationsScr(),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const MainDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ListView(
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 15),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       InkWell(
              //         //top Icon
              //         onTap: () {
              //           Navigator.of(context).push(
              //             MaterialPageRoute(
              //                 builder: (ctx) => const MainDrawer()),
              //           );
              //         },
              //         child: Icon(
              //           Icons.sort_rounded,
              //           color: Colors.white.withOpacity(0.5),
              //           size: 35,
              //         ),
              //       ),
              //       InkWell(
              //         onTap: () {},
              //         child: Icon(
              //           Icons.notifications,
              //           color: Colors.white.withOpacity(0.5),
              //           size: 35,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "It's a great Day for coffee.",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                //Search bar
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 50, 54, 56),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: " Find your coffee..",
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 20,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 25,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              TabBar(
                //Tab bar
                controller: _tabController,
                labelColor: const Color(0xFFE57734),
                unselectedLabelColor: Colors.white.withOpacity(0.5),
                isScrollable: true,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 3,
                    color: Color(0xFFE57734),
                  ),
                  //borderRadius: BorderRadius.circular(30),
                  insets: EdgeInsets.symmetric(horizontal: 16),
                ),
                labelStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                tabs: const [
                  Tab(text: "Hot Coffee"),
                  Tab(text: "Cold Coffee"),
                  Tab(text: "Cappuicino"),
                  Tab(text: "Americano"),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: [
                  ItemWidget(),
                  const Icon(Icons.directions_car),
                  const Icon(Icons.directions_transit),
                  const Icon(Icons.directions_bike),
                  // ItemWidget(),
                  // ItemWidget(),
                  // ItemWidget(),
                ][_tabController.index],
              ),
            ],
          ),
        ),
      ),
      //Bottom navigation Bar
      bottomNavigationBar: const HomeBottomBar(),
    );
  }
}
