#include "fluentuiplugin.h"
#include <QtQml/QQmlExtensionPlugin>
#include <QGuiApplication>
#include <qdebug.h>
#include "WindowHelper.h"
#include "Def.h"
#include "FluApp.h"
#include "FluColors.h"
#include "FluTheme.h"
#include "FluTools.h"
#include "FluTextStyle.h"
int major = 1;
int minor = 0;
void FluentUIPlugin::registerTypes(const char *uri)
{
    qmlRegisterType<WindowHelper>(uri,major,minor,"WindowHelper");
    qmlRegisterType<FluColorSet>(uri,major,minor,"FluColorSet");
    qmlRegisterUncreatableMetaObject(Fluent_Awesome::staticMetaObject,  uri,major,minor,"FluentIcons", "Access to enums & flags only");
    qmlRegisterUncreatableMetaObject(Fluent_DarkMode::staticMetaObject,  uri,major,minor,"FluDarkMode", "Access to enums & flags only");

    qmlRegisterUncreatableMetaObject(FluNavigationViewType::staticMetaObject,  uri,major,minor,"FluNavigationViewType", "Access to enums & flags only");
    qmlRegisterUncreatableMetaObject(FluPageType::staticMetaObject,  uri,major,minor,"FluPageType", "Access to enums & flags only");
    qmlRegisterUncreatableMetaObject(FluStatusViewType::staticMetaObject,  uri,major,minor,"FluStatusViewType", "Access to enums & flags only");

}

void FluentUIPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    Q_UNUSED(engine)
    Q_UNUSED(uri)
#ifdef Q_OS_WIN
    QFont font;
    font.setFamily("Microsoft YaHei");
    QGuiApplication::setFont(font);
#endif
    FluApp* app = FluApp::getInstance();
    engine->rootContext()->setContextProperty("FluApp",app);
    FluColors* colors = FluColors::getInstance();
    engine->rootContext()->setContextProperty("FluColors",colors);
    FluTheme* theme = FluTheme::getInstance();
    engine->rootContext()->setContextProperty("FluTheme",theme);
    FluTools* tools = FluTools::getInstance();
    engine->rootContext()->setContextProperty("FluTools",tools);
    FluTextStyle* textStyle = FluTextStyle::getInstance();
    engine->rootContext()->setContextProperty("FluTextStyle",textStyle);
}
