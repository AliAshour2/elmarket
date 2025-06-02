import 'package:elmarket/core/resources/color_manager.dart';
import 'package:elmarket/core/resources/font_manager.dart';
import 'package:elmarket/core/resources/styles_manager.dart';
import 'package:elmarket/core/routes/routes.dart';
import 'package:elmarket/core/widgets/custom_elevated_button.dart';
import 'package:elmarket/core/widgets/validators.dart';
import 'package:elmarket/core/widgets/custom_text_field.dart';
import 'package:elmarket/features/auth/data/models/sign_up/sign_up_model.dart';
import 'package:elmarket/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:elmarket/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String? _errorMessage;
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorManager.primary,
                ColorManager.primary.withOpacity(0.8),
                ColorManager.primary.withOpacity(0.6),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 24),
                        Text(
                          'ElMarket',
                          style: getBoldStyle(color: Colors.white)
                              .copyWith(fontSize: FontSize.s24.sp),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Create your account',
                          style: getLightStyle(
                                  color: Colors.white.withOpacity(0.8))
                              .copyWith(fontSize: FontSize.s16.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Sign Up',
                            style: getBoldStyle(color: ColorManager.primary)
                                .copyWith(fontSize: FontSize.s20.sp),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Create a new account to start shopping',
                            style: getLightStyle(color: Colors.grey[600]!),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 32),
                          CustomTextField(
                            controller: _nameController,
                            label: 'Name',
                            hint: 'Enter your name',
                            iconData: Icons.person_outline,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                            nextFocus: null,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          SizedBox(height: 16),
                          CustomTextField(
                            controller: _emailController,
                            label: 'Email',
                            hint: 'Enter your email',
                            iconData: Icons.email_outlined,
                            textInputType: TextInputType.emailAddress,
                            validation: AppValidators.validateEmail,
                            nextFocus: null,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          SizedBox(height: 16),
                          CustomTextField(
                            controller: _passwordController,
                            label: 'Password',
                            hint: 'Enter your password',
                            iconData: Icons.lock_outline,
                            isObscured: true,
                            validation: AppValidators.validatePassword,
                            nextFocus: null,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          SizedBox(height: 16),
                          CustomTextField(
                            controller: _phoneController,
                            label: 'Phone ',
                            hint: 'Enter your phone number',
                            iconData: Icons.phone_outlined,
                            textInputType: TextInputType.phone,
                            validation: AppValidators.validatePhoneNumber,
                            nextFocus: null,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          SizedBox(height: 24),
                          if (_errorMessage != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                _errorMessage!,
                                style: getLightStyle(color: Colors.red),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          if (_errorMessage != null) SizedBox(height: 16),
                          BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) {
                              final isLoading = state is AuthSignUpLoading;
                              return CustomElevatedButton(
                                  label: "Sign Up",
                                  isLoading: isLoading,
                                  onTap: isLoading
                                      ? null
                                      : () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            BlocProvider.of<AuthCubit>(context)
                                                .signUp(SignUpModel(
                                                    name: _nameController.text,
                                                    email:
                                                        _emailController.text,
                                                    password:
                                                        _passwordController
                                                            .text,
                                                    rePassword:
                                                        _passwordController
                                                            .text,
                                                    phone: null));
                                          }
                                        });
                            },
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account?',
                                style: getLightStyle(color: Colors.grey[700]!),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pushReplacementNamed(
                                    context, Routes.signInRoute),
                                child: Text(
                                  'Sign In',
                                  style:
                                      getBoldStyle(color: ColorManager.primary),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
