class ContactData {
  String contactName;
 String contactEmail;
 String contactPhone;
 String ?contactImage;

  ContactData({
    required this.contactName,
    required this.contactEmail,
    this.contactImage,
    required this.contactPhone,
  });
}
