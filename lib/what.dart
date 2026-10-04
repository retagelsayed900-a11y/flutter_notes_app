import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final List<Map<String, String>> chats = [
    {
      "name": "Hoda",
      "message": "Hello my girl!",
      "time": "11:55 PM",
      "image": "https://i.pravatar.cc/150?img=47",
    },
    {
      "name": "reta",
      "message": "Video",
      "time": "09:55 PM",
      "image": "https://i.pravatar.cc/150?img=32",
    },
    {
      "name": "Esraa",
      "message": "Gif Gif",
      "time": "10:55 PM",
      "image": "https://i.pravatar.cc/150?img=25",
    },
    {
      "name": "Mama",
      "message": "Gif Gif",
      "time": "11:55 PM",
      "image": "https://i.pravatar.cc/150?img=44",
    },
    {
      "name": "Kholoud",
      "message": "Helpppppppp...",
      "time": "11:55 PM",
      "image": "https://i.pravatar.cc/150?img=12",
    },
    {
      "name": "Ayaat",
      "message": "My best hobb...",
      "time": "11:55 PM",
      "image": "https://i.pravatar.cc/150?img=49",
    },
    {
      "name": "dena",
      "message": "Video",
      "time": "09:55 PM",
      "image": "https://i.pravatar.cc/150?img=5",
    },
    {
      "name": "Salma",
      "message": "Hello",
      "time": "10:55 PM",
      "image": "https://i.pravatar.cc/150?img=9",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff071017),

      appBar: AppBar(
        backgroundColor: const Color(0xff202c33),
        elevation: 0,
        title: const Text(
          "WhatsApp",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 8),
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                color: const Color(0xff202c33),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Row(
                children: [
                  SizedBox(width: 16),
                  Icon(
                    Icons.search,
                    color: Colors.white70,
                    size: 30,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Ask Meta AI or Search",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),

          ListTile(
            leading: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: const Color(0xff26343b),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.archive_outlined),
            ),
            title: const Text(
              "Archived",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Text("1"),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];

                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 2,
                  ),

                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      chat["image"]!,
                    ),
                  ),

                  title: Text(
                    chat["name"]!,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  subtitle: Row(
                    children: [
                      if (chat["message"] == "Video")
                        const Icon(
                          Icons.videocam_outlined,
                          size: 20,
                        ),

                      if (chat["message"] == "Video")
                        const SizedBox(width: 5),

                      if (chat["message"] == "Gif Gif")
                        const Text(
                          "GIF",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      if (chat["message"] == "Gif Gif")
                        const SizedBox(width: 5),

                      Expanded(
                        child: Text(
                          chat["message"]!,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  trailing: Text(
                    chat["time"]!,
                    style: const TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            mini: true,
            backgroundColor: const Color(0xff263238),
            onPressed: () {},
            child: const Icon(
              Icons.smart_toy,
              color: Colors.purple,
            ),
          ),

          const SizedBox(height: 14),

          FloatingActionButton(
            backgroundColor: const Color(0xff25D366),
            onPressed: () {},
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: const Color(0xff16121b),
        selectedItemColor: const Color(0xff25D366),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: "Updates",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_outlined),
            label: "",
          ),
        ],
      ),
    );
  }
}
  