{% extends "base.tpl" %}

{% block title %}Frogpond - {{ frog.getName|title }}{% endblock %}

{% block content %}
<div class="container">

    <form>
      <fieldset class="form-group">
        <label for="name">Name</label>
        <input type="text" class="form-control" id="name" placeholder="Enter name" value="{{ frog.getName }}">
        <small class="text-muted">The name of the frog.</small>
      </fieldset>
      <fieldset class="form-group">
        <label for="gender">Gender</label>
        <select class="form-control" id="gender">
          <option{% if frog.getGender == 'male' %} selected="selected"{% endif %} value="male">Male</option>
          <option{% if frog.getGender == 'female' %} selected="selected"{% endif %} value="female">Female</option>
        </select>
        <small class="text-muted">Male or female.</small>
      </fieldset>
      <fieldset class="form-group">
        <label for="dob">D.O.B</label>
        <input type="text" class="form-control" id="dob" placeholder="YYYY-MM-DD" value="{{ frog.getDob }}">
        <small class="text-muted">Date of birth.</small>
      </fieldset>
      <fieldset class="form-group">
        <label for="pond">Pond</label>
        <select single class="form-control" id="pond">
            {% for pond in ponds %}
                <option{% if frog.getPondId == pond.getId %} selected="selected"{% endif %} value="{{ pond.getId }}">{{ pond.getName }}</option>
            {% endfor %}
        </select>
        <small class="text-muted">Where the frog lives.</small>
      </fieldset>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
{% endblock %}
