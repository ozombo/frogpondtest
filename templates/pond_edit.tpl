{% extends "base.tpl" %}

{% block title %}Frogpond- {{ frog.pond|title }}{% endblock %}

{% block content %}
<div class="container">
    <form method="POST" action="{{ router.pathFor('pond-post') }}">
      <fieldset class="form-group">
        <label for="name">Name</label>
        <input type="text" class="form-control" id="name" name="name" placeholder="Enter name" value="{{ pond.getName }}">
        <small class="text-muted">The name of the pond.</small>
      </fieldset>
      <fieldset class="form-group">
        <label for="description">Description</label>
        <textarea class="form-control" id="description" rows="5" name="description">{{ pond.getDescription }}</textarea>
      </fieldset>
      <fieldset class="form-group">
        <label for="location">Location</label>
        <input type="text" class="form-control" id="location" name="location" placeholder="lat: 123.45, lng: 54,321" value="{{ pond.getLocation }}">
        <small class="text-muted">The locatoin detail</small>
      </fieldset>
      <fieldset class="form-group">
        <label for="status">Status</label>
        <select class="form-control" id="status" name="status">
          <option{% if pond.getStatus == 'open' %} selected="selected"{% endif %} value="open">Open</option>
          <option{% if pond.getStatus == 'closed' %} selected="selected"{% endif %} value="closed">Closed</option>
        </select>
      </fieldset>
      <input type="hidden" name="id" value="{{ pond.id }}">
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
{% endblock %}
