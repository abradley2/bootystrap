gulp = require 'gulp'

gulp.task 'browserify', require './browserify.coffee'

gulp.task 'watchify', require './watchify.coffee'

gulp.task 'libs', require './libs.coffee'

gulp.task 'styles', require './styles.coffee'

gulp.task 'watch-styles', ->
  gulp.watch ['./src/styles/**/*'], ['styles']

gulp.task 'build', ['browserify', 'libs', 'styles']

gulp.task 'watch', ['watchify', 'libs', 'styles', 'watch-styles']

gulp.task 'default', ['build']
