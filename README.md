# babel-plugin-transform-react-display-name-pipe
Provides improved display names (eg when debugging) for React components written as functional pipelines using `flow()`,
`flowMax()`, or `pipe()`

This improves the debugging experience when using [`ad-hok`](https://github.com/helixbass/ad-hok)

## Installation

```
$ npm install --save-dev babel-plugin-transform-react-display-name-pipe
```
In your `.babelrc` (or `babel.config.js`):
```
"plugins": ["transform-react-display-name-pipe"]
```

## License

MIT
