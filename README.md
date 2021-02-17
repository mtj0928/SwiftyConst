# SwiftyConst

SwiftyConst can automatically embe your constant values to Swift files.  

## Input File
Prepare such following swift file.
```swift
let token = __const__TOKEN__text__ABCD__
```
SwiftyConst can replace `__const__TOKEN__text__ABCD__` with `$TOKEN`.  

The variable such `__const__TOKEN__text__ABCD__` consists of four components, `prefix`, `key`, `type` and `default value`.
The components must be joined with `__`.
- prefix: This is a just prefix, `const`
- key: This is a key for a constant
- type: This is an optional component. You can select `text` or `num`.  The default value is `text`
- default value: This is an optional component. This value will be embed when the value which matches the key does not exist.

## Installation
### Mint
```
$ mint install mtj0928/SwiftyConst
$ swifty-const --help
```

### Manual
```
$ swift build -c release
$ ./.build/release/swifty-const --help
```

## Usage
```
$ swifty-const <Input Swift file path> --o <Output swift file path> -e <enviroment toml file>
```
If `-e` option is set, SwiftyConst embe constant in YAML file. 
