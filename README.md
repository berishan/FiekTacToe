# FiekTacToe

This application is created and developed by Nora Berisha and Rinor Ahmeti.

### About
This application is written in Swift 5. It consists of multiple views.

FiekTacToe is a simple app on which you can play a Tic Tac Toe game and save the results on a local database (Realm).

In order to run this application on your machine, you need to configure the Realm Database via the following commands:

```
sudo gem install cocoapods
```

After cocoapods is installed, go to the project directory and run the following commands:

```
pod init; Open Podfile
```

The previous command will open a file in which you have to add:

```
pod 'RealmSwift'
```

Save the changes and run:

```
pod install
```

After installation, run the following command to open your .xcworkspace folder and you're good to go.

```
open tictactoe.xcworkspace
```

Enjoy our simple app :)
