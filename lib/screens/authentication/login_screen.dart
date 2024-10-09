import 'package:flutter/material.dart';
import 'package:upalerts/appAssets/assets.dart';
import 'package:upalerts/res/res.dart';
import 'package:upalerts/routes/routes.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
   
    super.dispose();
  }

  // Function to validate email
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegExp.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // Function to validate passwords
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
       router.go(Routes.onDashboard);
    }
         

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20,vertical:getHeight()*0.002),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
               
                // Logo or icon
                Center(
                  child: Image.asset(Assets.companyLogo, height: getHeight() * 0.035),
                ),
                
                const SizedBox(height: 20),

                // Title
                const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                      Text(
                        'Welcome Back 👋',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 5),
                
                // Subtitle
                const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                
                const SizedBox(height: 40),

                // Email field
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    floatingLabelStyle: const TextStyle(color: Colors.green),
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                  ),
                  validator: _validateEmail,
                ),

                const SizedBox(height: 20),

                // Password field
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    floatingLabelStyle: const TextStyle(color: Colors.green),
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                  ),
                  validator: _validatePassword,
                ),

                const SizedBox(height: 30),
                // Register button
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shadowColor: Colors.white,
                    splashFactory: InkSparkle.splashFactory,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),

                const SizedBox(height: 30),

                // Divider and social login text
                const Row(
                  children: [
                    Expanded(child: Divider(thickness: 1)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Or continue with social account',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(child: Divider(thickness: 1)),
                  ],
                ),

                const SizedBox(height: 20),

                // Social buttons (Google, Facebook)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: getWidth() * 0.02, vertical: getHeight() * 0.005),
                        side: const BorderSide(color: Color.fromARGB(255, 234, 234, 234)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: Image.asset(
                        Assets.googleIcon,
                        height: 24,
                        width: 24,
                      ),
                      label: const Text(
                        'Google',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: getWidth() * 0.02, vertical: getHeight() * 0.005),
                        side: const BorderSide(color: Color.fromARGB(255, 234, 234, 234)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: Image.asset(
                        Assets.facebookIcon,
                        height: 24,
                        width: 24,
                      ),
                      label: const Text(
                        'Facebook',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),

              SizedBox(height:getHeight()*0.01),
                
              // Already have an account text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to register
                      router.go(Routes.onRegisterRoute);
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}