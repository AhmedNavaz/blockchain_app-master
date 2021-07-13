import 'package:flutter/material.dart';
import 'package:get/get.dart';

var filterCheckList = {
  "deposited": false,
  "withdrawn": false,
  "sent": false,
  "exchange": false,
};

class FilterListWidget extends StatefulWidget {
  StateSetter stateSetter;
  FilterListWidget({Key? key, required this.stateSetter}) : super(key: key);

  @override
  _FilterListWidgetState createState() => _FilterListWidgetState();
}

class _FilterListWidgetState extends State<FilterListWidget> {
  CheckboxListTile checkBoxTile(String? title, IconData icon, String key) {
    return CheckboxListTile(
      value: filterCheckList[key],
      title: Row(
        children: [
          Column(
            children: [
              Card(
                color: Colors.grey.shade200,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: title == 'Withdrawn'
                      ? RotatedBox(
                          quarterTurns: 3,
                          child: Icon(
                            icon,
                            size: 20,
                          ),
                        )
                      : Icon(
                          icon,
                          size: 20,
                        ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 18),
            child: Text(
              title!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ],
      ),
      onChanged: (bool? checked) {
        widget.stateSetter(() {
          filterCheckList[key] = !filterCheckList[key]!;
        });
      },
    );
  }

  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 18, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    'Transaction type',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Container(
                  child: TextButton(
                    child: Text(
                      'Done',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: checkBoxTile(
                    'Deposited', Icons.add_circle_outline_rounded, 'deposited'),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: checkBoxTile(
                    'Withdrawn', Icons.outbound_outlined, 'withdrawn'),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: checkBoxTile('Sent', Icons.outbound_outlined, 'sent'),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: checkBoxTile('Exchange',
                    Icons.swap_horizontal_circle_outlined, 'exchange'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
