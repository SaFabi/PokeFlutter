import 'package:flutter/material.dart';
import 'package:form_validation/src/DAO/COnstants.dart';
import 'package:form_validation/src/DAO/Storagemanager.dart';
import 'package:form_validation/src/bloc/login_bloc.dart';
import 'package:form_validation/src/bloc/provider.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _userController  = new TextEditingController();
  TextEditingController _passController  = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [_crearFondo(context), _loginForm(context)],
    ));
  }

  Widget _loginForm(BuildContext context) {
    final bloc  = Provider.of(context);
    final size = MediaQuery.of(context).size;


    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
              child: Container(
            height: 180,
          )
          ),
          SizedBox(height: 30,),
          Container(
           
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
             padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0,5.0),
                  spreadRadius: 3.0
                  
                  )
              ]
              ),
          
            child: Column(
              children: [
                Text(
                  "Ingreso", style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 60.0),
                _crearEmail(bloc),
                SizedBox(height: 30,),
                _crearPassword(bloc),
                SizedBox(height: 30,),
                _crearBoton(bloc)
              ],
            ),
          ),
          Text("¿Olvido la contraseña?"),
          SizedBox(height: 100,)
        
        ],
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoMorado = Container(
      height: (size.height * 0.4),
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: new LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1.0),
        Color.fromRGBO(90, 70, 178, 1.0)
      ])),
    );
    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: [
        fondoMorado,
        Positioned(top: 90,left: 30,child: circulo,),
        Positioned(top: -40,left: -30,child: circulo,),
        Positioned(bottom: -50,right: -10,child: circulo,),
        Positioned(bottom: 120,right: 20,child: circulo,),
        Positioned(bottom: -50,left: -20,child: circulo,),

        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: [
              Icon(
                Icons.person_pin_circle,
                color: Colors.white,
                size: 100.0,
              ),
              SizedBox(
                height: 10,
                width: double.infinity,
              ),
              Text(
                "Fabi Ramirez",
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _crearEmail(LoginBbloc loginBbloc){
    return StreamBuilder(
      stream: loginBbloc.emailStream ,
  
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: _userController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Correo electronico',
              hintText: "ejemplo@correo.com",
              counterText: snapshot.data,
             errorText: snapshot.error,

              icon: Icon(Icons.alternate_email,color: Colors.deepPurple,),
              
            ),
            onChanged: loginBbloc.changeEmail,
          
            
            ),
          
        );
      },
    );
  }

  Widget _crearPassword(LoginBbloc loginBbloc){
      return StreamBuilder(
        stream: loginBbloc.passwordStream ,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),

            child: TextField(
              controller: _passController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                counterText: snapshot.data,
                errorText: snapshot.error,
                icon: Icon(Icons.lock_outline,color: Colors.deepPurple,),
                
              ),
              onChanged: loginBbloc.changePassword  ,
              keyboardType: TextInputType.emailAddress,
              
              ),
          );
        },
      );




    
  }

  Widget _crearBoton(LoginBbloc loginBbloc){
    return StreamBuilder(
      stream: loginBbloc.formValidStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
          return RaisedButton(
            onPressed: snapshot.hasData ?  ()=> _login(loginBbloc,context) : null,
            child:Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0,vertical: 15.0),
              child: Text("Ingresar"),) ,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
              elevation: 0.0,
              color: Colors.deepPurple,
              textColor: Colors.white,
        );
      },
    );
  }

  _login(LoginBbloc loginBbloc, BuildContext context){
   
    Navigator.pushReplacementNamed(context, 'home');
   
  }

}
