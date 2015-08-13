var gulp = require('gulp')
    gutil = require('gulp-util'),
    watchify = require('watchify'),
    browserify = require('browserify'),
    jadeify = require('jadeify'),
    coffeeify = require('coffeeify'),
    source = require('vinyl-source-stream'),
    buffer = require('vinyl-buffer'),
    sourcemaps = require('gulp-sourcemaps'),
    sass = require('gulp-sass'),
    coffee = require('gulp-coffee'),
    concat = require('gulp-concat'),
    wrap = require('gulp-wrap'),
    assign = require('lodash.assign');

var customOpts = {
  entries: ['./src/main.coffee'],
  debug: true
};

var opts = assign({}, watchify.args, customOpts);
var b = watchify(browserify(opts));
b.transform(jadeify);
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
  gulp.src('./src/styles/styles.sass')
    .pipe(sass().on('error', sass.logError))
    .pipe(concat('styles.css'))
    .pipe(gulp.dest('./public/stylesheets'));
  gulp.src(['./src/styles/script/*.coffee'])
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(concat('styles.js'))
    .pipe(wrap({src: './src/styles/styles.js'}))
    .pipe(gulp.dest('./public/stylesheets'));
});

gulp.task('watch',function(){
  gulp.watch(
    [
      './src/styles/main.sass',
      './src/styles/base/*.sass',
      './src/styles/components/*.sass',
      './src/styles/pages/*.sass',
      './src/styles/script/*.coffee'
    ],
    ['styles']
  );
});

gulp.task('default',['app','styles','watch']);
