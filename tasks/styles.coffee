gulp = require 'gulp'
gutil = require 'gulp-util'
concat = require 'gulp-concat'
sass = require 'gulp-sass'

styles = ->
  gulp.src(['./src/styles/index.scss'])
    .pipe(sass().on('error', sass.logError))
    .pipe(concat('styles.css'))
    .pipe(gulp.dest('./public/css'))

module.exports = styles
