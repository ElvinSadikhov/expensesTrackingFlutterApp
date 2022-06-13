// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/strings.dart';
import 'package:expenses_tracking_app/ui/screens/home_screen.dart';
import 'package:expenses_tracking_app/ui/screens/login_screen.dart'; 
import 'package:expenses_tracking_app/ui/widgets/custom_text_form_field.dart';
import 'package:expenses_tracking_app/ui/widgets/labeled_button.dart'; 
import 'package:expenses_tracking_app/utils/helpers/validators/login_validator.dart';
import 'package:expenses_tracking_app/utils/helpers/validators/registration_validator.dart';
import 'package:expenses_tracking_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart';
 
class RegistrationForm extends StatefulWidget { 
  final EdgeInsets padding;
  
  const RegistrationForm({ Key? key, this.padding = EdgeInsets.zero }) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationForm();
}

class _RegistrationForm extends State<RegistrationForm> {
  // TextEditingController firstNameController = TextEditingController();
  // TextEditingController lastNameController = TextEditingController();
  // TextEditingController emailController = TextEditingController(); 
  // TextEditingController usernameController = TextEditingController(); 
  // TextEditingController passwordController = TextEditingController(); 
  // TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();  
  final List<TextEditingController> _controllers = [
    TextEditingController(text: ""),
    TextEditingController(text: ""),
    TextEditingController(text: ""),
    TextEditingController(text: ""),
    TextEditingController(text: ""),
    TextEditingController(text: ""),
  ];
  final List<String> _texts = [
    Strings.firstName,
    Strings.lastName,
    Strings.gmail,
    Strings.username,
    Strings.password,
    Strings.confirmPassword
  ];  
  final List<dynamic> _validators = [
    RegistrationValidator.validateFirstName,
    RegistrationValidator.validateLastName,
    RegistrationValidator.validateGmail,
    RegistrationValidator.validateUsername,
    RegistrationValidator.validatePassword,
    RegistrationValidator.validateConfirmPassword
  ];

  @override
  Widget build(BuildContext context) {

    Size sizeOfScreen = MediaQuery.of(context).size;

    return Column(
      children: [
        Form(
          key: this._formKey,
          child: Padding(
            padding: widget.padding,
            child: SizedBox(
              // height: sizeOfScreen.height * 0.5,
              child: Column(
                children: [
                  ...List.generate(this._controllers.length, (index) => index).map(
                    (index) {
                      return CustomTextFormField(
                        controller: this._controllers[index], 
                        validator: (value) => index == this._controllers.length - 1 
                          ? this._validators[index](value, passwordController: this._controllers[index - 1]) 
                            : this._validators[index](value),
                        hintText: this._texts[index],
                        labelText: this._texts[index],
                        obscureText: index >= this._controllers.length - 2 ? true : false,
                        textInputAction: index == this._controllers.length - 1 ? TextInputAction.done : TextInputAction.next,
                      );
                    }
                  )
                ],
              ) 
                
              // ListView.builder(  
              //   scrollDirection: Axis.vertical,
              //   itemCount: this._controllers.length == this._texts.length ? this._controllers.length : 0,
              //   itemBuilder: (BuildContext context, int index) {
              //     return CustomTextFormField(
              //       controller: this._controllers[index], 
              //       validator: (value) => index == this._controllers.length - 1 
              //         ? this._validators[index](value, passwordController: this._controllers[index - 1]) 
              //           : this._validators[index](value),
              //       hintText: this._texts[index],
              //       labelText: this._texts[index],
              //       obscureText: index >= this._controllers.length - 2 ? true : false,
              //       textInputAction: index == this._controllers.length - 1 ? TextInputAction.done : TextInputAction.next,
              //     );
              //   }
              // ), 



            // Column(
            //   children: [ 
            //     CustomTextFormField(
            //       controller: this.firstNameController, 
            //       hintText: Strings.firstName, 
            //       validator: (value) => RegistrationValidator.validateFirstName(value),
            //       labelText: Strings.firstName,    
            //     ),    
            //     CustomTextFormField(
            //       controller: this.lastNameController, 
            //       hintText: Strings.lastName, 
            //       validator: (value) => RegistrationValidator.validateLastName(value),
            //       labelText: Strings.lastName,     
            //     ),  
            //     CustomTextFormField(
            //       controller: this.emailController, 
            //       hintText: Strings.gmail, 
            //       validator: (value) => RegistrationValidator.validateGmail(value),
            //       labelText: Strings.gmail,    
            //     ),  
            //     CustomTextFormField(
            //       controller: this.usernameController, 
            //       hintText: Strings.username, 
            //       validator: (value) => RegistrationValidator.validateUsername(value),
            //       labelText: Strings.username,     
            //     ),  
            //     CustomTextFormField(
            //       controller: this.passwordController, 
            //       hintText: Strings.password, 
            //       validator: (value) => RegistrationValidator.validatePassword(value),
            //       labelText: Strings.password,    
            //       obscureText: true,
            //     ), 
            //     CustomTextFormField(
            //       controller: this.confirmPasswordController, 
            //       hintText: Strings.confirmPassword, 
            //       validator: (value) => RegistrationValidator.validateConfirmPassword(value, passwordController: this.passwordController),
            //       labelText: Strings.confirmPassword,   
            //       textInputAction: TextInputAction.done,  
            //       obscureText: true, 
            //     ),
            //   ]
            // ),
            )
          )
        ),
        WidgetMethods.verticalSpace(20),
        LabeledButton(
          onTap: this.onFormCompleted, 
          label: Strings.createAnAccount,  
        ),  
      ],
    );

  }

  void onFormCompleted() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("The account has been created successfully!"))); 
    } 
  }
 

} 

