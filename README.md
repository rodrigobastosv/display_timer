<a href="https://www.buymeacoffee.com/rodrigobastosv" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

The display_timer is a handy widget when you want to display a ticking timer on the screen. The Widget handles the ticking and provides a simple Widget builder, so you can customize the widget to your preferences.

## Features

DisplayTimerBuilder is a WidgetBuilder that receives all the necessary information to display the timer. It receives the Hours, Minutes and Seconds. You can get this information and display whatever your needs.


## Usage

To see a working example of the package, please refer to the example folder.

The above example shows a basic usage of the package. See that the displayTimerBuilder receives the values String. So you can freely use them as your wish. The package also offers a onTimerEnd callback that will be executed whenever the timer ends.

The above example creates a 10 second timer and prints the 'Timer has ended. Do something' String whenever the timer ends.

```dart
class DisplayTimerTest extends StatelessWidget {
  const DisplayTimerTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DisplayTimer(
          timerDuration: const Duration(seconds: 10),
          displayTimerBuilder: (String hours, String minutes, String seconds) => Text(
            '$hours:$minutes:$seconds',
          ),
          onTimerEnd: () async {
            print('Timer has ended. Do something');
          },
        ),
      ),
    );
  }
}
```

