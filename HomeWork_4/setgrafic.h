#ifndef SETGRAFIC_H
#define SETGRAFIC_H
#include "auto_property.h"
#include <QObject>

class SetGrafic : public QObject
{

    Q_OBJECT
    AUTO_PROPERTY(QString, nameX)
    AUTO_PROPERTY(QVector<double>, x)
    AUTO_PROPERTY(QVector<double>, y)
public:
    explicit SetGrafic(QObject *parent = nullptr);
    enum class typeGraf
    {
        sin = 0,
        yx = 1,
        yx25 = 2,
        yxx = 3,
        ylog2x = 4

    };
    Q_ENUM(typeGraf)

signals:

};

#endif // SETGRAFIC_H
