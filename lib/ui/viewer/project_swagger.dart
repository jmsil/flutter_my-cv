import 'dart:js_interop';
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

import '../container.dart';
import '../layout/device.dart';
import '../layout/dimens.dart';
import '../layout/layout_model.dart';
import 'full_window_handler.dart';

class ProjectSwaggerWidget extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ProjectSwaggerWidget> {
  static bool isRegistered = false;
  static const String viewType = 'swagger-ui-view';

  @override
  void initState() {
    super.initState();

    if (isRegistered)
      return;

    isRegistered = true;

    platformViewRegistry.registerViewFactory(
      viewType,
      (int viewId) {
        web.HTMLIFrameElement iFrame = web.HTMLIFrameElement();
        iFrame.src = 'swagger/dist/index.html';
        iFrame.style.border = 'none';
        iFrame.style.width = '100%';
        iFrame.style.height = '100%';

        iFrame.onLoad.listen((_) {
          web.Document document = iFrame.contentWindow!.document;
          web.Element element = document.createElement('style');
          element.textContent =
            'html, body, .swagger-ui {'
            '  background: transparent;'
            '  background-color: transparent;'
            '}'
            '.swagger-ui .info .title {'
            '  font-size: 20px;'
            '}'
            '.swagger-ui .opblock-tag {'
            '  font-size: 16px;'
            '  font-weight: normal;'
            '}'
            '.swagger-ui .info {'
            '  margin: 0px'
            '}'
            '.swagger-ui .info .title small {'
            '  margin: 0 0 0 10px;'
            '  top: 4px;'
            '}'
            '.swagger-ui .scheme-container {'
            '  box-shadow:  0 0 0 0;'
            '  margin: 0px;'
            '  padding: 0px 0px 20px 0px;'
            '}';
          document.head?.appendChild(element);
        });

        iFrame.addEventListener(
          'wheel',
          ((web.Event event) {
            event.stopPropagation();
          }).toJS,
          web.EventListenerOptions(capture: true)
        );

        return iFrame;
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppThemeData themeData = LayoutModel.theme.viewer;
    final Widget htmlElementView = HtmlElementView(viewType: viewType);

    return _FullWindowHandler(
      themeData,
      htmlElementView,
      _FullWindowHandler(themeData, htmlElementView, null)
    );
  }
}

class _FullWindowHandler extends AppViewerFullWindowHandler {
  _FullWindowHandler(
    AppThemeData themeData, Widget child, Widget? fullWindowChild
  ) : super(
    iconColor: themeData.accent1.color,
    child: AppContainer(
      height: fullWindowChild == null ? null : 600,
      padding: AppDevice.isMobileDevice()
        ? const EdgeInsets.only(top: AppDimens.xxLarge, bottom: AppDimens.normal)
        : const AppEdgeInsets.xxxLarge(),
      color: Colors.white,
      borderColor: themeData.accent1.color.withDecorationAlpha,
      borderRadius: AppTheme.allBorderRadius,
      enableClip: true,
      child: child
    ),
    fullWindowChild: fullWindowChild
  );
}