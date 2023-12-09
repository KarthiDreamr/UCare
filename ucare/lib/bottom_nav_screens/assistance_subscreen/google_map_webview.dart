import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';


class WebViewMap extends StatelessWidget {
  const WebViewMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Doctor Recommendations'),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse('https://www.google.com/maps/search/nearby+kidney+hospital/')),
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                // Uri url = navigationAction.request.url!;
                // if (url.scheme == "https") {
                //   return NavigationActionPolicy.ALLOW;
                // }
                // return NavigationActionPolicy.CANCEL;
                return NavigationActionPolicy.ALLOW;
              },
              initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    javaScriptEnabled: true,
                    // useShouldOverrideUrlLoading: true,
                    // useOnLoadResource: true,
                    // useOnDownloadStart: true,
                    // clearCache: true,
                    // cacheEnabled: false,
                    // incognito: true,
                    // // userAgent: 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) '
                    // //     'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36',
                    // transparentBackground: true,
                    // disableContextMenu: true,
                    // disableHorizontalScroll: true,
                    // disableVerticalScroll: true,
                    // verticalScrollBarEnabled: false,
                    // horizontalScrollBarEnabled: false,
                    // supportZoom: false,
                  )),
              androidOnGeolocationPermissionsShowPrompt: (InAppWebViewController controller, String origin) async {
                final status = await Permission.location.request();
                return GeolocationPermissionShowPromptResponse(
                    origin: origin,
                    allow: status.isGranted,
                    retain: true
                );
              },
            ),
          ),
        ),
    );
  }
}

