// import 'package:flutter/material.dart';
// import 'package:go_router_data_table_study/syncfusion_datagrid/data_source.dart';
// import 'package:go_router_data_table_study/syncfusion_datagrid/model.dart';




//   late EmployeeDataSource employeeDataSource;

// List<Employee> employees = <Employee>[];


// @override
// void initState() {
//   // super.initState();
  
//   employees = getEmployeeData();
//   employeeDataSource = EmployeeDataSource(employees: employees);
//   //  
// }

// List<Employee> getEmployeeData() {
//   return [
//     Employee(10001, 'James', 'Project Lead', 20000),
//     Employee(10002, 'Kathryn', 'Manager', 30000),
//     Employee(10003, 'Lara', 'Developer', 15000),
//     Employee(10004, 'Michael', 'Designer', 15000),
//     Employee(10005, 'Martin', 'Developer', 15000),
//     Employee(10006, 'Newberry', 'Developer', 15000),
//     Employee(10007, 'Balnc', 'Developer', 15000),
//     Employee(10008, 'Perry', 'Developer', 15000),
//     Employee(10009, 'Gable', 'Developer', 15000),
//     Employee(10010, 'Grimes', 'Developer', 15000)
//   ];
// }


// // @override
// // Widget build(BuildContext context) {
// //   return Scaffold(
// //       body: SfDataGrid(
// //     source: employeeDataSource,
// //     columns: [
// //       GridColumn(
// //           columnName: 'id',
// //           label: Container(
// //               padding: EdgeInsets.symmetric(horizontal: 16.0),
// //               alignment: Alignment.centerRight,
// //               child: Text(
// //                 'ID',
// //                 overflow: TextOverflow.ellipsis,
// //               ))),
// //       GridColumn(
// //           columnName: 'name',
// //           label: Container(
// //               padding: EdgeInsets.symmetric(horizontal: 16.0),
// //               alignment: Alignment.centerLeft,
// //               child: Text(
// //                 'Name',
// //                 overflow: TextOverflow.ellipsis,
// //               ))),
// //       GridColumn(
// //           columnName: 'designation',
// //           label: Container(
// //               padding: EdgeInsets.symmetric(horizontal: 16.0),
// //               alignment: Alignment.centerLeft,
// //               child: Text(
// //                 'Designation',
// //                 overflow: TextOverflow.ellipsis,
// //               ))),
// //       GridColumn(
// //           columnName: 'salary',
// //           label: Container(
// //               padding: EdgeInsets.symmetric(horizontal: 16.0),
// //               alignment: Alignment.centerRight,
// //               child: Text(
// //                 'Salary',
// //                 overflow: TextOverflow.ellipsis,
// //               )))
// //     ],
// //     selectionMode: SelectionMode.multiple,
// //   ));
// // }
