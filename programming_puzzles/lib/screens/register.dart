import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObscure = true.obs;

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              const SizedBox(height: 50),
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
              
              
              const SizedBox(height: 80),
              ElevatedButton(
                onPressed: () {
                  //register
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

