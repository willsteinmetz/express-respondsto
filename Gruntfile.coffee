###
# @author Will Steinmetz
# Express middleware to provide basic respond_to functionality similar to that
# of Ruby on Rails
# Copyright (c)2016, Will Steinmetz
# Licensed under the MIT license.
###

module.exports = (grunt) ->
  grunt.initConfig(
    pkg: require('./package.json')
    coffee:
      compile:
        options:
          sourceMap: true
          bare: true
        files:
          'index.js': 'src/index.coffee'
    watch:
      coffee:
        files: [
          'src/*.coffee'
        ]
        tasks: [ 'coffee', 'simplemocha' ]
        options:
          spawn: false
    simplemocha:
      all:
        src: [ 'test/**/*.coffee', 'text/**/*.js' ]
      options:
        compilers: 'coffee:coffee-script/register'
  )

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-simple-mocha'

  grunt.registerTask 'default', [
    'coffee'
    'simplemocha'
    'watch'
  ]
