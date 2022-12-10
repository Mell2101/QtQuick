#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QPushButton>
#include <QLineEdit>
#include <QFormLayout>
#include <QPainter>
#include <QWidget>
#include <QPropertyAnimation>
#include <QSequentialAnimationGroup>





class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();


private slots:
    void slotPushButton();
private:
    QFormLayout* layoutWin;
    QPushButton* buttonLogin;
    QLineEdit* lineLogin;
    QLineEdit* linePassword;
    QWidget* wid;




};
#endif // MAINWINDOW_H
