// karma.conf.js
module.exports = function(config) {
  config.set({
    frameworks: ['browserify', 'mocha'],
    files: ['./test/test.test.coffee'],
    browsers: ['PhantomJS'],

    browserify: {
      debug: true,
      transform: ['coffeeify']
    }



  });
};
