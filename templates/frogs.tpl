{% extends "base.tpl" %}

{% block title %}Frogpond - All Frogs{% endblock %}

{% block content %}
<div class="container">
    <h1 class="pull-left">All Frogs</h1>
    <div class="pull-right">
        <a href="{{ router.pathFor('frog-create-view') }}" class="btn btn-sm btn-primary"><i class="fa fa-plus"></i> Add new frog</a>
    </div>
</div>

<div class="container">
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>D.O.B.</th>
                    <th>Resident</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            {% for item in frogs %}
            <tr>
                <td>{{ item.getId }}</td>
                <td>{{ item.getName }}</td>
                <td>{{ item.getGender }}</td>
                <td>{{ item.getDob }}</td>
                <td>{{ item.getPondName }}</td>
                <td>
                    <a class="btn btn-primary btn-sm" href="{{ router.pathFor('frog-view', {"id": item.getId}) }}">
                        <i class="fa fa-eye"></i> View
                    </a>
                    <a class="btn btn-warning btn-sm" href="{{ router.pathFor('frog-edit-view', {"id": item.getId}) }}">
                        <i class="fa fa-pencil"></i> Edit
                    </a>
                    <form method="POST" action="{{ router.pathFor('frog-delete', {"id": item.getId}) }}" style="display: inline;">
                    <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i> Delete</button>
                </form>
                </td>
            </tr>
            {% endfor %}
            </tbody>
        </table>
    </div>
</div>
{% endblock %}
