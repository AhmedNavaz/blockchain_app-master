// ignore: import_of_legacy_library_into_null_safe
import 'package:blockchain_app/pages/add_message_page.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsViewerPage extends StatefulWidget {
  ContactsViewerPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ContactsViewerPageState createState() => _ContactsViewerPageState();
}

class _ContactsViewerPageState extends State<ContactsViewerPage> {
  List<Contact> contacts = [];
  List<Contact> contactsFiltered = [];
  Map<String, Color> contactsColorMap = new Map();
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    getPermissions();
  }

  getPermissions() async {
    if (await Permission.contacts.request().isGranted) {
      getAllContacts();
      searchController.addListener(() {
        filterContacts();
      });
    }
  }

  String flattenPhoneNumber(String phoneStr) {
    return phoneStr.replaceAllMapped(RegExp(r'^(\+)|\D'), (Match m) {
      return m[0] == "+" ? "+" : "";
    });
  }

  getAllContacts() async {
    List colors = [Colors.green, Colors.indigo, Colors.yellow, Colors.orange];
    int colorIndex = 0;
    List<Contact> _contacts = (await ContactsService.getContacts()).toList();
    _contacts.forEach((contact) {
      Color baseColor = colors[colorIndex];
      contactsColorMap[contact.displayName!] = baseColor;
      colorIndex++;
      if (colorIndex == colors.length) {
        colorIndex = 0;
      }
    });
    setState(() {
      contacts = _contacts;
    });
  }

  filterContacts() {
    List<Contact> _contacts = [];
    _contacts.addAll(contacts);
    if (searchController.text.isNotEmpty) {
      _contacts.retainWhere((contact) {
        String searchTerm = searchController.text.toLowerCase();
        String searchTermFlatten = flattenPhoneNumber(searchTerm);
        String contactName = contact.displayName!.toLowerCase();
        bool nameMatches = contactName.contains(searchTerm);
        if (nameMatches == true) {
          return true;
        }

        if (searchTermFlatten.isEmpty) {
          return false;
        }

        var phone = contact.phones!.firstWhere((phn) {
          String phnFlattened = flattenPhoneNumber(phn.value!);
          return phnFlattened.contains(searchTermFlatten);
          // ignore: null_check_always_fails
        }, orElse: () => null!);

        // ignore: unnecessary_null_comparison
        return phone != null;
      });
    }
    setState(() {
      contactsFiltered = _contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;
    bool listItemsExist = (contactsFiltered.length > 0 || contacts.length > 0);
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
              'Choose Recipent',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Container(
                margin: EdgeInsets.only(top: 70),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            labelText: 'Search',
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            prefixIcon: Icon(Icons.search,
                                color: Theme.of(context).primaryColor)),
                      ),
                    ),
                    listItemsExist == true
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: isSearching == true
                                ? contactsFiltered.length
                                : contacts.length,
                            itemBuilder: (context, index) {
                              Contact contact = isSearching == true
                                  ? contactsFiltered[index]
                                  : contacts[index];

                              var baseColor =
                                  contactsColorMap[contact.displayName]
                                      as dynamic;

                              Color color1 = baseColor[800];
                              Color color2 = baseColor[400];
                              return InkWell(
                                onTap: () {
                                  Get.to(() => AddMessagePage(
                                        contact: contacts[index].displayName,
                                      ));
                                },
                                child: ListTile(
                                    title: Text(contact.displayName!),
                                    subtitle: Text(contact.phones!.length > 0
                                        ? contact.phones!.elementAt(0).value!
                                        : ''),
                                    leading: (contact.avatar != null &&
                                            contact.avatar!.length > 0)
                                        ? CircleAvatar(
                                            backgroundImage:
                                                MemoryImage(contact.avatar!),
                                          )
                                        : Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: LinearGradient(
                                                    colors: [
                                                      color1,
                                                      color2,
                                                    ],
                                                    begin: Alignment.bottomLeft,
                                                    end: Alignment.topRight)),
                                            child: CircleAvatar(
                                                child: Text(contact.initials(),
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                backgroundColor:
                                                    Colors.transparent))),
                              );
                            },
                          )
                        : Container(
                            padding: EdgeInsets.all(20),
                            child: Text(
                                isSearching
                                    ? 'No search results to show'
                                    : 'No contacts exist',
                                style: Theme.of(context).textTheme.headline6),
                          )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 110),
              child: Text(
                '0.9345 BTC (\$102.33 USD)',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
