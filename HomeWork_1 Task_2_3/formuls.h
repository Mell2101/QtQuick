#ifndef FORMULS_H
#define FORMULS_H

#include <QObject>

class Formuls : public QObject
{
    Q_OBJECT
public:
    explicit Formuls(QObject *parent = nullptr);

    Q_INVOKABLE void setA(QString a = 0);
    Q_INVOKABLE void setB(QString b = 0);
    Q_INVOKABLE void setC(QString c = 0);

    Q_INVOKABLE void setX1(QString x1 = 0);
    Q_INVOKABLE void setX2(QString x2 = 0);
    Q_INVOKABLE void setX3(QString x3 = 0);
    Q_INVOKABLE void setY1(QString y1 = 0);
    Q_INVOKABLE void setY2(QString y2 = 0);
    Q_INVOKABLE void setY3(QString y3 = 0);

    Q_INVOKABLE QString solution();
    Q_INVOKABLE QString solution2();


signals:

private:

    //Geron Formul
    double _a;
    double _b;
    double _c;
    double _p;
    double _S;

    //Coordinates formul
    double _x1;
    double _x2;
    double _x3;
    double _y1;
    double _y2;
    double _y3;
    double _Scoor;

};



#endif // FORMULS_H
