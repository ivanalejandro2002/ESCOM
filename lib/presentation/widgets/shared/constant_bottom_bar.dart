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

    // Helper function to build icon buttons with labels
    Widget _buildIconButton({
      required IconData icon,
      required String tooltip,
      required String label,
      required Uri url,
      required Color color,
    }) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 35,
            child: IconButton(
              icon: Icon(icon, color: color),
              tooltip: tooltip,
              onPressed: () => _launchInBrowser(url),
            ),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 10, color: color),
          ),
        ],
      );
    }

    return BottomAppBar(
      color: colors.primary,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIconButton(
            icon: Icons.facebook,
            tooltip: 'Facebook',
            label: 'Facebook',
            url: Uri(
              scheme: 'https',
              host: 'www.facebook.com',
              path: 'escomipnmx/?locale=es_LA',
            ),
            color: colors.onPrimary,
          ),
          _buildIconButton(
            icon: Icons.bookmark_outline_rounded,
            tooltip: 'X',
            label: 'X',
            url: Uri(
              scheme: 'https',
              host: 'www.x.com',
              path: 'escomunidad',
            ),
            color: colors.onPrimary,
          ),
          _buildIconButton(
            icon: Icons.notification_add,
            tooltip: 'Instagram',
            label: 'Instagram',
            url: Uri(
              scheme: 'https',
              host: 'www.instagram.com',
              path: 'explore/locations/116138758396662/escom-ipn/',
            ),
            color: colors.onPrimary,
          ),
        ],
      ),
    );
  }
}
