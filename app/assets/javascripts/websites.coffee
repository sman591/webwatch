# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require unveil
#= require jquery-timeago

ready = ->
  $("img").unveil()
  $("time.timeago").timeago()
  $("[data-toggle=tooltip]").tooltip
    delay: 400

$(document).on('turbolinks:load', ready)
