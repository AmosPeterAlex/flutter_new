// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';



// class DesktopDataGrid extends StatefulWidget {
//   const DesktopDataGrid({super.key});

//   @override
//   State<DesktopDataGrid> createState() => DesktopDataGridState();
// }

// class DesktopDataGridState extends State<DesktopDataGrid> {
//   late List<Teacher> _teacherlist;
//   late ConvertedTeacherData _convertedTeacherData;

//   @override
//   void initState() {
//     _teacherlist = getTeacher(); // fetching data to UI
//     _convertedTeacherData = ConvertedTeacherData(_teacherlist);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SfDataGrid(
//           source: _convertedTeacherData,
//           columns: [
//             GridColumn(
//               columnName: 'id',
//               label: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   'ID',
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ),
//             GridColumn(
//               columnName: 'name',
//               label: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Name',
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ),
//             GridColumn(
//               columnName: 'subject',
//               label: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Subject',
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ),
//             GridColumn(
//               columnName: 'salary',
//               label: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   'Salary',
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // static data
//   List<Teacher> getTeacher() {
//     return [
//       Teacher(1, "Sajin", "Dot Net", 12000),
//       Teacher(2, "Sreejith", "Python", 10000),
//       Teacher(3, "Amos", "Data Science", 13000),
//       Teacher(4, "Akarsh", "Java", 12500),
//       Teacher(5, "Nitha", "Flutter", 25000),
//       Teacher(6, "Nasri", "C", 16000),
//       Teacher(7, "Safa", "C++", 14000),
//       Teacher(8, "Anand", "MERN", 17000),
//       Teacher(9, "Anuvind", "Rust", 16500),
//       Teacher(10, "Jabbar", "Cyber Security", 50000),
//     ];
//   }
// }

// // model
// class Teacher {
//   Teacher(this.id, this.name, this.subject, this.salary);
//   final int id;
//   final String name;
//   final String subject;
//   final double salary;
// }

// // Data Conversion for UI
// class ConvertedTeacherData extends DataGridSource {
//   ConvertedTeacherData(List<Teacher> teacher) {
//     datagridrow = teacher
//         .map<DataGridRow>((teacher) => DataGridRow(cells: [
//               DataGridCell<int>(columnName: 'id', value: teacher.id),
//               DataGridCell<String>(columnName: 'name', value: teacher.name),
//               DataGridCell<String>(
//                   columnName: 'subject', value: teacher.subject),
//               DataGridCell<double>(columnName: 'salary', value: teacher.salary),
//             ]))
//         .toList();
//   }

//   late List<DataGridRow> datagridrow;
//   @override
//   List<DataGridRow> get rows => datagridrow;

//   @override
//   DataGridRowAdapter? buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//       cells: row.getCells().map<Widget>((datagridcell) {
//         return Container(
//           padding: EdgeInsets.symmetric(horizontal: 8.0),
//           alignment: Alignment.center,
//           color: Colors.teal.withOpacity(0.2),
//           child: Text(
//             datagridcell.value.toString(),
//             overflow: TextOverflow.ellipsis,
//           ),
//         );
//       }).toList(),
//     );
//   }
// }