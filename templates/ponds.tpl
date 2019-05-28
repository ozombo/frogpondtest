{% extends "base.tpl" %}

{% block title %}Frogpond - All Ponds{% endblock %}

{% block content %}
<div class="container">
<h1 class="pull-left">All Ponds</h1>
<div class="pull-right">
    <a href="{{ router.pathFor('pond-create-view') }}" class="btn btn-sm btn-primary"><i class="fa fa-plus"></i> Add new pond</a>
</div>
</div>

<div class="table-responsive">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Description</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        {% for item in ponds %}
        <tr>
            <td>{{ item.getId }}</td>
            <td>{{ item.getName }}</td>
            <td>{{ item.getShortDescription }}...</td>
            <td><span class="label label-{% if item.getStatus == 'open' %}success{% else %}danger{% endif %}">{{ item.getStatus|capitalize }}</span></td>
            <td>
                <a class="btn btn-primary btn-sm" href="{{ router.pathFor('pond-view', {"id": item.getId}) }}">
                    <i class="fa fa-eye"></i> View
                </a>
                <a class="btn btn-warning btn-sm" href="{{ router.pathFor('pond-edit-view', {"id": item.getId}) }}">
                    <i class="fa fa-pencil"></i> Edit
                </a>
                <form method="POST" action="{{ router.pathFor('pond-delete', {"id": item.getId}) }}" style="display: inline;">
                    <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i> Delete</button>
                </form>
            </td>
        </tr>
        {% endfor %}
        </tbody>
    </table>
</div>
{% endblock %}
