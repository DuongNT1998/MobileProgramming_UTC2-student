import 'package:flutter/material.dart';
import '../utils/simple_dialog_utils.dart';

class DialogDemoView extends StatelessWidget {
  const DialogDemoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SimpleDialog Demo")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final result = await SimpleDialogUtils.showOptionDialog(context);

            if (result != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Bạn chọn: $result")));
            }
          },
          child: const Text("Mở SimpleDialog"),
        ),
      ),
    );
  }
}
