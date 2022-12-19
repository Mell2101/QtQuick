var point = function(val, point)
{
    var x = width / 6
    var y = height / 5

    switch(val)
    {
    case 0:



        point.clearRect(0, 0, width, height);
        point.fillStyle = Qt.rgba(1, 0, 1, 1);
        point.beginPath()
        point.moveTo(2*x , y);


        point.lineTo(2.1*x,  y/1.5);//up
        point.lineTo(2.2*x,  y);//down
        point.lineTo(x*2.5,  y);//line
        point.lineTo(x*2.3,  y*1.25);//down
        point.lineTo(x*2.5,  y*1.6); //down
        point.lineTo(x*2.1,  y*1.4);//up
        point.lineTo(x*1.7,  y*1.6);
        point.lineTo(x*1.9,  y*1.25);
        point.lineTo(1.7*x,  y);

        point.closePath()
        point.lineWidth = 5;
        point.stroke();
        point.fill()

        break;
    case 1:

        point.clearRect(0, 0, width, height);
        point.fillStyle = Qt.rgba(1, 0, 1, 1);
        point.beginPath()

        point.arc(4*x, y, 30, 0 , Math.PI*2)

        point.closePath();

        point.lineWidth = 5;
        point.stroke();
        point.fill()

        break;

    case 2:

        point.clearRect(0, 0, width, height);
        point.fillStyle = Qt.rgba(1, 1, 1, 1);
        point.beginPath()

        point.arc(4*x, y, 26, 0 , Math.PI*2)

        point.closePath();

        point.lineWidth = 5;
        point.stroke();
        point.fill()

        break;

    case 3:

        point.clearRect(0, 0, width, height);
        point.fillStyle = Qt.rgba(1, 0, 0, 1);

        point.beginPath()
        point.moveTo(4*x , y*3);
        point.lineTo(x*4.25, y*2.5);
        point.lineTo(x*4.5, y*3);
        point.lineTo(x*4.5, y*3.5);
        point.lineTo(x*4, y*3.5);
        point.lineTo(x*4, y*3);
        point.closePath();

        point.lineWidth = 5;
        point.stroke();
        point.fill()

        break;
    case 4:

        point.clearRect(0, 0, width, height);
        point.fillStyle = Qt.rgba(1, 0, 1, 1);
        point.beginPath()
        point.moveTo(2*x , y*3);

        point.lineTo(x*3, y*3);
        point.lineTo(x*2, y*4);
        point.lineTo(x*3, y*4);
        point.lineTo(x*2, y*3);


        point.closePath()
        point.lineWidth = 5;
        point.stroke();
        point.fill()

        break;
    }

}
