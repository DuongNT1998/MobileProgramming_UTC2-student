import 'package:flutter/material.dart';
import '../utils/validators.dart';
import '../widgets/custom_text_field.dart';
import '../models/user_model.dart';

class RegisterFormView extends StatefulWidget {
  const RegisterFormView({super.key});

  @override
  State<RegisterFormView> createState() => _RegisterFormViewState();
}

class _RegisterFormViewState extends State<RegisterFormView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      UserModel user = UserModel(
        name: _usernameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Form is valid!')));

      print('User: ${user.name}, ${user.email}');
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// Username - Required + Custom Rule
              CustomTextField(
                label: 'Username',
                controller: _usernameController,
                validator: (value) => Validators.validateUsername(value),
              ),

              /// Email - Required + Regex
              CustomTextField(
                label: 'Email',
                controller: _emailController,
                validator: (value) => Validators.validateEmail(value),
              ),

              /// Password - Required + Length
              CustomTextField(
                label: 'Password',
                controller: _passwordController,
                isPassword: true,
                validator: (value) => Validators.validatePasswordLength(value),
              ),

              /// Confirm Password - Cross-field
              CustomTextField(
                label: 'Confirm Password',
                controller: _confirmPasswordController,
                isPassword: true,
                validator: (value) => Validators.validateConfirmPassword(
                  value,
                  _passwordController.text,
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
