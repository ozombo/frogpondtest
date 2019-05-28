{% extends "base.tpl" %}

{% block title %}Frogpond - {{ frog.getName|title }}{% endblock %}

{% block content %}
<div class="container">
    <ol class="breadcrumb">
      <li><a href="/">Home</a></li>
      <li><a href="/frogs">Frogs</a></li>
      <li class="active">{{ frog.getName|title }}</li>
    </ol>
</div>

<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-12">
            <h1>{{ frog.getName|title }}</h1>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col-xs-12 col-md-8">
            <p>{{ frog.getDescription|nl2br }}</p>
            <p><strong>Gender: </strong>{{ frog.getGender|capitalize }}</p>
            <p><strong>D.O.B.: </strong>{{ frog.getDob|capitalize }}</p>
            <p>
                <strong>Resident: </strong>
                <a href="{{ router.pathFor('pond-view', {"id": frog.getPondId}) }}">
                    {{ frog.getPondName|capitalize }}
                </a>
            </p>
        </div>
        <div class="col-xs-12 col-md-4">
            <p><img data-src="holder.js/200x200" class="img-thumbnail" alt="Pond avatar"></p>
        </div>
    </div>
    <hr />
</div>

{% endblock %}
