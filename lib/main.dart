import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clicker/cubit/home/home_cubit.dart';
import 'package:clicker/provider/themes.dart';

import 'cubit/theme/theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: context.read<ThemeCubit>().themeMode,
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          home: MyHomePage(),
        );
      }),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  int count = 0;

  int index_color = 0;
  List<Color> colors = [
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.purple,
    Colors.pink,
    Colors.brown,
    Colors.cyan,
    Colors.indigo,
    Colors.teal
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Container();
              },
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is ClickState) {
                  count = state.clickCount;
                  if (state.clickCount < 0) {
                    Random rand = new Random();

                    return Text(
                      state.clickCount.toString(),
                      style: TextStyle(
                          color: colors[rand.nextInt(colors.length)],
                          fontSize: 30),
                    );
                  } else {
                    return Text(
                      state.clickCount.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                }
                return Text(
                  '0',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 35,
                      width: 65,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: TextButton(
                        onPressed: () {
                          context.read<HomeCubit>().handleClickMinus(
                              context.read<ThemeCubit>().themeMode);
                        },
                        child: const Icon(Icons.remove),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 35,
                      width: 65,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: TextButton(
                        onPressed: () {
                          context.read<HomeCubit>().handleClick(
                              context.read<ThemeCubit>().themeMode);
                        },
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              height: 300,
              child: Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Center(
                          child:
                              Text(context.read<HomeCubit>().messages[index]),
                        );
                      },
                      itemCount: context.read<HomeCubit>().messages.length,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              context.read<ThemeCubit>().changeTheme();
              context.read<HomeCubit>().themeSwitched(context);
            },
            child: Icon(state is LightThemeState
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
          );
        },
      ),
    );
  }
}
