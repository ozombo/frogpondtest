{% extends "base.tpl" %}

{% block title %}Frogpond - {{ pond.getName|title }}{% endblock %}

{% block content %}
<div class="container">
    <ol class="breadcrumb">
      <li><a href="/">Home</a></li>
      <li><a href="/ponds">Ponds</a></li>
      <li class="active">{{ pond.getName|title }}</li>
    </ol>
</div>

<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-12">
            <h1>{{ pond.getName|title }}</h1>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col-xs-12 col-md-8">
            <p>{{ pond.getDescription|nl2br }}</p>
            <p><strong>Status: </strong><span class="label label-success">{{ pond.getStatus|capitalize }}</span></p>
            <p>
              <strong>Frogs: </strong>
              {% for frog in frogs %}
                <a href="{{ router.pathFor('frog-view', {"id": frog.getId}) }}">
                {{ frog.getName }}</a>,
              {% endfor %}
            </p>
        </div>
        <div class="col-xs-12 col-md-4">
            <p><img data-src="holder.js/200x200" class="img-thumbnail" alt="Pond avatar"></p>
        </div>
    </div>
    <hr />
    <div id="map"></div>
</div>

<script>
function initMap() {
  var myLatLng = { {{ pond.getLocation }} };

  // Create a map object and specify the DOM element for display.
  var map = new google.maps.Map(document.getElementById('map'), {
    center: myLatLng,
    scrollwheel: false,
    zoom: 9
  });

  // Create a marker and set its position.
  var marker = new google.maps.Marker({
    map: map,
    position: myLatLng,
    title: '{{ pond.getName|title }}'
  });
}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDQ4r_ptJTme4puWzKeCoHV4OWfoNaCkGE&callback=initMap"
    async defer></script>

{% endblock %}
