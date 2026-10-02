import 'dart:js_interop';
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

import '../../scaffold/device.dart';
import '../container/container.dart';
import '../layout/layout_provider.dart';
import 'full_window_handler.dart';

class ProjectSwaggerWidget extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ProjectSwaggerWidget> {
  static const String _viewType = 'swagger-ui-view';

  @override
  void initState() {
    super.initState();

    platformViewRegistry.registerViewFactory(
      _viewType,
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
    final AppTheme theme = context.appLayout.theme;
    final Widget htmlElementView = HtmlElementView(viewType: _viewType);

    return _FullWindowHandler(
      theme,
      htmlElementView,
      _FullWindowHandler(theme, htmlElementView, null)
    );
  }
}

class _FullWindowHandler extends AppViewerFullWindowHandler {
  _FullWindowHandler(AppTheme theme, Widget child, Widget? fullWindowChild)
    : super(
        iconColor: theme.overBackgroundColor2,
        child: AppContainer(
          height: fullWindowChild == null ? null : 600,
          padding: AppDevice.isMobileDevice()
            ? const EdgeInsets.only(top: 48, bottom: 16)
            : const EdgeInsets.all(64),
          color: theme.overBackgroundColor3,
          borderColor: theme.overBackgroundColor2.withValues(alpha: 0.16),
          borderRadius: AppTheme.allBorderRadius,
          isClipped: true,
          child: child
        ),
        fullWindowChild: fullWindowChild
      );
}