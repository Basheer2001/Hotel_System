import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../controllers/dashboard/managing_reports_controller/uncheckedreports_controller.dart';
import 'managing_reports/displayreports.dart';
import 'managing_reports/uncheckedreports.dart';
import 'managing_users/banunbanuser.dart';
import 'managing_users/edituser.dart';
import 'managing_users/getprofile.dart';
import 'managing_users/usercreate.dart';
import 'managing_users/viewallusers.dart';
import 'managing_users/searchuser.dart';
import 'managing_users/deleteuser.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as charts;
/*
class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Handle logout
            },
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DashboardOverview(),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Admin Name'),
            accountEmail: Text('admin@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'A',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () {
              Get.offAll(DashboardScreen());
            },
          ),
          ExpansionTile(
            leading: Icon(Icons.manage_accounts),
            title: Text('Managing Users'),
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text('View All Users'),
                onTap: () {
                  Get.to(()=>ViewAllUsers());
                },
              ),
              ListTile(
                leading: Icon(Icons.person_add),
                title: Text('Create New User'),
                onTap: () {
                  Get.to(()=>UserCreation ());
                },
              ),
              ListTile(  // Added ListTile for getProfile
                leading: Icon(Icons.account_circle),
                title: Text('Get Profile'),
                onTap: () {
                  // Navigate to Profile Page
                  Get.to(GetProfile(userId: '',)); // Replace ProfilePage with your profile page class
                },
              ),
              ListTile(
                leading: Icon(Icons.block),
                title: Text('Ban/Unban User'),
                onTap: () {
                  // Navigate to Ban/Unban User Page with user ID
                  Get.to(BanUnbanUser()); // Replace '123' with the actual user ID
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete User'),
                onTap: () {
                  // Navigate to Ban/Unban User Page with user ID
                  Get.to(DeleteUser()); // Replace '123' with the actual user ID
                },
              ),
              ListTile(
                leading: Icon(Icons.search),
                title: Text('Search User'),
                onTap: () {
                  // Navigate to Ban/Unban User Page with user ID
                  Get.to(SearchUser()); // Replace '123' with the actual user ID
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.report),
           title: Text('Managing Reports'),
           children: [
             ListTile(
               leading: Icon(Icons.person),
               title: Text('Display Reports'),
               onTap: () {
                 Get.to(()=>DisplayReports(userId: '',));
               },
             ),
             ListTile(
               leading: Icon(Icons.radio_button_unchecked),
               title: Text('UncheckedReports'),
               onTap: () {
                 Get.to(()=>  UncheckedReports());
               },
             ),
             ListTile(
               leading: Icon(Icons.check),
               title: Text(' MultipleReportsCheck'),
               onTap: () {
                 Get.to(()=>   MultipleReportsCheck(reportsArray: [],));
               },
             ),


           ]),
          ListTile(
            leading: Icon(Icons.hotel),
            title: Text('Manage Rooms'),
            onTap: () {
              // Navigate to Manage Rooms page
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Navigate to Settings page
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Handle logout
            },
          ),

        ],
      ),
    );
  }
}

class DashboardOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:[ Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              OverviewCard(
                title: 'Total Users',
                value: '120',
                icon: Icons.people,
                color: Colors.blue,
              ),
              OverviewCard(
                title: 'Occupied Rooms',
                value: '85%',
                icon: Icons.hotel,
                color: Colors.green,
              ),
              OverviewCard(
                title: 'Total Revenue',
                value: '\$24,000',
                icon: Icons.attach_money,
                color: Colors.orange,
              ),
              OverviewCard(
                title: 'New Reservations',
                value: '30',
                icon: Icons.calendar_today,
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Annual Profits',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            padding: EdgeInsets.all(10),
            child: _buildChart(),
          ),
        ],
      ),
    ]);
  }
}

Widget _buildChart() {
  // Sample data for the chart, replace it with your actual data
  List<ChartData> data = [
    ChartData(2018, 30000),
    ChartData(2019, 45000),
    ChartData(2020, 60000),
    ChartData(2021, 75000),
    ChartData(2022, 90000),
  ];
  return SfCartesianChart(
    primaryXAxis: NumericAxis(),
    /* series: <ChartSeries>[
      LineSeries<ChartData, int>(
        dataSource: data,
        xValueMapper: (ChartData sales, _) => sales.year,
        yValueMapper: (ChartData sales, _) => sales.profit,
      )
    ],*/
  );
}
class ChartData {
  final int year;
  final int profit;

