import 'package:blockchain_app/pages/deposit_page.dart';
import 'package:blockchain_app/pages/portfolio_page.dart';
import 'package:blockchain_app/pages/transaction_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RootScreen extends StatefulWidget {
  RootScreen({Key? key}) : super(key: key);
  bool? profile_verified;

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {

  // LOAD USER DATA FROM DATABASE WITH ITS UID
  // THIS WILL BE PLACED IN INIT STATE
  void refreshUser(){}

  @override
  void initState() {

    super.initState();
  }

  int _selectedPage = 1;
  // final auth_controller = Get.find<AuthController>();
  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  List<String> titleName = ['All Transactions', 'Simpyswap', 'Portfolio'];

  List<Widget> myPages = [
    TransactionPage(),
    DepositPage(),
    PortfolioPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          children: myPages,
          index: _selectedPage,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _onItemTapped(1);
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.grey.shade100,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.close_fullscreen_rounded),
                  label: 'Transactions'),
              BottomNavigationBarItem(
                icon: Icon(Icons.play_arrow),
                label: 'Deposit',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.folder_shared_outlined), label: 'Portfolio'),
            ],
            currentIndex: _selectedPage,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
