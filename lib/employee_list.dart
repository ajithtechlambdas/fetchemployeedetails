import 'package:employeedetails_learning/employee_detail.dart';
import 'package:employeedetails_learning/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Employeelist extends StatefulWidget {
  const Employeelist({super.key});

  @override
  State<Employeelist> createState() => _EmployeelistState();
}

class _EmployeelistState extends State<Employeelist> {
  Future<List<EmployeeListModel>> getData() async {
    var response =
        await http.get(Uri.parse('http://89.116.231.138:8087/employee'));
    return employeeListModelFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Employeelist')),
        body: _buildBodyWidget(),
      ),
    );
  }

  _buildBodyWidget() {
    return Center(
      child: Column(
        verticalDirection: VerticalDirection.down,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [_buildFutureBuilderWidget()],
      ),
    );
  }

  _buildBoxDecoration() {
    BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 5,
              blurStyle: BlurStyle.outer,
              color: Colors.grey,
              spreadRadius: BorderSide.strokeAlignOutside)
        ]);
  }

  _buildListTileLeadingWidget() {
    return Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(100)),
        child: const Icon(Icons.person_rounded));
  }

  _buildFutureBuilderWidget() {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData ||
            snapshot.connectionState == ConnectionState.done) {
          return Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 5,
                              blurStyle: BlurStyle.outer,
                              color: Colors.grey,
                              spreadRadius: BorderSide.strokeAlignOutside)
                        ]),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmployeeDetail(
                                  employeeListModel: snapshot.data![index]),
                            ));
                      },
                      title: Text('${snapshot.data![index].employeeName}',
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                      subtitle: Text('${snapshot.data![index].city}'),
                      leading: _buildListTileLeadingWidget(),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 18);
              },
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(
            child: Text('No Data'),
          );
        }
      },
    );
  }
}
