const path = require('path');
const ManifestPlugin = require('webpack-manifest-plugin');

module.exports = {
  entry: './frontend/application.js',
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, 'frontend/dist')
  },
  mode: "production",
  module: {
    rules: [
      {
        test: /\.css$/,
        use: [
          "style-loader",
          "css-loader"
        ]
      }
    ]
  },
  plugins: [
    new ManifestPlugin(),
  ]
};
