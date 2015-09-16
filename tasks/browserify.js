var gulp = require('gulp')
    gutil = require('gulp-util'),
    watchify = require('watchify'),
    browserify = require('browserify'),
    jadeify = require('jadeify'),
    coffeeify = require('coffeeify'),
    source = require('vinyl-source-stream'),
    buffer = require('vinyl-buffer'),
    assign = require('lodash.assign');

var b = browserify({
  entries: ['./src/app/index.coffee'],
  debug: true
});

b.transform(jadeify);
b.transform(coffeeify);
b.on('log', gutil.log);

function bundle(){
  return b.bundle()
    .on('error', gutil.log.bind(gutil, 'Browserify Error'))
    .pipe(source('script.js'))
    .pipe(buffer())
    .pipe(gulp.dest('./public/js'));
}

module.exports = bundle;
