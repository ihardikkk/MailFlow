import 'package:flutter/material.dart';
import 'package:mail_merge/AttachmentsScreen.dart';
import 'package:mail_merge/VipScreen.dart';
import 'package:mail_merge/unsubscribe.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: const ChatList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle FAB action
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

// 📌 App Bar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Mail Merge", style: TextStyle(color: Colors.black)),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// 📌 Chat List Widget (Stateful for API integration)
class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  List<Map<String, String>> chatData = [];

  @override
  void initState() {
    super.initState();
    // Placeholder for API call in the future
    fetchEmails();
  }

  void fetchEmails() {
    setState(() {
      chatData = [
        {
          "name": "Peter",
          "message": "Thanks",
          "time": "11:01 AM",
          "avatar": "assets/peter.png",
        },
        {
          "name": "John Smith",
          "message": "Yay, I did it, thanks.",
          "time": "10:20 AM",
          "avatar": "assets/john.png",
        },
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: chatData.length,
      itemBuilder: (context, index) {
        return ChatItem(
          name: chatData[index]["name"]!,
          message: chatData[index]["message"]!,
          time: chatData[index]["time"]!,
          avatar: chatData[index]["avatar"]!,
        );
      },
    );
  }
}

// 📌 Chat Item Widget
class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String avatar;

  const ChatItem({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(avatar)),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(message, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Text(
        time,
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      ),
      onTap: () {
        // Handle tap event
      },
    );
  }
}

// 📌 Custom Bottom Navigation Bar (Stateful for dynamic navigation)
class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.shifting, // Ensures equal spacing
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: "VIP"),
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_file),
          label: "Attachments",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.block), label: "Unsubscribe"),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Home;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
            break;
          case 1: // VIP
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const VipScreen()),
            );
            break;
          case 2: // Attachments
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Attachmentsscreen(),
              ),
            );
            break;
          case 3: // Unsubscribe
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UnsubscribeScreen(),
              ),
            );
            break;
        }
      },
    );
  }
}
