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

gulp.task('bundle', bundle);
b.on('update', bundle);
b.on('log', gutil.log);

function bundle(){
  return b.bundle()
    .on('error', gutil.log.bind(gutil, 'Browserify Error'))
    .pipe(source('scripts.js'))
    .pipe(buffer())
    .pipe(sourcemaps.write('./'))
    .pipe(gulp.dest('./public/js'));
}

gulp.task('bootstrap', function(){
  gulp.src('./node_modules/bootstrap/dist/fonts/**')
    .pipe(gulp.dest('./public/css/fonts'));
  gulp.src('./node_modules/bootswatch/**')
    .pipe(gulp.dest('./public/css'));
});

gulp.task('styles', function(){
  gulp.src('./src/styles/main.sass')
    .pipe(sass().on('error', sass.logError))
    .pipe(concat('styles.css'))
    .pipe(gulp.dest('./public/css'));
});

gulp.task('vendor', function(){
  gulp.src([
    './node_modules/requirejs/require.js'
  ])
    .pipe(concat('require.js'))
    .pipe(gulp.dest('./public/js'));
  gulp.src('./node_modules/requirejs-text/text.js')
    .pipe(gulp.dest('./public'));
});

gulp.task('scripts', ['bundle']);

gulp.task('watch',function(){
  gulp.watch(
    ['./src/styles/**/*.sass'],
    ['styles']
  );
});

gulp.task('default',['vendor','scripts','bootstrap','styles','watch']);
