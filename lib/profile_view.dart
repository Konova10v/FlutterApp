import 'package:design/network/dio_client.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'model/user.dart';
import 'model/data.dart';
import 'package:dio/dio.dart';


class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}


class _ProfileViewState extends State<ProfileView> {
  final DioClient _client = DioClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User?>(
        future: _client.getUser(id: '1'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User? userInfo = snapshot.data;
            if (userInfo != null) {
              Data userData = userInfo.data;
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Header(
                          name: '${userData.firstName + ' ' +  userData.lastName}',
                          avatar: userData.avatar,),

                        Container(
                          padding: EdgeInsets.fromLTRB(25, 30, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('My Tasks', style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),),

                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: kButtonColor,
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(10),
                                ),
                                onPressed: (){
                                  setState(() {

                                  });
                                },
                                child: Icon(Icons.calendar_today, color: Colors.white,),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TaskCell(
                                  name: 'To Do',
                                  progress: '5 task now. 1 started.',
                                  color: Colors.redAccent,
                                  icon: Icon(Icons.access_time_rounded, color: Colors.white),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TaskCell(
                                  name: 'In Progress',
                                  progress: '1 task now. 1 started.',
                                  color: kHeaderColor,
                                  icon: Icon(Icons.circle_outlined, color: Colors.white),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TaskCell(
                                  name: 'Done',
                                  progress: '10 task now. 18 started.',
                                  color: Colors.deepPurple,
                                  icon: Icon(Icons.done, color: Colors.white),),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.fromLTRB(25, 30, 10, 10),
                          child: Row(
                            children: [
                              Text('Active Projects', style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),),
                            ],
                          ),
                        ),

                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          padding: EdgeInsets.all(20),
                          childAspectRatio: 1/1.3 ,
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 30,
                          physics: NeverScrollableScrollPhysics(), children: [
                          ProjectCell(
                            name: 'Medical App',
                            progress: 0.2,
                            color: kButtonColor,
                            time: '9 hours progress',),
                          ProjectCell(
                            name: 'Fitness App',
                            progress: 0.8,
                            color: Colors.redAccent,
                            time: '5 hours progress',),
                          ProjectCell(
                            name: 'Fuck team',
                            progress: 1.0,
                            color: kHeaderColor,
                            time: '99 hours progress',),
                          ProjectCell(
                            name: 'Another support App',
                            progress: 0.5,
                            color: Colors.deepPurple,
                            time: '1 hours progress',),
                        ],),
                      ],
                    ),
                  ),
                ),
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String name;
  final String avatar;

  const Header({
    required this.name,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: kHeaderColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        ),
        padding: EdgeInsets.fromLTRB(10, 40, 10, 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){

                }, icon: Icon(Icons.menu, color: Colors.black, size: 30,)),

                IconButton(onPressed: (){

                }, icon: Icon(Icons.search, color: Colors.black, size: 30,)),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 50,
                  backgroundImage: NetworkImage(avatar),
                ),

                Column(
                  children: [
                    Text(name, style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                    ),),

                    Text('Mobile Developer', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.brown,
                    ),),
                  ],
                )
              ],
            ),
          ],
        )
    );
  }
}

class TaskCell extends StatelessWidget {
  final String name;
  final String progress;
  final Color color;
  final Icon icon;

  const TaskCell({
    required this.name,
    required this.progress,
    required this.color,
    required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: color,
              shape: CircleBorder(),
              padding: EdgeInsets.all(10),
            ),
            onPressed: (){

            },
            child: icon),

        SizedBox(width: 10,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),

            Text(progress),
          ],
        ),
      ],
    );
  }
}

class ProjectCell extends StatelessWidget {
  final String name;
  final String time;
  final Color color;
  final double progress;

  const ProjectCell({
    required this.name,
    required this.time,
    required this.color,
    required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20,),
              CircularPercentIndicator(
                radius: 40.0,
                lineWidth: 8.0,
                percent: progress,
                center: Text(printText(progress), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
                progressColor: Colors.white,
              ),
            ],
          ),

          Wrap(
            direction: Axis.horizontal, //Vertical || Horizontal
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(time, style: TextStyle(color: Colors.white,),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }

  String printText (double progress) {
    String test = "";
    double result = progress * 100;
    int procent = result.round();
    return '$procent%';
  }
}
