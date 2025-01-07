import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}

class ConstantBottomBar extends StatelessWidget {
  const ConstantBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BottomAppBar(
        color: colors.primary,
        shape: const CircularNotchedRectangle(),
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 35,
                  child: IconButton(
                    icon: Icon(Icons.location_pin,color: colors.onPrimary,),
                    tooltip: 'Facebook',
                    onPressed: (){
                      _launchInBrowser(Uri(scheme: 'https',host: 'www.facebook.com',path: 'escomipnmx/?locale=es_LA'));
                    },
                  ),
                ),
                Text('Facebook',style: TextStyle(fontSize: 10,color: colors.onPrimary),),
              ]
            ),





            Column(
              children: [
                SizedBox(
                  height: 35,
                  child: IconButton(
                    icon: Icon(Icons.bookmark_outline_rounded,color: colors.onPrimary),
                    tooltip: 'X',
                    onPressed: (){
                      _launchInBrowser(Uri(scheme: 'https',host: 'www.x.com',path: 'escomunidad'));
                    },
                  ),
                ),
                Text('X',style: TextStyle(fontSize: 10,color: colors.onPrimary),),
              ]
            ),




            Column(
              children: [
                SizedBox(
                  height: 35,
                  child: IconButton(
                    icon: Icon(Icons.notifications_none,color: colors.onPrimary),
                    tooltip: 'Instagram',
                    onPressed: (){
                      _launchInBrowser(Uri(scheme: 'https',host: 'www.instagram.com',path: 'explore/locations/116138758396662/escom-ipn/'));
                    },
                  ),
                ),
                Text('Instagram',style: TextStyle(fontSize: 10,color: colors.onPrimary),),
              ]
            )
          ],
        )
      );
  }
}