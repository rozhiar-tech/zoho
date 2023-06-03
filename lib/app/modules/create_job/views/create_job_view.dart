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
            title: Text(
              controller.title.value,
              style: const TextStyle(color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
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
                    padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10, bottom: 5),
                    child: Form(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 75, // set the desired height
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: TextFormField(
                                controller: controller.jobTitleController,
                                decoration: const InputDecoration(
                                  labelText: 'Job Title',
                                  labelStyle: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w600),
                                  hintText: 'Enter Job Title',
                                  hintStyle: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w300),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 75, // set the desired height
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: TextFormField(
                                controller: controller.jobDescriptionController,
                                decoration: const InputDecoration(
                                  labelText: 'Job Description',
                                  labelStyle: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w600),
                                  hintText: 'Enter Job Description',
                                  hintStyle: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w300),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 75, // set the desired height
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7.0),
                              child: TextFormField(
                                controller: controller.jobCompanyIdController,
                                enabled: false,
                                decoration: const InputDecoration(
                                  labelText: 'Company ID',
                                  labelStyle: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w600),
                                  hintText: 'Company ID',
                                  hintStyle: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w300),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 75, // set the desired height
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: DropdownButtonFormField(
                                // value: controller.jobTypeController.text,
                                items: const [
                                  DropdownMenuItem(
                                    value: 'FullTime',
                                    child: Text('FullTime', style: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w600)),
                                  ),
                                  DropdownMenuItem(
                                    value: 'PartTime',
                                    child: Text('PartTime', style: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w600)),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Remote',
                                    child: Text('Remote', style: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w600)),
                                  ),
                                ],
                                onChanged: (value) {
                                  controller.jobTypeController.text = value.toString();
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Type',
                                  labelStyle: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w600),
                                  hintText: 'Type',
                                  hintStyle: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w300),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 75, // set the desired height
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: DropdownButtonFormField(
                                // value: controller.jobTypeController.text,
                                items: const [
                                  DropdownMenuItem(
                                    value: 'male',
                                    child: Text('male', style: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w600)),
                                  ),
                                  DropdownMenuItem(
                                    value: 'female',
                                    child: Text('female', style: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w600)),
                                  ),
                                  DropdownMenuItem(
                                    value: 'both',
                                    child: Text('both', style: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w600)),
                                  ),
                                ],
                                onChanged: (value) {
                                  controller.jobGenderController.text = value.toString();
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Gender',
                                  labelStyle: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w600),
                                  hintText: 'Gender',
                                  hintStyle: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w300),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 75, // set the desired height
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: TextFormField(
                                controller: controller.jobExpirationController,
                                decoration: const InputDecoration(
                                  labelText: 'Expiration',
                                  labelStyle: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w600),
                                  hintText: 'Expiration',
                                  hintStyle: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w300),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 75, // set the desired height
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: DropdownButtonFormField(
                                // value: controller.jobTypeController.text,
                                items: [
                                  for (var item in controller.departments)
                                    DropdownMenuItem(
                                      value: item,
                                      child: Text(item, style: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w600)),
                                    ),
                                ],
                                onChanged: (value) {
                                  controller.jobDepartmentIdController.text = value.toString();
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Department',
                                  labelStyle: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w600),
                                  hintText: 'Department',
                                  hintStyle: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w300),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: controller.height.value,
                            padding: const EdgeInsets.only(top: 5.0, right: 5.0, bottom: 5.0),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 230, 227, 227),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: ListView.builder(
                              itemCount: controller.textFormFieldList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: TextFormField(
                                    controller: controller.controllers[index],
                                    decoration: InputDecoration(
                                      labelText: 'Question ${index + 1}',
                                      labelStyle: const TextStyle(color: Colors.black, fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w600),
                                      hintText: 'Enter Your Question',
                                      hintStyle: const TextStyle(color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                      icon: IconButton(
                                        onPressed: () {
                                          controller.removeTextFormField(index);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.addTextFormField();
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: controller.createJob,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('Create Job'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
