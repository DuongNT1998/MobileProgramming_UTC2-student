import 'package:flutter/material.dart';
import '../widgets/option_tile.dart';

class SimpleDialogUtils {
  static Future<String?> showOptionDialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text("Chọn một tùy chọn"),
          children: [
            OptionTile(
              title: "Camera",
              icon: Icons.camera_alt,
              onTap: () {
                Navigator.pop(context, "Camera");
              },
            ),

            OptionTile(
              title: "Thư viện",
              icon: Icons.photo,
              onTap: () {
                Navigator.pop(context, "Gallery");
              },
            ),

            OptionTile(
              title: "Hủy",
              icon: Icons.close,
              onTap: () {
                Navigator.pop(context, "Cancel");
              },
            ),
          ],
        );
      },
    );
  }
}
