import 'dart:math';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app_setup.locator.dart';
import '../../../core/models/form/personal_data.dart';
import '../../../utils/date_formatter.dart';
import '../../../utils/split_helper.dart';
import '../../styles/styles.dart';
import '../../widgets/dp_widget.dart';
import '../../widgets/inputs/drop_down_input_field.dart';
import '../../widgets/inputs/search_item.dart';
import '../main_screen/view_model/main_screen_view_model.dart';
import 'widgets/database_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    String? dropdownValue = '40-50';
    List<String> items = [
      '40 - 50',
      '50 - 60',
      '60 - 70',
      '70 - 80',
      '80 - 90',
    ];
    return ViewModelBuilder<MainScreenViewModel>.reactive(
        viewModelBuilder: () => locator<MainScreenViewModel>(),
        onModelReady: (model) => model.getChildrenList(),
        builder: (context, model, _) {
          final DataTableSource _data = MyData(
            data:model.filteredChildrenList.isNotEmpty ||
                model.searchController.text.isNotEmpty
                ? model.filteredChildrenList :model.children,
            onSelectChanged: (value) => model.onClicked(value),
          );
          return Scaffold(
            backgroundColor: const Color(0xffFAF3F0),
            body: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        padding: const EdgeInsets.only(
                            left: 35, top: 70, bottom: 17),
                        child: Text(
                          'Email List',
                          style: databaseStyle10,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  padding: const EdgeInsets.only(
                      left: 30, top: 20, right: 30, bottom: 70),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: SearchItemInputField(
                          hintText: "Search Name",
                          controller: model.searchController,
                        ),
                      ),
                      Expanded(flex: 5, child: Container()),
                      DropdownInputField(
                        dropdownValue: dropdownValue,
                        items: items,
                        value: items[0],
                      ),
                      const SizedBox(width: 10),
                      DropdownInputField(
                        dropdownValue: dropdownValue,
                        items: items,
                        value: items[0],
                      ),
                      const SizedBox(width: 10),
                      DropdownInputField(
                        dropdownValue: dropdownValue,
                        items: items,
                        value: items[0],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: const EdgeInsets.only(left: 30, right: 20),
                            child: model.children.isEmpty
                                ? const CircularProgressIndicator()
                                : PaginatedDataTable(
                                    source: _data,
                                    columns: const [
                                      DataColumn(
                                        label: Text('Image'),
                                      ),
                                      DataColumn(
                                        label: Text('Name'),
                                      ),
                                      DataColumn(
                                        label: Text('PhoneNumber'),
                                      ),
                                      DataColumn(
                                        label: Text('Age'),
                                      ),
                                      DataColumn(
                                        label: Text('Employment'),
                                      ),
                                      DataColumn(
                                        label: Text('Worker Status'),
                                      ),
                                      DataColumn(
                                        label: Text('LGA'),
                                      ),
                                      DataColumn(
                                        label: Text('Members'),
                                      ),
                                      DataColumn(
                                        label: Text('Sen. District'),
                                      ),
                                      DataColumn(
                                        label: Text('Reg. Date'),
                                      ),
                                    ],
                                    columnSpacing: 10,
                                    horizontalMargin: 3,
                                    rowsPerPage: model.rowsPerPage,
                                    onRowsPerPageChanged: (index)=>model.changePage(index!),
                                    showCheckboxColumn: false,
                                  ),
                          ),
                        ),
                        model.onTap
                            ? const Expanded(
                                flex: 1,
                                child: DatabaseCard(),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
                // const Expanded(child: NumbersPage()),
              ],
            ),
          );
        });
  }
}

// The "soruce" of the table
class MyData extends DataTableSource {
  final List<PersonalDataForm> data;
  final ValueChanged<PersonalDataForm> onSelectChanged;

  MyData({required this.data, required this.onSelectChanged});

  // Generate some made-up data
  // final item = ChildrenModel.databaseDemos;
  // final List<Map<String, dynamic>> _data = List.generate(
  //     200,
  //     (index) => {
  //           "id": index,
  //           "title": "Item $index",
  //           "price": Random().nextInt(10000)
  //         });

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    return DataRow(
      onSelectChanged: (value) {
        if (value == true) {
          onSelectChanged(data[index]);
        }
      },
      cells: [
        DataCell(
          OADpImageWidget(
            imageUrl: data[index].imageUrl,
            placeholderAsset: 'assets/em.png',
          ),
        ),
        DataCell(Text(SplitHelper.getFullName(value: data[index].id))),
        DataCell(Text(data[index].phoneNumber ?? "No Phone number")),
        DataCell(
          Text(
            SplitHelper.getAge(data[index].dateOfBirth!),
          ),
        ),
        DataCell(Text(data[index].employmentStatus!)),
        const DataCell(Text("NIL")),
        DataCell(Text(data[index].localGovernment!)),
        const DataCell(Text("NIL")),
        DataCell(Text(data[index].senatorialDistrict!)),
        DataCell(
          Text(
            DateFormatter.dateFormatter(
              data[index].registrationDate,
            ),
          ),
        ),
      ],
    );
  }
}
