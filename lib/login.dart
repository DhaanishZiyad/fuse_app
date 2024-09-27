import 'package:flutter/material.dart';
import 'package:fuse_app/layout.dart';
import 'package:fuse_app/signup.dart'; // Import the AppLayout page

class Login extends StatelessWidget {
  static final String id = "Login"; // Define the static 'id' variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(height: 20), // Add some space between the text and text field
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300, // Adjust width to control the size of the TextField
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Username",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),// Default border color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 2.0), // Border color when enabled but not focused
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0), // Border color when focused
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Add space between the text field and button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300, // Adjust width to control the size of the TextField
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey), // Default border color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.teal, width: 2.0), // Border color when enabled but not focused
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0), // Border color when focused
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Add space between the text field and button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Button background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners with radius 8
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Padding inside the button
                ),
                child: Text(
                  'Log In',
                  style: TextStyle(color: Colors.white), // Text color
                ),
                onPressed: () {
                  // Navigate to AppLayout and ensure it's the initial route
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppLayout(onToggleTheme: () {}, initialIndex: 1),
                    ),
                  );
                },
              ),
              SizedBox(width: 20), // Add space between the two buttons
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Button background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners with radius 8
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Padding inside the button
                ),
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white), // Text color
                ),
                onPressed: () {
                  // Navigate to AppLayout and ensure it's the initial route
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Signup(),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
