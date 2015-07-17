var gulp = require('gulp')
    gutil = require('gulp-util'),
    watchify = require('watchify'),
    browserify = require('browserify'),
    hamlify = require('hamlify'),
    coffeeify = require('coffeeify'),
    source = require('vinyl-source-stream'),
    buffer = require('vinyl-buffer'),
    sourcemaps = require('gulp-sourcemaps'),
    sass = require('gulp-sass'),
    coffee = require('gulp-coffee'),
    concat = require('gulp-concat'),
    assign = require('lodash.assign'),
    nodemon = require('gulp-nodemon');

var customOpts = {
  entries: ['./src/main.coffee'],
  debug: true
};

var opts = assign({}, watchify.args, customOpts);
var b = watchify(browserify(opts));
b.transform(hamlify);
b.transform(coffeeify);

gulp.task('app', bundle);
b.on('update', bundle);
b.on('log', gutil.log);

function bundle(){
  return b.bundle()
    .on('error', gutil.log.bind(gutil, 'Browserify Error'))
    .pipe(source('script.js'))
    .pipe(buffer())
    .pipe(sourcemaps.write('./'))
    .pipe(gulp.dest('./public'));
}

gulp.task('styles', function(){
  gulp.src('./src/styles/main.sass')
    .pipe(sass().on('error', sass.logError))
    .pipe(concat('styles.css'))
    .pipe(gulp.dest('./public'));
});

gulp.task('node', function(){
  nodemon({script: 'server.js'});
});

gulp.task('watch',function(){
  gulp.watch(
    [
      './src/styles/main.sass',
      './src/styles/base/*.sass',
      './src/styles/components/*.sass',
      './src/styles/layouts/*.sass'
    ],
    ['styles']
  );
});

gulp.task('default',['node','app','styles','watch']);
