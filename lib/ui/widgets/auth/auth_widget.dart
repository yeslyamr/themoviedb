import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themoviedb/Library/Widgets/Inherited/provider.dart';
import 'package:themoviedb/resources/resources.dart';
import 'package:themoviedb/ui/theme/app_colors.dart';
import 'package:themoviedb/ui/widgets/auth/auth_model.dart';

import '../components/text_field_container.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: const Text("LOGIN"),
        centerTitle: true,
      ),
      body: const _FormWidget(),
    );
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final model = NotifierProvider.read<AuthModel>(context);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.02),
            Padding(
              // TODO: configure svg 
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SvgPicture.asset(
                AppImages.tmdbPrimaryShortLogo,
                height: size.height * 0.35,
              ),
            ),
            _UsernameTextField(
              model: model,
            ),
            _PasswordTextField(
              model: model,
            ),
            const _AuthButtonWidget(),
            SizedBox(height: size.height * 0.03),
            // TODO:  AlreadyHaveAnAccountCheck(
            //   press: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return SignUpScreen();
            //         },
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({
    Key? key,
    required this.model,
  }) : super(key: key);

  final AuthModel? model;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      backgroundColor: AppColors.main,
      child: TextField(
        style: const TextStyle(color: AppColors.mainText),

        controller: model?.passwordTextController,
        obscureText: true,

        // onChanged: onChanged,
        cursorColor: AppColors.a,
        decoration: InputDecoration(
          // fillColor: AppColors.mainText,
          // contentPadding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          hintText: "Password",
          icon: const Icon(
            Icons.lock,
            color: AppColors.a,
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.visibility,
              color: AppColors.a,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class _UsernameTextField extends StatelessWidget {
  const _UsernameTextField({
    Key? key,
    required this.model,
  }) : super(key: key);

  final AuthModel? model;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      backgroundColor: AppColors.main,
      child: TextField(
        style: const TextStyle(color: AppColors.mainText),
        controller: model?.loginTextController,
        // onChanged: onChanged,
        cursorColor: AppColors.a,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.person,
            color: AppColors.a,
          ),
          hintText: 'Username',
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<AuthModel>(context);
    final onPressed =
        model?.canStartAuth == true ? () => model?.auth(context) : () {};
    final child = model?.isAuthProgress == true
        ? const SizedBox(
            height: 15,
            width: 15,
            child: CircularProgressIndicator(
              color: Color.fromRGBO(13, 37, 63, 1),
            ))
        : const Text(
            "Login",
            style: TextStyle(fontWeight: FontWeight.bold),
          );
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
          child: child,
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              primary: AppColors.a,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: const TextStyle(
                  color: AppColors.mainText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
