
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project1/screens/home.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // var email = "fredrik@gmail.com";
  final formkey = GlobalKey<FormState>();

  bool isPasswordVisible = true;

  var emailcontroller = TextEditingController();

  var passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        title: Text(
          "Login Form",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        alignment: AlignmentGeometry.xy(0, 8),
        children: [
          Container(
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Container(
                width: 300,
                height: 480,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow:[ BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2), // Shadow color as I add opacity
                    offset: Offset(0, 12), // Horizontally how much and vertical shadow position
                    blurRadius: 10, // Softness of the shadow(how much blur)

                  )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Icon(Icons.account_circle, color: Colors.blue, size: 60),
                    // Text(
                    //   "LogIn",
                    //   style: TextStyle(
                    //     color: Colors.blue,
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 22,
                    //   ),
                    // ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(Icons.email_rounded, color: Colors.blue),
                        labelText: "Email",
                        hintText: "Hasnat123@gmail.com",
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please Enter the Email";
                        }
                        if(!EmailValidator.validate(value.trim())){
                          return "Please Enter the Correct Email";
                        }
                      },

                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: passcontroller,
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(Icons.lock, color: Colors.blue),
                        labelText: "Password",
                        hintText: "*********",
                        suffixIcon: InkWell(
                          onTap: (){

                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                            child: Icon(isPasswordVisible?Icons.visibility_outlined:Icons.visibility_off_outlined))
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                         return "Please Enter the Password";
                        }
                        if(value.length<8)
                          {
                            return "Password must be atleast 8 characters";
                          }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("forget password?",style: TextStyle(fontSize: 12,color: Colors.redAccent),),
                      ],
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                       if(formkey.currentState!.validate()){  // it not be nullable so we add ! here
                         Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                       }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.all(15),
                        minimumSize: Size(double.infinity, 55),
                      ),
                    ),
                    SizedBox(height: 5),
                    RichText(
                      text: TextSpan(
                        text: "If you have not account please ",style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "SignUp",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("or continue with",style: TextStyle(fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.google,color: Colors.redAccent,)),
                        IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.facebook,color: Colors.blue,)),
                        IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.github,)),

                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}