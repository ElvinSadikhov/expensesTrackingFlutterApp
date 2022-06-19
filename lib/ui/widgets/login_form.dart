// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/strings.dart';
import 'package:expenses_tracking_app/ui/screens/home_screen.dart'; 
import 'package:expenses_tracking_app/ui/widgets/custom_text_form_field.dart';
import 'package:expenses_tracking_app/ui/widgets/labeled_button.dart';
import 'package:expenses_tracking_app/utils/helpers/validators/login_validator.dart';
import 'package:expenses_tracking_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart';
 
class LoginForm extends StatefulWidget { 
  final EdgeInsets padding;
  
  const LoginForm({ Key? key, this.padding = EdgeInsets.zero }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> { 
  // TextEditingController usernameController = TextEditingController();
  // TextEditingController passwordController = TextEditingController(); 

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); 
  final List<TextEditingController> _controllers = [
    TextEditingController(text: ""),
    TextEditingController(text: ""), 
  ];
  final List<String> _texts = [ 
    Strings.username,
    Strings.password, 
  ];  
  final List<dynamic> _validators = [ 
    LoginValidator.validateUsername,
    LoginValidator.validatePassword, 
  ];

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Form(
          key: this._formKey,
          child: Padding(
            padding: widget.padding,
            child: Column(
              children: [
                ...List.generate(this._controllers.length, (index) => index).map(
                  (index) {
                    return CustomTextFormField(
                      controller: this._controllers[index], 
                      validator: this._validators[index],
                      hintText: this._texts[index],
                      labelText: this._texts[index],
                      obscureText: index >= this._controllers.length - 1 ? true : false,
                      textInputAction: index == this._controllers.length - 1 ? TextInputAction.done : TextInputAction.next,
                    );
                  }
                )
              ],
            )  
          )
        ),
        WidgetMethods.verticalSpace(20),
        LabeledButton(
          onTap: () { 
            if (_formKey.currentState!.validate()) {
              if (this.isValidAccount()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("There is no such an account!"))); 
              }
            } 
          }, 
          label: Strings.logIn,  
        ),  
      ],
    );

  }

  // TODO: WE NEED TO CHECK WHETHER OR NOT THERE IS SUCH AN ACCOUNT
  bool isValidAccount() { 
    // we can use this variables in order to check them
    // this.usernameController.value.text;
    // this.passwordController.value.text;
    
    // Future.delayed(const Duration(seconds: 1));
    return true;
  }

} 

