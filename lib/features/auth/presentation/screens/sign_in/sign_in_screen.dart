import 'package:elmarket/core/resources/color_manager.dart';
import 'package:elmarket/core/resources/font_manager.dart';
import 'package:elmarket/core/resources/styles_manager.dart';
import 'package:elmarket/core/routes/routes.dart';
import 'package:elmarket/core/widgets/custom_elevated_button.dart';
import 'package:elmarket/core/widgets/validators.dart';
import 'package:elmarket/features/auth/data/models/sign_in/sign_in_model.dart';
import 'package:elmarket/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:elmarket/core/widgets/custom_text_field.dart';
import 'package:elmarket/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void despose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                          'Sign in to continue shopping',
                          style: getLightStyle(
                                  color: Colors.white.withOpacity(0.8))
                              .copyWith(fontSize: FontSize.s16.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
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
                      child: BlocListener<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is AuthSignInError) {
                            toastification.show(
                              context: context,
                              title: Text(state.message),
                              autoCloseDuration: const Duration(seconds: 2),
                              type: ToastificationType.error,
                              style: ToastificationStyle.flat,
                              alignment: Alignment.bottomCenter,
                            );
                          } else if (state is AuthSignInSuccess) {
                            toastification.show(
                              context: context,
                              title: const Text('Sign in successful'),
                              autoCloseDuration: const Duration(seconds: 2),
                              type: ToastificationType.success,
                              style: ToastificationStyle.flat,
                              alignment: Alignment.bottomCenter,
                            );

                            Navigator.pushReplacementNamed(
                                context, Routes.mainRoute);
                          }
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Welcome Back',
                              style: getBoldStyle(color: ColorManager.primary)
                                  .copyWith(fontSize: FontSize.s20.sp),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Sign in to access your account',
                              style: getLightStyle(color: Colors.grey[600]!),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 32),
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
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Password reset functionality coming soon')),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: ColorManager.primary,
                                  padding: EdgeInsets.zero,
                                ),
                                child: const Text('Forgot Password?'),
                              ),
                            ),
                            SizedBox(height: 24),
                            BlocBuilder<AuthCubit, AuthState>(
                              builder: (context, state) {
                                final isLoading = state is AuthSignInLoading;

                                return CustomElevatedButton(
                                  onTap: isLoading
                                      ? null
                                      : () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            context.read<AuthCubit>().signIn(
                                                  SignInModel(
                                                    email:
                                                        _emailController.text,
                                                    password:
                                                        _passwordController
                                                            .text,
                                                  ),
                                                );
                                          }
                                        },
                                  label: 'Sign in',
                                  isLoading: isLoading,
                                );
                              },
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style:
                                      getLightStyle(color: Colors.grey[700]!),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pushReplacementNamed(
                                          context, Routes.signUpRoute),
                                  child: Text(
                                    'Sign Up',
                                    style: getBoldStyle(
                                        color: ColorManager.primary),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
