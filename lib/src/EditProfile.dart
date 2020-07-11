import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class EditProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditProfileState();
  }
}

class EditProfileState extends State<EditProfile> {

  String _name;
  String _age;
  String gender;
  String groupValue = "male";
  String _email;
  String _password;
  String _phoneNumber;

  bool _obscureText = true;

   //Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender = e;
      } else if (e == "female") {
        groupValue = e;
        gender = e;
      }
    });
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void signUp() async {

    //loginUser(_phoneNumber, context);
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    print(_name);
    print(_age);
    print(_email);
    print(_phoneNumber);
    print(_password);

    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
//        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
//        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }catch(e){
        print(e.message);
      }
    }
  }

  Widget _buildName() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: TextFormField(
        decoration:
        new InputDecoration(
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.teal)
            ),
            hintText: 'type your name',
            helperText: 'Min size 3, max 10',
            labelText: 'Name',
            prefixIcon: const Icon(Icons.person, color: Colors.green,),
            prefixText: ' ',
            //suffixText: 'USD',
            suffixStyle: const TextStyle(color: Colors.green)),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name is Required';
          } else if (value.length < 4) {
            return 'Name is short';
          }

          return null;
        },
        onSaved: (String value) {
          _name = value;
        },
      ),
    );
  }

  Widget _buildAge() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly
        ],
        decoration:
        new InputDecoration(
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.teal)
            ),
            hintText: 'type your age',
            helperText: 'Min 18 years old',
            labelText: 'Age',
            prefixIcon: const Icon(Icons.timer, color: Colors.green,),
            prefixText: ' ',
            //suffixText: 'USD',
            suffixStyle: const TextStyle(color: Colors.green)),
        maxLength: 2,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _age = value;
        },
      ),
    );
  }

  Widget _buildEmail() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: TextFormField(
        decoration:
        new InputDecoration(
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.teal)
            ),
            hintText: 'type your email',
            helperText: 'youremail@gmail.com',
            labelText: 'Email',
            prefixIcon: const Icon(Icons.alternate_email, color: Colors.green,),
            prefixText: ' ',
            //suffixText: 'USD',
            suffixStyle: const TextStyle(color: Colors.green)),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Email is Required';
          }

          if (!RegExp(
              r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
              .hasMatch(value)) {
            return 'Please enter a valid email Address';
          }

          return null;
        },
        onSaved: (String value) {
          _email = value;
        },
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        decoration:
        new InputDecoration(
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.teal)
            ),
            hintText: 'type your phone number',
            helperText: 'your phone number',
            labelText: 'Phone number',
            prefixIcon: const Icon(Icons.phone_android, color: Colors.green,),
            prefixText: ' ',
            //suffixText: 'USD',
            suffixStyle: const TextStyle(color: Colors.green)),
        maxLength: 12,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Phone number is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _phoneNumber = value;
        },
      ),
    );
  }

  bool _showPassword = false;
  Widget _buildPassword() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: TextFormField(
        obscureText: !this._showPassword,
        decoration:
        new InputDecoration(
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.teal)
            ),
            hintText: 'type your password',
            helperText: 'min 6 chars',
            labelText: 'Password',
            prefixIcon: const Icon(Icons.lock_outline, color: Colors.green,),
            prefixText: ' ',
            //suffixText: 'USD',
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: this._showPassword ? Colors.green : Colors.grey,
              ),
              onPressed: () {
                setState(() => this._showPassword = !this._showPassword);
              },
            ),
            suffixStyle: const TextStyle(color: Colors.green)
        ),
        maxLength: 12,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name is Required';
          } else if (value.length < 6) {
            return 'password is shorter than 6 chars';
          }

          return null;
        },
        onSaved: (String value) {
          _password = value;
        },
      ),
    );
  }

  Widget _buildConfirmPassword() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: TextFormField(
        obscureText: !this._showPassword,
        decoration:
        new InputDecoration(
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.teal)
            ),
            hintText: 'type your password',
            helperText: 'min 6 chars',
            labelText: 'Password',
            prefixIcon: const Icon(Icons.lock_outline, color: Colors.green,),
            prefixText: ' ',
            //suffixText: 'USD',
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: this._showPassword ? Colors.green : Colors.grey,
              ),
              onPressed: () {
                setState(() => this._showPassword = !this._showPassword);
              },
            ),
            suffixStyle: const TextStyle(color: Colors.green)
        ),
        maxLength: 12,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name is Required';
          } else if (value.length < 6) {
            return 'password is shorter than 6 chars';
          } else  if(value != _password){
            return 'password not matched';
          }

          return null;
        },
        onSaved: (String value) {
          _password = value;
        },
      ),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"), backgroundColor: Color(0xffa01313),),
      body: Container(
        padding: EdgeInsets.only(top: 50.0, bottom: 50.0, left: 10.0, right: 10.0),
        child: Scrollbar(
          isAlwaysShown: true,
          controller: ScrollController(),
          child: ListView(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/avatarka.png"),
                    _buildName(),
                    _buildAge(),
                    _buildEmail(),
                    _buildPhoneNumber(),
                    _buildPassword(),
                    _buildConfirmPassword(),
                    SizedBox(height: 30),
                    RaisedButton(
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.green, fontSize: 16),
                      ),
                      onPressed: signUp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}