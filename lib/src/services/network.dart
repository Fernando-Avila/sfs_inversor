import 'package:url_launcher/url_launcher.dart';

Future launchurl(String urlLink) async {
  Uri url = Uri.parse(urlLink);
  await launchUrl(url);
  if (await launchUrl(url)) {
    return false;
  }
}
