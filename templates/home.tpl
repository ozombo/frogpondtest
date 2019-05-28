{% extends "base.tpl" %}

{% block title %}Frognation Home{% endblock %}

{% block content %}
<div class="jumbotron">
    <h1>Welcome to Frogpond</h1>
    <p>Manage your frogs.</p>
    <p><a class="btn btn-primary btn-lg" href="/frogs" role="button">Manage creatures »</a></p>
</div>

<div class="row">
    {% for frog in frogs %}
        <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
        <div class="panel panel-default">
            <div class="panel-heading">
                <a href="{{ router.pathFor('frog-view', {"id": frog.getId}) }}">{{ frog.getName }}</a>
            </div>
            <div class="panel-body">
                <img data-src="holder.js/230x200" alt="{{ frog.getName }}">
            </div>
        </div>
    </div>
    {% endfor %}
</div>
{% endblock %}
