import 'package:better_web_v2/constants/linkdata.dart';
import 'package:better_web_v2/constants/theme_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserCard extends StatelessWidget {
  final int id;
  final String name;
  final String type;
  final String userType;
  const UserCard(this.id, this.name, this.type, this.userType, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: () => Get.to(UserDetail(), arguments: {'id': id.toString()}),

      child: Listener(
        onPointerDown: (event) => _onPointerDown(event, context),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
          height: 85,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: ThemeColors.milky),
              borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        margin: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48),
                            color: ThemeColors.white),
                        child: const Padding(
                          padding: EdgeInsets.all(5),
                          child: FlutterLogo(),
                        ),
                      ),
                      Text(name)
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      demText(type),
                      SizedBox(
                        width: 65,
                        height: 15,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            demText('Type'),
                            demText(userType),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget demText(String txt) {
    return Text(
      txt,
      style: const TextStyle(
          fontSize: 10,
          color: ThemeColors.gray,
          fontWeight: FontWeight.bold,
          letterSpacing: 1),
    );
  }

  Future<void> _onPointerDown(PointerDownEvent event, context) async {
    // Check if right mouse button clicked
    if (event.kind == PointerDeviceKind.mouse &&
        event.buttons == kSecondaryMouseButton) {
      final overlay =
          Overlay.of(context)!.context.findRenderObject() as RenderBox;
      final menuItem = await showMenu<int>(
          context: context,
          items: [
            const PopupMenuItem(child: Text('Edit'), value: 1),
            const PopupMenuItem(child: Text('Delete'), value: 2),
          ],
          position: RelativeRect.fromSize(
              event.position & const Size(48.0, 48.0), overlay.size));
      // Check if menu item clicked
      switch (menuItem) {
        case 1:
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Edit clicked'),
            behavior: SnackBarBehavior.floating,
          ));
          break;
        case 2:
          deleteAlbum(id);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Delete clicked'),
              behavior: SnackBarBehavior.floating));
          break;
        default:
      }
    }
  }
}

Future<void> deleteAlbum(int id) async {
  // ignore: unused_local_variable
  final http.Response response = await http.delete(
    Uri.parse(UriLink.uri + '/user/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}
