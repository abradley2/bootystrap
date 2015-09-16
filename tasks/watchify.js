var gulp = require('gulp')
    gutil = require('gulp-util'),
    watchify = require('watchify'),
    browserify = require('browserify'),
    jadeify = require('jadeify'),
    coffeeify = require('coffeeify'),
    source = require('vinyl-source-stream'),
    buffer = require('vinyl-buffer'),
    sourcemaps = require('gulp-sourcemaps'),
    assign = require('lodash.assign');

var customOpts = {
  entries: ['./src/app/index.coffee'],
  debug: true
};

var opts = assign({}, watchify.args, customOpts);
var b = watchify(browserify(opts));
b.transform(jadeify);
b.transform(coffeeify);
b.on('update', bundle);
b.on('log', gutil.log);

function bundle(){
  return b.bundle()
    .on('error', gutil.log.bind(gutil, 'Browserify Error'))
    .pipe(source('script.js'))
    .pipe(buffer())
    .pipe(sourcemaps.write('./'))
    .pipe(gulp.dest('./public/js'));
}

module.exports = bundle;
