import 'package:flutter/material.dart';
import 'package:job_app/model/job_title_search.dart';
import 'package:job_app/screens/home_screen.dart';
import 'model/theme_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeModel>(create: (_) => ThemeModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job App',
      theme: Provider.of<ThemeModel>(context).getTheme(),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: Text(
            'Job App',
            style: TextStyle(fontSize: 14.0),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                final results = await showSearch(
                    context: context, delegate: JobTitleSearch());
                // print(results);
              },
              icon: Icon(
                Icons.search,
                size: 18.0,
              ),
              iconSize: 18.0,
              splashRadius: 18.0,
            ),
            // Icon(Icons.filter),

            PopupMenuButton(
                icon: Icon(Icons.more_vert, size: 18.0),
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  PopupMenuItem(
                    height: 10,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Dark Mode',
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          Consumer<ThemeModel>(
                            builder: (context, state, child) {
                              return Transform.scale(
                                scale: 0.8,
                                child: Switch(
                                    value: state.isDarkTheme(),
                                    onChanged: (value) {
                                      state.changeTheme();
                                    }),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
      body: HomeScreen(),
    );
  }
}
