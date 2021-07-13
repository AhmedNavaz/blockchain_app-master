import 'package:blockchain_app/controller/transcation_controller.dart';
import 'package:blockchain_app/widgets/custom_drawer_widget.dart';
import 'package:blockchain_app/widgets/filter_list_widget.dart';
import 'package:blockchain_app/widgets/transaction_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionPage extends StatelessWidget {
  TransactionPage({Key? key}) : super(key: key);
  final transactionController = Get.put(TransactionController());

  void filterList(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        isScrollControlled: true,
        context: ctx,
        builder: (_) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter state) {
              return ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                child: Container(
                  height: MediaQuery.of(ctx).size.height * 0.50,
                  child: FilterListWidget(stateSetter: state,),
                ),
              );
            }
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawerWidget(),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.filter_alt_outlined),
            color: Colors.blue.shade700,
            onPressed: () => filterList(context)),
        centerTitle: true,
        title: Text(
          'All Transactions',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.format_align_right_outlined),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
      ),
      body: TransactionList(),
    );
  }
}
