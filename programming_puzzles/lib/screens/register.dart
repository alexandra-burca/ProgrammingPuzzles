import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:programming_puzzles/api_connection/api_connection.dart';
import 'package:programming_puzzles/models/user.dart';
import 'package:programming_puzzles/widgets/backbutton.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObscure = true.obs;

  RegisterScreen({super.key});

  validateUserEmail() async
  {
    try {
      var res = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'email': emailController.text.trim(),
        }
        );

        if (res.statusCode == 200){
          var resBody = jsonDecode(res.body);

          if (resBody['emailFound'] == true) {
            Fluttertoast.showToast(msg: "Adresa de email este deja folosită.");
          }
          else{
            registerUser();

          }

        }
    }

    catch(e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());

    }

  }

  registerUser() async {
    User userModel = User(
      1,
      nameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim(),

    );

    try{
      var res = await http.post(
        Uri.parse(API.signup),
        body: userModel.toJson(),
      );

      if (res.statusCode == 200){
        var resBody = jsonDecode(res.body);

        if (resBody['success'] == true) {
          Fluttertoast.showToast(msg: "Contul a fost creat cu succes!");
        }
        else
        {
          Fluttertoast.showToast(msg: "A aparut o eroare la crearea contului.");
        }
      }
    }

    catch(e) {
      print(e.toString());
      Fluttertoast.showToast(msg: "Contul a fost creat cu succes!");

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

              Row (
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 5.0),
                child: BackButtonWidget(
                  onPressed: () {
                    
                    Navigator.of(context).pop();
                  },
                ),
                ),
              ],
              ),

              const SizedBox(height: 0),
              Image.asset(
                'assets/images/register.png',
                height: 280,
                width: 280,
              ),
              const SizedBox(height: 20),
              // Register text
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column (
                      children: [

                        //name
                        TextFormField(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),

                          controller: nameController,
                          validator: (val) => val == "" ? "Trebuie sa introduci numele" : null,
                          decoration: InputDecoration(
                            prefixIcon: const Icon (
                              Icons.person_outline,
                              color: Colors.pink,
                            ),
                            hintText: "Nume",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                          ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                          ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                          ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                          ),
                            contentPadding: const EdgeInsets.all(18),
                          ),
                        ),
                        
                        const SizedBox(height: 12),

                        //email
                        TextFormField(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),

                          controller: emailController,
                          validator: (val) => val == "" ? "Trebuie sa introduci email-ul" : null,
                          decoration: InputDecoration(
                            prefixIcon: const Icon (
                              Icons.email,
                              color: Colors.pink,
                            ),
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                          ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                          ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                          ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                          ),
                            contentPadding: const EdgeInsets.all(18),
                          ),
                        ),

                        const SizedBox(height: 12),

                        //password
                        Obx(
                          () => TextFormField(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                          controller: passwordController,
                          obscureText: isObscure.value,
                          validator: (val) => val == "" ? "Trebuie sa introduci parola" : null,
                          decoration: InputDecoration(
                            prefixIcon: const Icon (
                              Icons.password,
                              color: Colors.pink,
                              
                            ),
                            suffixIcon: Obx(
                              ()=> GestureDetector(
                                onTap: ()
                                {
                                  isObscure.value = !isObscure.value;

                                },
                                child: Icon(
                                  isObscure.value ? Icons.visibility_off : Icons.visibility,
                                  color: Colors.pink[200],
                                )
                              ),
                              ),
                            hintText: "Parolă",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                          ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                          ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                          ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                          ),
                            contentPadding: const EdgeInsets.all(18),
                          ),
                        ),
                          
                          ),

                      ],
                      ),
                  ),
                ],
              ),
            ),
              
              
              const SizedBox(height: 70),
              ElevatedButton(
                onPressed: () {
                  //register
                  if(formKey.currentState!.validate()) {
                    //validate email
                    registerUser();

                  }

                },
                child: Text('Creare cont'),
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[200],
                foregroundColor: Colors.black, 
                fixedSize: Size(260, 58),
                textStyle: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Poppins',
                ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

