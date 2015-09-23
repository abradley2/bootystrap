gulp = require 'gulp'
gutil = require 'gulp-util'
watchify = require 'watchify'
browserify = require 'browserify'
jadeify = require 'jadeify'
coffeeify = require 'coffeeify'
source = require 'vinyl-source-stream'
buffer = require 'vinyl-buffer'
assign = require 'lodash.assign'

bundler = browserify {
  entires: ['./src/app/index.coffee']
  debug: true
}

bundler.transform jadeify
bundler.transform coffeeify
bundler.on 'log', gutil.log

bundle = ->
  return bundler.bundle()
    .on('error', gutil.log.bind(gutil, 'Browserify Error'))
    .pipe(source 'script.js')
    .pipe(buffer())
    .pipe(gulp.dest('./public/js'))

module.exports = bundle
