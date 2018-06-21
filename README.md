# GO_CLI

GO_CLI is simple simulation of GO-Ride by GO-JEK runs on CLI. Like Go-Ride, the user as passenger can move to another coordinate picked up by drivers. You can set your coordinate or not as well with the driver coordinate. If you don't set them, they will set automatically, but you need to input your destination coordinates. This application also show interactive menu so you can insert your choice depends what shown up on your screen. This application also how much bill that you need to pay, if you agree this application will still run and if you don't it will closed. Every time you order Go-Ride, it will saved on .txt file as history and you also can see your Go-Ride history.

## Getting Started
All you need is just download all of this file and run user.rb file.
This application can run within 3 different method. The first is method without parameters, then with 3 parameters (size of map, your x coordinate, your y coordinate) and last with file from outside program as parameters. You can use them by uncomment one of them and the bottom of user.rb file, if you want use one of them just uncomment and if you won't just comment it.


Note : sometimes it shows an error, all you need is just re-run the application. The error caused by math.random that show at least twice same result and I haven't give error handling for this case.