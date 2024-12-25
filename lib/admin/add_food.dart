import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro/service/database.dart';
import 'package:random_string/random_string.dart';
import 'package:pro/widget/widget_support.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  final List<String> items = ['Ice-cream', 'Burger', 'Salad', 'Pizza'];
  String? value;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File ? SelectedImage;
  final _formKey = GlobalKey<FormState>();

  Future getImage() async{
    var image = await _picker.pickImage(source: ImageSource.gallery);
    SelectedImage = File(image!.path);
    setState(() {});
  }

  uploadItem() async {
    if(SelectedImage != null && nameController.text.isNotEmpty && priceController.text.isNotEmpty && detailsController.text.isNotEmpty && value != null){
      String addId = randomAlphaNumeric(10);

      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child("bloImages").child(addId);
      final UploadTask task = firebaseStorageRef.putFile(SelectedImage!);

      var downloadUrl = await(await task).ref.getDownloadURL();
      Map<String, dynamic> addItem = {
        "Image": downloadUrl,
        "Name": nameController.text,
        "Price": priceController.text,
        "Details": detailsController.text
      };
      await DatabaseMethod().addFoodItem(addItem, value!).then((value){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Food Item has been added Successfully",
              style: TextStyle(fontSize: 18.0),
            )));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Please fill all fields and upload an image",
            style: TextStyle(fontSize: 18.0),
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xFF373866),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Add Item",
          style: AppWidget.headlineTextFeildStyle(),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 30.0),
        child: SingleChildScrollView( // Added to prevent overflow
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Upload the Item Picture",
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
                const SizedBox(height: 20.0),
                SelectedImage == null ?
                GestureDetector(
                  onTap: (){
                    getImage();
                  },
                  child: Center(
                    child: Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ) :
                Center(
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          SelectedImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                Text(
                  "Item Price",
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(0XFFececf8),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: priceController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Item Price",
                      hintStyle: AppWidget.LightTextFeildStyle(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter item price';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30.0),
                Text(
                  "Item Name",
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(0XFFececf8),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Item Name",
                      hintStyle: AppWidget.LightTextFeildStyle(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter item name';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30.0),
                Text(
                  "Item Details",
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(0XFFececf8),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    maxLines: 6,
                    controller: detailsController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Item Details",
                      hintStyle: AppWidget.LightTextFeildStyle(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter item details';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: items
                        .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ))
                        .toList(),
                    onChanged: (selectedValue) {
                      setState(() {
                        value = selectedValue;
                      });
                    },
                    dropdownColor: Colors.white,
                    hint: const Text("Select Category"),
                    value: value,
                    iconSize: 36,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                GestureDetector(
                  onTap: () {
                    uploadItem();
                  },
                  child: Center(
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Add",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
