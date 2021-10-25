mkdir src src/test public __mocks__

touch \
    .gitignore \
    .babelrc \
    src/index.js \
    src/test/setupTests.js \
    webpack.config.js \
    public/index.html \
    __mocks__/fileMock.js \
    __mocks__/styleMock.js

tee -a .gitignore <<END
node_modules
.coverage
.DS_Store
END

tee -a .babelrc <<END
{
   "presets": [
       "@babel/preset-env",
       "@babel/preset-react"
   ]
}
END


tee -a src/index.js << END
import React from 'react';
import ReactDOM from 'react-dom';

const App = () => <h1>Hello World!</h1>

ReactDOM.render(<App />, document.getElementById('root'));
END


tee -a webpack.config.js << END
const path = require('path')
const HtmlWebpackPlugin = require('html-webpack-plugin')

module.exports = {
  // Where files should be sent once they are bundled
 output: {
   path: path.join(__dirname, '/dist'),
   filename: 'index.bundle.js'
 },
  // webpack 5 comes with devServer which loads in development mode
 devServer: {
   port: 3000,
   watchContentBase: true
 },
  // Rules of how webpack will take our files, complie & bundle them for the browser 
 module: {
   rules: [
     {
       test: /\.(js|jsx)$/,
       exclude: /nodeModules/,
       use: {
         loader: 'babel-loader'
       }
     },
     {
       test: /\.css$/,
       use: ['style-loader', 'css-loader']
     }
   ]
 },
 plugins: [new HtmlWebpackPlugin({ template: './src/index.html' })],
}
END

npm init -y

npm i -D \
    webpack webpack-cli webpack-dev-server html-webpack-plugin \
    babel-loader style-loader css-loader file-loader \
    @babel/core @babel/preset-env \
    @babel/plugin-transform-runtime \
    @babel/preset-react \
    jest babel-jest \
    @testing-library/react \
    @testing-library/jest-dom \
    @testing-library/user-event


npm i \
    react \
    react-dom \
    react-router-dom

npx npm-add-script \
  -k "dev" \
  -v "webpack serve --mode development" \
  --force

npx npm-add-script \
  -k "build" \
  -v "webpack --mode production" \
  --force

npx npm-add-script \
  -k "test" \
  -v "jest --watchAll --setupFilesAfterEnv ./src/test/setupTests.js" \
  --force

npx npm-add-script \
  -k "coverage" \
  -v "jest --setupFilesAfterEnv ./src/test/setupTests.js --coverage --watchAll=false" \
  --force

npx sb init --builder webpack5

git init