const path = require('path')
const webpack = require('webpack')

module.exports = {
  entry: './src/main.js',
  output: {
    path: path.resolve(__dirname, 'public'),
    publicPath: '/public/',
    filename: 'bundle.js'
  },
  devtool: 'inline',
  resolve: {
    extensions: ['.js'],
    alias: {
      'mqttclient': path.resolve('./until/app.js')  // <-- When you build or restart dev-server, you'll get an error if the path to your utils.js file is incorrect.
    }
  },
  plugins: [
    new webpack.ProvidePlugin({
      $$:'dom7/dist/dom7.js',
      mqtt:'mqtt',
      mqttclient:'mqttclient'
    })
  ],
  module: {
    rules: [
      {
        test: /\.css$/,
        loaders: ['style-loader', 'css-loader'],
      },
      {
        test: /\.(woff|woff2|eot|ttf)$/,
        loader: 'url-loader',
        options: {
          limit: 100000
        }
      },
      {
        test: /\.tag$/,
        exclude: /node_modules/,
        use: [{
          loader: 'riot-tag-loader',
          options: {
            hot: true,
            type: 'es6'
          }
        }]
      },
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env']
          }
        }
      }
    ]
  }
}
