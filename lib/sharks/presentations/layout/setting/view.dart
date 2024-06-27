import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  openAboutDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AboutDialog(
            applicationName: "TechHire",
            applicationIcon: Text("TH"),
            applicationVersion: '1.0.0',
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: false,
        ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(15, 20, 20, 50),
          children: [
            UserUI(),
            Text(
              "General Settings",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              title: Text('Bookmarks'),
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(Feather.bookmark, size: 20, color: Colors.white),
              ),
              trailing: Icon(
                Feather.chevron_right,
                size: 20,
              ),
              onTap: () {},
            ),
            Divider(
              height: 3,
            ),
            ListTile(
              title: Text('Dark mode'),
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(Feather.sun, size: 22, color: Colors.white),
              ),
              trailing: Switch.adaptive(
                  activeColor: Theme.of(context).primaryColor,
                  value: false,
                  onChanged: (bool) {}),
            ),
            Divider(
              height: 3,
            ),
            ListTile(
              title: Text('Get notifications'),
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(Entypo.bell, size: 22, color: Colors.white),
              ),
              trailing: Switch.adaptive(
                  activeColor: Theme.of(context).primaryColor,
                  value: true,
                  onChanged: (bool newValue) {}),
            ),
            Divider(
              height: 3,
            ),
            ListTile(
              title: Text('Contact us'),
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(Feather.mail, size: 20, color: Colors.white),
              ),
              trailing: Icon(
                Feather.chevron_right,
                size: 20,
              ),
              onTap: () {},
            ),
            Divider(
              height: 3,
            ),
            ListTile(
              title: Text('Language'),
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(Feather.globe, size: 20, color: Colors.white),
              ),
              trailing: Icon(
                Feather.chevron_right,
                size: 20,
              ),
              onTap: () {},
            ),
            Divider(
              height: 3,
            ),
            ListTile(
              title: Text('Rate this app'),
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(Feather.star, size: 20, color: Colors.white),
              ),
              trailing: Icon(
                Feather.chevron_right,
                size: 20,
              ),
              onTap: () {},
            ),
            Divider(
              height: 3,
            ),
            ListTile(
              title: Text('Licence'),
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.purpleAccent,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(Feather.paperclip, size: 20, color: Colors.white),
              ),
              trailing: Icon(
                Feather.chevron_right,
                size: 20,
              ),
              onTap: () => openAboutDialog(),
            ),
            Divider(
              height: 3,
            ),
            ListTile(
              title: Text('Privacy policy'),
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(Feather.lock, size: 20, color: Colors.white),
              ),
              trailing: Icon(
                Feather.chevron_right,
                size: 20,
              ),
              onTap: () {},
            ),
            Divider(
              height: 3,
            ),
            ListTile(
              title: Text('About us'),
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(Feather.info, size: 20, color: Colors.white),
              ),
              trailing: Icon(
                Feather.chevron_right,
                size: 20,
              ),
              onTap: () {},
            ),
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}

class SecurityOption extends StatelessWidget {
  const SecurityOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 3,
        ),
        ListTile(
          title: Text('Security'),
          leading: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(5)),
            child: Icon(Feather.lock, size: 20, color: Colors.white),
          ),
          trailing: Icon(
            Feather.chevron_right,
            size: 20,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}

class GuestUserUI extends StatelessWidget {
  const GuestUserUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('Login'),
          leading: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(5)),
            child: Icon(Feather.user, size: 20, color: Colors.white),
          ),
          trailing: Icon(
            Feather.chevron_right,
            size: 20,
          ),
          onTap: () {},
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class UserUI extends StatelessWidget {
  const UserUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[300],
                child: Text("TH"),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Tech Hire",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        ListTile(
          title: Text("tech.hire@gmail.com"),
          leading: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(5)),
            child: Icon(Feather.mail, size: 20, color: Colors.white),
          ),
        ),
        Divider(
          height: 3,
        ),
        ListTile(
          title: Text('Edit profile'),
          leading: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.circular(5)),
            child: Icon(Feather.edit_3, size: 20, color: Colors.white),
          ),
          trailing: Icon(
            Feather.chevron_right,
            size: 20,
          ),
          onTap: () {},
        ),
        Divider(
          height: 3,
        ),
        ListTile(
          title: Text('Logout'),
          leading: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(5)),
            child: Icon(Feather.log_out, size: 20, color: Colors.white),
          ),
          trailing: Icon(
            Feather.chevron_right,
            size: 20,
          ),
          onTap: () => openLogoutDialog(context),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }

  void openLogoutDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Logout title'),
            actions: [
              TextButton(
                child: Text('No'),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text('Yes'),
                onPressed: () {},
              )
            ],
          );
        });
  }
}
