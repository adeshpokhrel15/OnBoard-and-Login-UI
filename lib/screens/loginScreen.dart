import 'package:firstday/provider/loginProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class loginScreen extends StatefulWidget {
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final nameController = TextEditingController();

  final mailController = TextEditingController();

  final passwordController = TextEditingController();

  final contactController = TextEditingController();

  final _form = GlobalKey<FormState>();

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Consumer(builder: (context, ref, child) {
        final isLogin = ref.watch(loginProvider);

        return Form(
            key: _form,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.network(
                        'https://th.bing.com/th/id/R.4822952e38a1ac9c0ebe18fda32cf2ef?rik=svjEbeCOyZ0rcA&pid=ImgRaw&r=0',
                        height: 260,
                        width: double.infinity,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Center(
                        child: Text(
                          'Welcome to LemonPie! ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Center(
                        child: Text(
                          'Keep your data safe',
                          style: TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      if (isLogin == false)
                        TextFormField(
                          controller: nameController,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              hintText: 'Username'),
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: mailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: 'Email'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: _isObscure,
                        controller: passwordController,
                        //obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            hintText: 'Password'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      if (isLogin == false)
                        TextFormField(
                          controller: contactController,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              hintText: 'Contact'),
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0)),
                          elevation: 5.0,
                          child: Text('Login'),
                          color: Color(0xFF00a2e8),
                          textColor: Colors.black,
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(color: Colors.red),
                          )),
                      Row(
                        children: [
                          Text(isLogin
                              ? 'Don\'t have account ?'
                              : 'Already have an account ?'),
                          TextButton(
                              onPressed: () {
                                ref.read(loginProvider.notifier).toggle();
                              },
                              child: Text(
                                isLogin ? 'Register' : 'Login',
                                style: TextStyle(color: Colors.red),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
      })),
    );
  }
}
