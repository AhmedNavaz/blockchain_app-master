import 'package:flutter/material.dart';

class AccountTabs extends StatelessWidget {
  final String? title;
  final VoidCallback onTapFunc;
  const AccountTabs({Key? key, this.title, required this.onTapFunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: onTapFunc,
        child: Card(
          elevation: 0,
          color: Colors.grey.shade200,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    this.title!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  child: Icon(Icons.arrow_forward, color: Colors.grey),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
