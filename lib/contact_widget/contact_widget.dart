import 'package:contacts/colors/colorsApp.dart';
import 'package:contacts/contact_data/contact_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';


typedef OnDeleteUser = void Function(ContactData);
class ContactWidget extends StatelessWidget{
  ContactData contact;
  OnDeleteUser deleteUser;

  ContactWidget({
    required this.contact,
    required this.deleteUser,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsApp.beigeColor,
        borderRadius: BorderRadius.circular(16),
      ),
      width: 177,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
                child: contact.contactImage != null
                    ? Image.file(
                  File(contact.contactImage!),
                  width: double.infinity,
                  height: 177,
                  fit: BoxFit.cover,
                )
                    : const SizedBox(
                  width: double.infinity,
                  height: 177,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, bottom: 8),
                width: 84,
                height: 33,
                decoration: BoxDecoration(
                  color: ColorsApp.beigeColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    contact.contactName,
                    style: TextStyle(
                      color: ColorsApp.navyColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.email,
                      color: ColorsApp.navyColor,
                      size: 20,
                    ),
                  ),
                  Text(
                    contact.contactEmail,
                    style: TextStyle(
                      color: ColorsApp.navyColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.phone,
                      color: ColorsApp.navyColor,
                      size: 20,
                    ),
                  ),
                  Text(
                    contact.contactPhone,
                    style: TextStyle(
                      color: ColorsApp.navyColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsApp.redColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                deleteUser(contact);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 20,
                  ),
                  Text(
                    "Delete",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}