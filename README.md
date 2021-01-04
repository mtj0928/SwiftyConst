# SwiftyConst

SwiftyConst can automatically embe your enviroment values to Swift files.  

## Input File
Prepare such following swift file.
```swift
let token = __const__TOKEN__text__ABCD__
```
SwiftyConst can replace `__const__TOKEN__text__ABCD__` with `$TOKEN`.  

The variable such `__const__TOKEN__text__ABCD__` consists of four components, `prefix`, `key`, `type` and `default value`.
The components must be joined with `__`.
- prefix: This is a just prefix, `const`
- key: This is a key for an environment value
- type: This is an optional component. You can select `text` or `num`.  The default value is `text`
- default value: This is an optional component. You can set default value when the enviroment value does not exist.


## Build
```
$ swift build -c release
```

## Run
```
$ ./.build/release/swifty-const <Input Swift file path> --output <Output swift file path>
```


