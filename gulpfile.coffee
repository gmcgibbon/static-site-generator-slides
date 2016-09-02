app     = require './app'
gulp    = require 'gulp'
plumber = require 'gulp-plumber'
coffee  = require 'gulp-coffee'
sass    = require 'gulp-sass'
pug     = require 'gulp-pug'
uglify  = require 'gulp-uglify'
bs      = require 'browser-sync'
  .create()

gulp.task 'serve', ['pug', 'coffee', 'sass', 'markdown'], ->
  bs.init server: 'dist'
  gulp.watch 'src/**/*.*',      ['pug']
  gulp.watch 'src/**/*.coffee', ['coffee']
  gulp.watch 'src/**/*.scss',   ['sass']
  gulp.watch 'src/**/*.md',     ['markdown']
  gulp.watch 'dist/**/*'
    .on 'change', bs.reload

gulp.task 'coffee', ->
  gulp.src('./src/**/*.coffee')
    .pipe plumber()
    .pipe coffee()
    .pipe uglify()
    .pipe gulp.dest('./dist')

gulp.task 'sass', ->
  gulp.src './src/**/*.scss'
    .pipe plumber()
    .pipe sass(outputStyle: 'compressed')
    .pipe gulp.dest('./dist')

gulp.task 'pug', ->
  gulp.src './src/**/*.pug'
    .pipe plumber()
    .pipe pug(locals: app.view())
    .pipe gulp.dest('./dist')

gulp.task 'markdown', ->
  gulp.src './src/**/*.md'
    .pipe plumber()
    .pipe gulp.dest('./dist')

gulp.task 'default', ['serve']
