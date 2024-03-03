import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kind_words/core/global/colors.dart';
import 'package:kind_words/core/theme/theme.controller.dart';

class ChangeThemeWidget extends StatelessWidget {
  ChangeThemeWidget({
    super.key,
  });

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Cambiar tema'),
      subtitle: const Text('Selecciona un color para cambiar el tema'),
      trailing: Obx(
        () => Icon(
          Icons.circle,
          color: themeController.primaryColor.value,
        ),
      ),
      onTap: () {
        final RenderBox overlay =
            Overlay.of(context).context.findRenderObject() as RenderBox;
        final RenderBox box = context.findRenderObject() as RenderBox;
        final offset = box.localToGlobal(Offset.zero, ancestor: overlay);
        showMenu<Color>(
          context: context,
          position: RelativeRect.fromLTRB(
            MediaQuery.of(context).size.width,
            offset.dy + box.size.height,
            overlay.size.width - offset.dx,
            overlay.size.height - offset.dy,
          ),
          items: colorList.entries.map((e) {
            return PopupMenuItem<Color>(
              value: e.key,
              child: ListTile(
                title: Text(e.value),
                leading: Icon(
                  Icons.circle,
                  color: e.key,
                ),
              ),
            );
          }).toList(),
        ).then(
          (color) {
            if (color != null) {
              themeController.changePrimaryColor(color);
            }
          },
        );
      },
    );
  }
}
