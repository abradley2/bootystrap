var gulp = require('gulp')
    gutil = require('gulp-util'),
    mochify = require('mochify');

function test(){
  mochify('./test/*.test.coffee',{
    transform: 'coffeeify',
    reporter: 'nyan',
    require: './test/helpers.coffee'
  }).bundle()
}

module.exports = test;
