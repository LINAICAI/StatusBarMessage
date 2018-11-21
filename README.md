
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## How to use

```ruby
StatusBarMessage.show(with: "submit success!", style: .success, duration: 2.0)
```

or if you want to show loading statusBar message and it should be dismiss with your custom block when you want to close , you should use follow : 

```ruby
let message = StatusBarMessage.show(with: "loading...", style: .loading)
DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute:{
//Do what you want to do
message.dismiss({
StatusBarMessage.show(with: "submit success!", style: .success, duration: 2.0)
})
})
```


## Requirements

iOS8 , Swift4

## Installation

StatusBarMessage is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'StatusBarMessage'
```

## Author

linaicai2012@gmail.com

## License

StatusBarMessage is available under the MIT license. See the LICENSE file for more info.
