//require('coffee-script/register');
var gulp = require('gulp');


gulp.task('browserify', require('./tasks/browserify.js'));

gulp.task('watchify', require('./tasks/watchify.js'));

gulp.task('libs', require('./tasks/libs.js'));

gulp.task('styles', require('./tasks/styles.js'));

gulp.task('test', require('./tasks/test.js'));

gulp.task('watch', function(){
  gulp.watch(['./src/styles/**/*'],['styles']);
});

gulp.task('build',['browserify','libs','styles']);

gulp.task('develop',['watchify','libs','styles','watch']);

gulp.task('default',['build']);
