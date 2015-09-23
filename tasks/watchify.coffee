gulp = require 'gulp'
gutil = require 'gulp-util'
watchify = require 'watchify'
browserify = require 'browserify'
jadeify = require 'jadeify'
coffeeify = require 'coffeeify'
source = require 'vinyl-source-stream'
buffer = require 'vinyl-buffer'
sourcemaps = require 'gulp-sourcemaps'
assign = require 'lodash.assign'

customOpts = {
  entries: ['./src/app/index.coffee'],
  debug: true
}

opts = assign {}, watchify.args, customOpts
bundler = watchify browserify(opts)

bundle = ->
  return bundler.bundle()
    .on('error', gutil.log.bind(gutil, 'Browserify Error'))
    .pipe(source 'script.js')
    .pipe(buffer())
    .pipe(sourcemaps.write('./'))
    .pipe(gulp.dest('./public/js'))

bundler.transform jadeify
bundler.transform coffeeify
bundler.on 'update', bundle
bundler.on 'log', gutil.log

module.exports = bundle
