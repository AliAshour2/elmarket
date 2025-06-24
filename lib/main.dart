import 'package:elmarket/core/di/service_locator.dart';
import 'package:elmarket/core/helpers/bloc_observer.dart';
import 'package:elmarket/core/routes/route_generator.dart';
import 'package:elmarket/core/routes/routes.dart';
import 'package:elmarket/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:elmarket/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AuthCubit>()..getToken(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) => {
          if (state is AuthGetTokenSuccess)
            {Navigator.pushReplacementNamed(context, Routes.mainRoute)}
          else if (state is AuthGetTokenError)
            {}
        },
        child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return BlocProvider(
                create: (context) => getIt.get<AuthCubit>(),
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'elmarket',
                  home: child,
                  onGenerateRoute: RouteGenerator.getRoute,
                  initialRoute: Routes.mainRoute,
                ),
              );
            }),
      ),
    );
  }
}
