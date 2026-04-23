import 'package:flutter/material.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollController = TextEditingController();
  final TextEditingController regController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();

  String bloodGroup = "";
  String gender = "";

  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Form", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Enter your name",
                labelStyle: const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w500),
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: rollController,
                    decoration: InputDecoration(
                      labelText: "Roll",
                      labelStyle: const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w500),
                      prefixIcon: Icon(Icons.confirmation_number),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: TextFormField(
                    controller: regController,
                    decoration: InputDecoration(
                      labelText: "Registration No",
                      labelStyle: const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w500),
                      prefixIcon: Icon(Icons.account_circle),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),

            DropdownButtonFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.bloodtype, color: const Color.fromRGBO(203, 11, 11, 1)),
                labelText: "Blood Group",
                labelStyle: const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w500),
                border: OutlineInputBorder(),
              ),

              items: [
                DropdownMenuItem(value: "A+", child: Text("A+")),
                DropdownMenuItem(value: "B+", child: Text("B+")),
                DropdownMenuItem(value: "O+", child: Text("O+")),
                DropdownMenuItem(value: "AB+", child: Text("AB+")),
                DropdownMenuItem(value: "A-", child: Text("A-")),
                DropdownMenuItem(value: "B-", child: Text("B-")),
                DropdownMenuItem(value: "O-", child: Text("O-")),
                DropdownMenuItem(value: "AB-", child: Text("AB-")),
              ],

              onChanged: (val) {
                setState(() {
                  bloodGroup = val!;
                });
              },
            ),

            SizedBox(height: 15),

            Row(
              children: [
                Text("Gender:", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blueGrey)),

                Radio(
                  value: "Male",
                  groupValue: gender,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    setState(() {
                      gender = val!;
                    });
                  },
                ),
                Text("Male"),

                Radio(
                  value: "Female",
                  groupValue: gender,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    setState(() {
                      gender = val!;
                    });
                  },
                ),
                Text("Female"),
              ],
            ),

            SizedBox(height: 15),

            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: "Phone",
                labelStyle: const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w500),
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            TextFormField(
              controller: aboutController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "About Me",
                labelStyle: const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w500),
                prefixIcon: Icon(Icons.info_outline),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  result =
                      "Name: ${nameController.text}\n"
                      "Roll: ${rollController.text}\n"
                      "Registration: ${regController.text}\n"
                      "Blood Group: $bloodGroup\n"
                      "Gender: $gender\n"
                      "Phone: ${phoneController.text}\n"
                      "About: ${aboutController.text}";

                  nameController.clear();
                  rollController.clear();
                  regController.clear();
                  phoneController.clear();
                  aboutController.clear();
                  bloodGroup = "";
                  gender = "";
                });
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 59, 165, 62),
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(width: 16),
                  Icon(Icons.send, color: Colors.white),
                ],
              ),
            ),

            SizedBox(height: 25),

            if (result != "")
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [Colors.green.shade50, Colors.white],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.badge, color: Colors.green),
                          SizedBox(width: 10),
                          Text(
                            "Submitted Data",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 25, thickness: 1),
                      Text(
                        result,
                        style: const TextStyle(
                          fontSize: 15,
                          height: 1.8,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
