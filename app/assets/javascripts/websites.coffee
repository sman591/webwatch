# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require unveil
#= require jquery-timeago
#= require simple-lightbox

ready = ->
  $("img").unveil()
  $("time.timeago").timeago()
  $("[data-toggle=tooltip]").tooltip
    delay: 400
  setupLightbox()

setupLightbox = ->
  lightboxes = []
  $("[data-lightbox]").each ->
    lightbox = $(this).data("lightbox")
    lightboxes.push(lightbox) if lightboxes.indexOf(lightbox) < 0

  lightboxes.forEach (lightbox) ->
    $("[data-lightbox=\"#{lightbox}\"]").simpleLightbox()

$(document).on('turbolinks:load', ready)
