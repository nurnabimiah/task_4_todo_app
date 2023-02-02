
import 'package:flutter/material.dart';
import 'package:task_4_todo/models/contact.dart';
import 'package:task_4_todo/styles/app_button_style.dart';
import 'package:task_4_todo/styles/my_drawer.dart';
import 'package:task_4_todo/styles/snackbar_message.dart';
import 'package:task_4_todo/widgets/background_image.dart';

import '../styles/text_formfiled_input_decoration.dart';


class ContactListScreen extends StatefulWidget {
  const ContactListScreen({Key? key}) : super(key: key);

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  List<ContactModel> contacts = List.empty(growable: true);

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(context),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Contacts List'),
      ),
      body: BackgroundImage(
        child: Padding(
          padding: const EdgeInsets.only(left:16,right: 16,top: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextFormField(
                controller: nameController,
                decoration: textFormFiledInputDecoration('Contact Name'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: contactController,
                keyboardType: TextInputType.number,
                maxLength: 15,
                decoration: textFormFiledInputDecoration('Contact Number'),
              ),
              const SizedBox(height: 10),




              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: AppButtonStyle(),

                      onPressed: () {
                        String name = nameController.text;
                        String contact = contactController.text;
                        if (name.isNotEmpty && contact.isNotEmpty) {
                          setState(() {
                            nameController.text = '';
                            contactController.text = '';
                            contacts.add(ContactModel(name: name, contact: contact));
                          });

                        }

                        //
                      },
                      child: const Text('Save',style: TextStyle(fontSize: 16),)),
                  ElevatedButton(
                    style: AppButtonStyle(),
                      onPressed: () {
                        //
                        String name = nameController.text.trim();
                        String contact = contactController.text.trim();
                        if (name.isNotEmpty && contact.isNotEmpty) {
                          setState(() {
                            nameController.text = '';
                            contactController.text = '';
                            contacts[selectedIndex].name = name;
                            contacts[selectedIndex].contact = contact;
                            selectedIndex = -1;
                          });
                        }
                        //
                      },
                      child: const Text('Update',style: TextStyle(fontSize: 16),)),
                ],
              ),
              const SizedBox(height: 10),
              contacts.isEmpty
                  ? const Text(
                'No Contact yet..',
                style: TextStyle(fontSize: 22),
              )
                  : Expanded(
                child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) => getRow(index),
                ),
              )
            ],
          ),
        ),

      ),
    );
  }











  Widget getRow(int index) {
    return Card(
      color: Colors.white70,
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
             foregroundColor: Colors.white,
          child: Text(
            contacts[index].name[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contacts[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(contacts[index].contact),
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    nameController.text = contacts[index].name;
                    contactController.text = contacts[index].contact;
                    setState(() {
                      selectedIndex = index;

                    });

                  },
                  child: const Icon(Icons.edit_note_sharp,color: Colors.red)),
              InkWell(
                  onTap: (() {
                    showDialog(
                        context: context,
                        builder:(BuildContext context){
                          return Expanded(
                              child:AlertDialog(
                                elevation: 3,
                                backgroundColor: Colors.white,
                                title: Text('Alert !',style: TextStyle(color: Colors.red),),
                                content: Text('Do you want to delete ?'),
                                actions: [
                                  TextButton(onPressed: (){
                                   setState((){
                                     contacts.removeAt(index);
                                     MySnackBar('Delete Success', context);
                                   });
                                    Navigator.pop(context);
                                  }, child: Text('Yes',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
                                  TextButton(onPressed: (){Navigator.pop(context);}, child: Text('No',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
                                ],
                              )
                          );
                        }
                    );

                   /* setState(() {
                      contacts.removeAt(index);
                    });*/
                    //
                  }),
                  child: const Icon(Icons.delete,color: Colors.red,)),
            ],
          ),
        ),
      ),
    );
  }
}
