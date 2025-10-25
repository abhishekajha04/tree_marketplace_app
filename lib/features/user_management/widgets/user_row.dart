import 'package:flutter/material.dart';
import '../widgets/status_label.dart';

class UserRow extends StatelessWidget {
  final Map<String, dynamic> user;
  const UserRow({required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Checkbox(value: false, onChanged: (val) {}),
              CircleAvatar(
                backgroundColor: Colors.grey[400],
                child: Text(user['name'][0], style: TextStyle(color: Colors.white)),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user['name'], style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                  Text("ID: ${user['id']}", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                ],
              ),
            ],
          ),
        ),
        Expanded(flex: 2, child: Text(user['email'], style: TextStyle(color: Colors.grey[800]))),
        Expanded(child: StatusLabel(text: user['status'])),
        Expanded(child: StatusLabel(text: user['kyc'])),
        Expanded(child: Text(user['join'], style: TextStyle(color: Colors.grey[600]))),
        Expanded(
          child: Row(
            children: [
              Icon(Icons.remove_red_eye_outlined, size: 20),
              SizedBox(width: 10),
              Icon(Icons.more_vert, size: 20),
            ],
          ),
        ),
      ],
    );
  }
}
