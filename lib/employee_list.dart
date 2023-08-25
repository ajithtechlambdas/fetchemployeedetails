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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Employeelist'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {

                if (snapshot.hasData ||
                    snapshot.connectionState == ConnectionState.done) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EmployeeDetail(employeeListModel: snapshot.data![index]),
                                  ));
                            },
                            title: Text('${snapshot.data![index].employeeName}',
                                style: GoogleFonts.poppins(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                            subtitle: Text('${snapshot.data![index].city}'),
                            leading: Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(100)),
                                child: const Icon(Icons.person_rounded)),
                          );
                        }),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const Center(
                    child: Text('No Data'),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
