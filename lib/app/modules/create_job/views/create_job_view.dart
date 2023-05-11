import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_job_controller.dart';

class CreateJobView extends GetView<CreateJobController> {
  const CreateJobView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: CreateJobController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Create Job',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600),
                ),
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                backgroundColor: Color(0xffF8F8F8),
                shadowColor: Colors.transparent,
                centerTitle: true,
              ),
              backgroundColor: Color(0xffF8F8F8),
              body: Container(
                height: Get.height,
                width: Get.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Form(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Job Title',
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600),
                                    hintText: 'Enter Job Title',
                                    hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Job Description',
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600),
                                    hintText: 'Enter Job Description',
                                    hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Job Location',
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600),
                                    hintText: 'Enter Job Location',
                                    hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Job Salary',
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600),
                                    hintText: 'Enter Job Salary',
                                    hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Job Type',
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600),
                                    hintText: 'Enter Job Type',
                                    hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Job Category',
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600),
                                    hintText: 'Enter Job Category',
                                    hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              for (var i = 0;
                                  i < controller.TextFormFieldList.length;
                                  i++)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Question ${i + 1}',
                                      labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600),
                                      hintText: 'Enter Your Question',
                                      hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      icon: IconButton(
                                        onPressed: () {
                                          controller.removeTextFormField(i);
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                      
                                    ),
                                  ),
                                ),
                              IconButton(
                                  onPressed: () {
                                    controller.addTextFormField();
                                  },
                                  icon: Icon(Icons.add)),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Create Job'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