  ChartData(this.year, this.profit);
}

class OverviewCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  OverviewCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: color,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Handle logout
            },
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DashboardOverview(),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Admin Name'),
            accountEmail: Text('admin@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'A',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () {
              Get.offNamed('/');
            },
          ),
          ExpansionTile(
            leading: Icon(Icons.manage_accounts),
            title: Text('Managing Users'),
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text('View All Users'),
                onTap: () {
                  Get.to(() => ViewAllUsers());
                },
              ),
              ListTile(
                leading: Icon(Icons.person_add),
                title: Text('Create New User'),
                onTap: () {
                  Get.to(() => UserCreation());
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Get Profile'),
                onTap: () {
                  Get.to(() => GetProfile(userId: ''));
                },
              ),
              ListTile(
                leading: Icon(Icons.block),
                title: Text('Ban/Unban User'),
                onTap: () {
                  Get.to(() => BanUnbanUser());
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete User'),
                onTap: () {
                  Get.to(() => DeleteUser());
                },
              ),
              ListTile(
                leading: Icon(Icons.search),
                title: Text('Search User'),
                onTap: () {
                  Get.to(() => SearchUser());
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.report),
            title: Text('Managing Reports'),
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Display Reports'),
                onTap: () {
                  Get.to(() => DisplayReports(userId: ''));
                },
              ),
              ListTile(
                leading: Icon(Icons.radio_button_unchecked),
                title: Text('UncheckedReports'),
                onTap: () {
                  Get.to(() => UncheckedReports());
                },
              ),
              ListTile(
                leading: Icon(Icons.check),
                title: Text('MultipleReportsCheck'),
                onTap: () {
                  Get.to(() => MultipleReportsCheck(reportsArray: []));
                },
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.hotel),
            title: Text('Manage Rooms'),
            onTap: () {
              // Navigate to Manage Rooms page
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Navigate to Settings page
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Handle logout
            },
          ),
        ],
      ),
    );
  }
}

class DashboardOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                OverviewCard(
                  title: 'Total Users',
                  value: '120',
                  icon: Icons.people,
                  color: Colors.blue,
                ),
                OverviewCard(
                  title: 'Occupied Rooms',
                  value: '85%',
                  icon: Icons.hotel,
                  color: Colors.green,
                ),
                OverviewCard(
                  title: 'Total Revenue',
                  value: '\$24,000',
                  icon: Icons.attach_money,
                  color: Colors.orange,
                ),
                OverviewCard(
                  title: 'New Reservations',
                  value: '30',
                  icon: Icons.calendar_today,
                  color: Colors.red,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Annual Profits',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              padding: EdgeInsets.all(10),
              child: _buildChart(),
            ),
          ],
        ),
      ],
    );
  }
}

Widget _buildChart() {
  // Sample data for the chart, replace it with your actual data
  List<ChartData> data = [
    ChartData(2018, 30000),
    ChartData(2019, 45000),
    ChartData(2020, 60000),
    ChartData(2021, 75000),
    ChartData(2022, 90000),
  ];
  return charts.SfCartesianChart(
    primaryXAxis: charts.NumericAxis(), // Numeric axis
    series: <charts.CartesianSeries>[
      charts.LineSeries<ChartData, int>(
        dataSource: data,
        xValueMapper: (ChartData sales, _) => sales.year,
        yValueMapper: (ChartData sales, _) => sales.profit,
      ),
    ],
  );
}


class ChartData {
  final int year;
  final int profit;

  ChartData(this.year, this.profit);
}

class OverviewCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  OverviewCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: color,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



