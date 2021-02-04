

import 'package:NavigationBar/pages/profile.dart';
import 'package:NavigationBar/pages/dashboard.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'profile.dart';
class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(
                        top: 30,
                        bottom: 30,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage('https://allworldpm.com/wp-content/uploads/2016/10/230x230-avatar-dummy-profile-pic.jpg'
                          ),
                          fit: BoxFit.fill

                        ),
                      ),
                      ),
                    Text('Junaid Khan',style: TextStyle(fontSize: 22,color: Colors.white
                    ),
                    ),
                    Text('muhammadjunaid.khan@outlook.com',style: TextStyle(fontSize: 15,color: Colors.white
                    ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),

              title: Text('Profile',style: TextStyle(fontSize: 18,
              ),
              ),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard',style: TextStyle(fontSize: 18,
              ),
              ),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ));

              },
            ),

            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text('Log Out',style: TextStyle(fontSize: 18,
              ),
              ),
              onTap: null,
            )

          ],
        )
    );
  }

}
