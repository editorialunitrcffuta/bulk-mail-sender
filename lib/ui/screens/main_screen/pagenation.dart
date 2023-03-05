// import 'package:flutter/material.dart';
// import 'package:number_paginator/number_paginator.dart';
//
// class NumbersPage extends StatefulWidget {
//   const NumbersPage({Key? key}) : super(key: key);
//
//   @override
//   _NumbersPageState createState() => _NumbersPageState();
// }
//
// class _NumbersPageState extends State<NumbersPage> {
//   final int _numPages = 10;
//   int _currentPage = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     var pages = List.generate(
//       _numPages,
//       (index) => Center(
//         child: Text(
//           "Page ${index + 1}",
//           style: Theme.of(context).textTheme.headline1,
//         ),
//       ),
//     );
//
//     return Scaffold(
//       //body: pages[_currentPage],
//       // card for elevation
//       bottomNavigationBar: Card(
//         margin: EdgeInsets.zero,
//         elevation: 4,
//         child: NumberPaginator(
//           // by default, the paginator shows numbers as center content
//           numberPages: _numPages,
//           onPageChange: (int index) {
//             setState(() {
//               _currentPage = index;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
//   int? _sortColumnIndex;
//   bool _sortAscending = true;
//
//   final List<DataRow> _data = [
//     const DataRow(cells: [
//       DataCell(Text('A1')),
//       DataCell(Text('B1')),
//       DataCell(Text('C1')),
//     ]),
//     DataRow(cells: [
//       DataCell(Text('A2')),
//       DataCell(Text('B2')),
//       DataCell(Text('C2')),
//     ]),
//     // Add more rows...
//   ];
//
//   void _sort<T>(
//       Comparable<T> getField(DataRow d), int columnIndex, bool ascending) {
//     _data.sort((DataRow a, DataRow b) {
//       if (!ascending) {
//         final DataRow c = a;
//         a = b;
//         b = c;
//       }
//       final Comparable<T> aValue = getField(a);
//       final Comparable<T> bValue = getField(b);
//       return Comparable.compare(aValue, bValue);
//     });
//     setState(() {
//       _sortColumnIndex = columnIndex;
//       _sortAscending = ascending;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PaginatedDataTable(
//         header: Text('Table with pagination'),
//         rowsPerPage: _rowsPerPage,
//         onRowsPerPageChanged: (int? value) {
//           setState(() {
//             _rowsPerPage = value!;
//           });
//         },
//         sortColumnIndex: _sortColumnIndex,
//         sortAscending: _sortAscending,
//         // onSort: (int columnIndex, bool ascending) => _sort<String>(
//         //     (DataRow d) => d.cells[columnIndex].widget.toString(),
//         //     columnIndex,
//         //     ascending),
//         columns: const [
//           DataColumn(label: Text('Column A')),
//           DataColumn(label: Text('Column B')),
//           DataColumn(label: Text('Column C')),
//         ],
//         source: DataTableSource.fromDataRows(_data),
//       ),
//     );
//   }
// }
