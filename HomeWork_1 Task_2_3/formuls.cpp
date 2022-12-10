#include "formuls.h"
#include <math.h>

Formuls::Formuls(QObject *parent)
    : QObject{parent}
{

}

void Formuls::setA(QString a)
{
    _a = a.toDouble();
}

void Formuls::setB(QString b)
{
    _b = b.toDouble();
}

void Formuls::setC(QString c)
{
    _c = c.toDouble();
}

void Formuls::setX1(QString x1)
{
    _x1 = x1.toDouble();
}

void Formuls::setX2(QString x2)
{
    _x2 = x2.toDouble();
}

void Formuls::setX3(QString x3)
{
    _x3 = x3.toDouble();
}

void Formuls::setY1(QString y1)
{
    _y1 = y1.toDouble();
}

void Formuls::setY2(QString y2)
{
    _y2 = y2.toDouble();
}

void Formuls::setY3(QString y3)
{
    _y3 = y3.toDouble();
}

QString Formuls::solution()
{
    _p = (_a+_b+_c)/2;
    _S = _p*(_p-_a)*(_p-_b)*(_p-_c);

    return QString::number(sqrt(_S));
}

QString Formuls::solution2()
{
    _Scoor = (_x1-_x3)*(_y2-_y3)-(_x2-_x3)*(_y1-_y3);

    return QString::number(abs(_Scoor/2));
}
