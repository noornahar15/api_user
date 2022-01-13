import 'package:api_use/json/api_link.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final List<ApiLink> apiLinkList;
  final bool isLoading;

  const LoginPage({
    Key? key,
    required this.apiLinkList,
    required this.isLoading,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool hidePhone = true;

  @override
  Widget build(BuildContext context) {
    print(
        "${widget.apiLinkList[0]
            .email} =================================================================== ");
    Size size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        /* appBar: AppBar(
          title: const Text("User document"),
        ),*/
        backgroundColor: Colors.white54,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset("assets/images/profile.jpg"),
              ),
              SizedBox(height: size.height * 0.1),
              Container(
                height: size.height * 0.7,
                width: 300.0,
                padding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                margin: const EdgeInsets.only(left: 30.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlueAccent,
                ),
                child: Form(
                  key: globalFormKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20.0),
                      const Text("Login"),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (input) => widget.apiLinkList[0].email = input,
                        validator: (input) =>
                        input!.contains("@")
                            ? "Email is should be valid"
                            : null,
                        decoration: const InputDecoration(
                          hintText: "Email address",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        onSaved: (input) =>
                        widget.isLoading ? widget.apiLinkList[0].phone : "" = input,
                        validator: (input) =>
                        input!.length < 11
                            ? "Number should be more then 11 characters "
                            : null,
                        obscureText: hidePhone,
                        decoration: InputDecoration(
                            hintText: "Phone",
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            prefixIcon: const Icon(Icons.vpn_key_outlined),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePhone = !hidePhone;
                                });
                              },
                              icon: Icon(hidePhone
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            )),
                      ),
                      const SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              borderRadius:
                              BorderRadiusDirectional.circular(20.0)),
                          child: Text("Login"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    form?.save();
    return true;
  }
}
