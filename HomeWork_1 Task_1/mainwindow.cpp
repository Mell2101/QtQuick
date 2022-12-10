#include "mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
{

    wid = new QWidget;
    wid->setFixedSize(300,200);
    wid->setWindowFlag( Qt::WindowStaysOnTopHint);




    layoutWin = new QFormLayout;
    buttonLogin = new QPushButton("Login",this);
    lineLogin = new QLineEdit(this);
    linePassword = new QLineEdit(this);



    linePassword->setPlaceholderText("Password");
    lineLogin->setPlaceholderText("Login");

    wid->setStyleSheet(
                "QWidget { "
                "background-color: rgba(0,0,200, 255);}"
                "QMainWindow { background-color: green; }"
                "QLineEdit{ background-color: white; }"
                "QPushButton{ background-color: grey; }"
                  );

    setStyleSheet("QMainWindow {background-color: green; }");


    connect(buttonLogin, SIGNAL(clicked()), this, SLOT(slotPushButton()));


    layoutWin->setVerticalSpacing(25);
    layoutWin->addWidget(lineLogin);
    layoutWin->setVerticalSpacing(25);
    layoutWin->addWidget(linePassword);
    layoutWin->setVerticalSpacing(25);
    layoutWin->addWidget(buttonLogin);

    wid->setLayout(layoutWin);
    wid->show();



    QPropertyAnimation* anim = new QPropertyAnimation(wid, "pos");

    anim->setDuration(0);
    anim->setStartValue(QPoint(0,0));
    anim->setEndValue(QPoint(width()-30, height()-150));
    anim->start();



}

MainWindow::~MainWindow()
{
}


void MainWindow::slotPushButton()
{
    if(lineLogin->text() == "1" && linePassword->text() == "1")
    {
        QPropertyAnimation* anim1 = new QPropertyAnimation(wid, "windowOpacity");
        anim1->setDuration(2000);
        anim1->setStartValue(1.0);
        anim1->setEndValue(0.0);

        anim1->start();

    }
    else
    {

        QPropertyAnimation* anim1 = new QPropertyAnimation(wid, "pos");
        anim1->setDuration(250);
        anim1->setStartValue(QPoint(wid->pos().x(),wid->pos().y()));
        anim1->setEndValue(QPoint(wid->pos().x()+5,wid->pos().y()));

        QPropertyAnimation* anim2 = new QPropertyAnimation(wid, "pos");
        anim2->setDuration(250);
        anim2->setStartValue(QPoint(wid->pos().x(), wid->pos().y()));
        anim2->setEndValue(QPoint(wid->pos().x()-10, wid->pos().y()));

        QPropertyAnimation* anim3 = new QPropertyAnimation(wid, "pos");
        anim3->setDuration(250);
        anim3->setStartValue(QPoint(wid->pos().x(), wid->pos().y()));
        anim3->setEndValue(QPoint(wid->pos().x()+5, wid->pos().y()));

        QSequentialAnimationGroup* group = new QSequentialAnimationGroup;
        group->addAnimation(anim1);
        group->addAnimation(anim2);
        group->addAnimation(anim3);

        group->start();

    }

}

