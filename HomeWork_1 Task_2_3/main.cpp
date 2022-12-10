#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "formuls.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<Formuls>("Formul", 1,0 ,"Formul");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/QQHomeWork_1_2/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
