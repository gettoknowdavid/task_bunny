import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:task_bunny/common/common.dart';
import 'package:task_bunny/common/widgets/tb_extensions.dart';

@lazySingleton
class MailService {
  Future openMailApp(BuildContext context) async {
    await OpenMailApp.openMailApp().then((result) {
      if (!result.didOpen && !result.canOpen) {
        showNoMailBottomSheet(context);
      } else if (!result.didOpen && result.canOpen) {
        showMailBottomSheet(context, result.options);
      }
    });
  }
}

Future showNoMailBottomSheet(BuildContext context) {
  return context.showTBDialog(
    builder: (context) => const AlertDialog(
      title: TBText('No Mail App Found', textAlign: TextAlign.center),
      content: TBText(
        'We could not find any mail app available on this device. Download one and try again.',
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Future showMailBottomSheet(BuildContext context, List<MailApp> mailApps) {
  return context.showTBDialog(
    builder: (context) => MailAppPickerDialog(mailApps: mailApps),
  );
}
