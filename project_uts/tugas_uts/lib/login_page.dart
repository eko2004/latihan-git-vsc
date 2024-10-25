import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'home_page.dart';
import 'register_page.dart'; // Import daftar pengguna yang diregistrasi

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        backgroundColor: Colors.blueAccent,
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40,),
          
                const Icon(Icons.person, size: 80,),
          
                const SizedBox(height: 20,),
          
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Email is required'),
                    EmailValidator(errorText: 'Enter a valid email address'),
                  ]).call,
                ),
          
                const SizedBox(height: 20,),
          
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                  obscureText: true,
                  validator: RequiredValidator(errorText: 'Password is required').call,
                ),
          
                const SizedBox(height: 40),
                
                ElevatedButton(
                  onPressed: () {
                    // print(_formKey);
                    if (_formKey.currentState!.validate()) {
                      bool loginSuccess = false;
                      String? fullname;
          
                      // Periksa apakah pengguna sudah terdaftar
                      for (var user in registeredUsers) {
                        if (user.email == _emailController.text &&
                            user.password == _passwordController.text) {
                          loginSuccess = true;
                          fullname = user.fullName;
                          break;
                        }
                      }
          
                      if (loginSuccess) {
                        // Jika berhasil login, arahkan ke halaman homepage dengan fullname
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage(fullname: fullname.toString())),
                        );
                      } else {
                        // Jika login gagal, tampilkan pesan error
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Invalid email or password')),
                        );
                      }
                    }
                  },
                  child: const Text("Login"),
                ),
                
                const SizedBox(height: 20,),
                
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text("Don't have an account? Register here"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}