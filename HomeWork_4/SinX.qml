import QtQuick.Controls 2.15
import QtQuick 2.15
import QtCharts 2.15

Item {
    id: _item
    anchors.fill: parent


    ChartView {
        title: "Sin(x)"
        anchors.fill: parent
        legend.visible: false
        antialiasing: true




        SplineSeries
        {
            id:_spline
            axisY: ValuesAxis {
                min: -2
                max: 2
            }

            axisX: ValuesAxis {
                min: 0
                max: 5
            }


        }




    }

    Button{
        width:50
        height: 25

        onClicked: {
            stepX()
            xy()
        }
    }

    function stepX()
    {   var n = 0
        for(var i = 0; i <= 5; i += 0.1)
        {
            graf.x[n] = i

            n++
        }


    }


    function xy()
    {

        var n = 0
        for(var i = 0; i <= 5; i += 0.1)
        {
            _spline.append(graf.x[n], Math.sin(graf.x[n]))
            n++
        }

    }

}


