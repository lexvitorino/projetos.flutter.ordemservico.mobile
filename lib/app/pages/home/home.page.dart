import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/shared/components/avatar.component.dart';
import 'package:osmobile/app/pages/home/compoenents/total-chart.component.dart';
import 'package:osmobile/app/pages/home/home.controller.dart';
import 'package:osmobile/app/theme/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.input),
            onPressed: () => controller.logOut(),
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Observer(
              builder: (_) => UserAccountsDrawerHeader(
                accountName: Text(controller.sessionModel.name),
                accountEmail: Text(controller.sessionModel.email),
                currentAccountPicture:
                    Image.asset("lib/app/assets/images/profile-picture.png"),
              ),
            ),
            ListTile(
              title: Text('Usuário'),
              trailing: Icon(Icons.supervisor_account),
              onTap: () {
                Modular.to.pushNamed('/user');
              },
            ),
            ListTile(
              title: Text('Cliente'),
              trailing: Icon(Icons.wc),
              onTap: () {
                Modular.to.pushNamed('/customer');
              },
            ),
            ListTile(
              title: Text('Ordem de Serviço'),
              trailing: Icon(Icons.widgets),
              onTap: () {
                Modular.to.pushNamed('/serviceOrder');
              },
            ),
            Divider(),
            ListTile(
              title: Text('Sair'),
              trailing: Icon(Icons.input),
              onTap: () => controller.logOut(),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              TotalChart(
                value: '\$30200',
                description: 'All Earnings',
                topicIcon: Icons.insert_chart,
                title: "% change",
                typeIconCard: Icons.show_chart,
                backgroundColor: warningColor,
              ),
              TotalChart(
                value: '290+',
                description: 'Page Views',
                topicIcon: Icons.insert_drive_file,
                title: "% change",
                typeIconCard: Icons.show_chart,
                backgroundColor: successColor,
              ),
              TotalChart(
                value: '145',
                description: 'Task',
                topicIcon: Icons.insert_invitation,
                title: "% change",
                typeIconCard: Icons.show_chart,
                backgroundColor: infoColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
