import 'package:contacts/contact_data/contact_data.dart';
import 'package:contacts/contact_widget/contact_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contacts/colors/colorsApp.dart';
import 'package:lottie/lottie.dart';
import 'package:image_picker/image_picker.dart';

typedef OnEnterUser = void Function(ContactData);
class BottomSheetPanel extends StatefulWidget {
  String ?userName;
  String? userEmail;
  String ?userPhone;
  OnEnterUser enterUserClick;

  BottomSheetPanel({this.userName,this.userPhone,this.userEmail,required this.enterUserClick});

  @override
  State<BottomSheetPanel> createState() => _BottomSheetPanelState();

}

class _BottomSheetPanelState extends State<BottomSheetPanel> {
  final textController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  XFile? _pickedImage;

@override
void dispose() {
  textController.dispose();
  emailController.dispose();
  phoneController.dispose();

  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: 402,
            height: 467,
            decoration: BoxDecoration(
              color: ColorsApp.navyColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 18, left: 20, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 16,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 143,
                        height: 146,
                        decoration: BoxDecoration(
                          border: BoxBorder.all(
                            width: 1,
                            color: ColorsApp.beigeColor,
                          ),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: InkWell(
                          onTap: ()async {
                            final ImagePicker picker = ImagePicker();
                            final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                            if (image == null) return;

                            setState(() {
                              _pickedImage = image;

                            });
                          },
                          child: LottieBuilder.asset(
                            'assets/animations/imagePicker.json',
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          width: 213,
                          height: 121,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: "User Name",
                                    hintStyle: TextStyle(
                                      color: ColorsApp.beigeColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "example@email.com",
                                    hintStyle: TextStyle(
                                      color: ColorsApp.beigeColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "+200000",
                                    hintStyle: TextStyle(
                                      color: ColorsApp.beigeColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'Enter User Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: const BorderSide(
                          color: ColorsApp.beigeColor,
                          width: 1.0,
                        ),
                      ),
                      hintStyle: TextStyle(
                        color: ColorsApp.whiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter User Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: const BorderSide(
                          color: ColorsApp.beigeColor,
                          width: 1.0,
                        ),
                      ),
                      hintStyle: TextStyle(
                        color: ColorsApp.whiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: 'Enter User Phone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: const BorderSide(
                          color: ColorsApp.beigeColor,
                          width: 1.0,
                        ),
                      ),
                      hintStyle: TextStyle(
                        color: ColorsApp.whiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.beigeColor,
                    ),
                    onPressed: () {
                      ContactData newContact = ContactData(
                        contactName: textController.text,
                        contactEmail: emailController.text,
                        contactPhone: phoneController.text,
                        contactImage: _pickedImage?.path,
                      );
                      widget.enterUserClick(newContact);
                      Navigator.pop(context);

                    },
                    child: Text(
                      "Enter User",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: ColorsApp.navyColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

}
