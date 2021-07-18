import 'package:flutter/material.dart';

class ReferPage extends StatelessWidget {
  const ReferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            leading: BackButton(
              color: Colors.black,
            ),
            elevation: 0,
            backgroundColor: Colors.grey.shade200,
            centerTitle: true,
            title: Text(
              'Refer to a friend',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 180),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    hintText: 'https://simpyswap.com/34Df3',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                    ),
                    contentPadding: EdgeInsets.all(5),
                  ),
                ),
              ),
              Container(
                child: TextButton(
                  child: Text(
                    'Copy Link',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
