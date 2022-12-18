#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "setgrafic.h"
#include <QtCharts>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QApplication app(argc, argv);

    SetGrafic graf;

    QQmlApplicationEngine engine;

    qRegisterMetaType<SetGrafic::typeGraf>("SetingGraf::typeGraf");
    qmlRegisterType<SetGrafic>("Graf", 1, 0, "Graf");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.rootContext()->setContextProperty("graf", &graf);
    engine.load(url);

    return app.exec();
}
