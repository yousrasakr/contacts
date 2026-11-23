import 'package:contacts/colors/colorsApp.dart';
import 'package:contacts/contact_data/contact_data.dart';
import 'package:contacts/contact_widget/contact_widget.dart';
import 'package:contacts/home_screen_contacts/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreenContacts extends StatefulWidget {
  @override
  State<HomeScreenContacts> createState() => _HomeScreenContactsState();
}

class _HomeScreenContactsState extends State<HomeScreenContacts> {
  List<ContactData> contactsList = [];

  // void addFakeContacts() {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.navyColor,
      appBar: AppBar(
        backgroundColor: ColorsApp.navyColor,
        title: Image.asset(
          'assets/logo/route_logo.png',
          width: 117,
          height: 39,
          fit: BoxFit.fill,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsApp.beigeColor,
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: ColorsApp.navyColor,
            context: context,
            builder: (context) {
              return BottomSheetPanel(enterUserClick: addContact);
            },
          );
        },
      ),
      body: contactsList.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LottieBuilder.asset('assets/animations/emptyContacts.json'),
                  Text(
                    "There is No Contacts Added Here",
                    style: TextStyle(
                      color: ColorsApp.beigeColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.55,
              ),
              itemCount: contactsList.length,
              itemBuilder: (context, index) {
                return ContactWidget(
                  contact: contactsList[index],
                  deleteUser: deleteContact,
                );
              },
            ),
    );
  }

  void addContact(ContactData contact) {
    setState(() {
      contactsList.add(contact);
    });

  }
  void deleteContact(ContactData contact) {
    setState(() {
      contactsList.remove(contact);
    });
  }
}
