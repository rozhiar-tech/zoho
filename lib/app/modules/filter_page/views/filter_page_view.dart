import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/filter_page_controller.dart';

class FilterPageView extends GetView<FilterPageController> {
  const FilterPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: FilterPageController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Filter',
                  style: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 26,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Search Bar Container
                        Container(
                          height: Get.height * 0.08,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: controller.searchController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search',
                                    hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Department',
                          style: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: Get.height * 0.08,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: Colors.white,
                              menuMaxHeight: Get.height * 0.3,
                              hint: const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Text(
                                  'Select Department',
                                  style: TextStyle(color: Colors.grey, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                                ),
                              ),
                              icon: const Icon(Icons.arrow_downward),
                              value: controller.selectedDepartment.value,
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              onChanged: (String? newValue) {
                                print(newValue);
                                controller.selectedDepartment.value = newValue!;
                              },
                              items: ['All', 'computer engineering', 'computer science', 'pharmacy', 'dentistry', 'civil', 'mls', 'business', 'english'].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Text(
                                      value,
                                      style: const TextStyle(color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Gender',
                          style: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: Get.height * 0.08,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: Colors.white,
                              menuMaxHeight: Get.height * 0.3,
                              value: controller.selectedGender.value,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              onChanged: (String? newValue) {
                                // controller.selectedCategory.value = newValue!;
                                controller.selectedGender.value = newValue!;
                              },
                              items: ['All', 'male', 'female', 'both'].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Text(
                                      value,
                                      style: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Salary',
                          style: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Minimum Salary",
                                  style: TextStyle(color: Colors.grey, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  controller.minValue.value.toString() + "\$",
                                  style: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                Text(
                                  "Maximum Salary",
                                  style: TextStyle(color: Colors.grey, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  controller.maxValue.value.toString() + "\$",
                                  style: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RangeSlider(
                          activeColor: Color(0xffBAE5F5),
                          inactiveColor: Colors.grey,
                          semanticFormatterCallback: (value) {
                            return '${value.round()} dollars';
                          },
                          values: controller.values,
                          onChanged: (RangeValues value) {
                            controller.values = value;
                            controller.maxValue.value = value.end;
                            controller.minValue.value = value.start;
                          },
                          min: 0,
                          max: 1000,
                          divisions: 1000,
                          labels: RangeLabels(
                            controller.minValue.value.toString() + "\$",
                            controller.maxValue.value.toString() + "\$",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Job Type',
                          style: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: Get.height * 0.08,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: Colors.white,
                              menuMaxHeight: Get.height * 0.3,
                              value: controller.selectedJobType.value,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              onChanged: (String? newValue) {
                                // controller.selectedCategory.value = newValue!;
                                controller.selectedJobType.value = newValue!;
                              },
                              items: ['All', 'Remote', 'Parttime', 'Fulltime'].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Text(
                                      value,
                                      style: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              controller.getToFilteredJobs(controller.selectedGender.value, controller.selectedDepartment.value, controller.selectedJobType.value);
                            },
                            child: Text('Apply Filters'),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff222222),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              minimumSize: Size(Get.width * 0.9, Get.height * 0.07),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}
