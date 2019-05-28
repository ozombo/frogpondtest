<!DOCTYPE html>
<html lang="en">
    <head>
        {% block head %}
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="description" content="">
        <meta name="author" content="">

        <title>Frogpond - {% block title %}{% endblock %}</title>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link href="css/theme.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        {% endblock %}
    </head>
    <body role="document">
        <!-- Fixed navbar -->
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Bootstrap theme</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="#about">About</a></li>
                        <li><a href="#contact">Contact</a></li>
                        
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>

        <div class="container">
            {% block content %}{% endblock %}

            <div class="jumbotron">
                <h1>Welcome to FrogPond</h1>
                <p>Begin managing your frogs below.</p>
                <p><a class="btn btn-primary btn-lg" href="#" role="button">Manage creatures »</a></p>
            </div>

            <div class="row">

                <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3 mt">
                    <div class="frog-listing">
                        <img data-src="holder.js/200x200" class="img-thumbnail" alt="Frog avatar">
                    </div>
                </div>

                <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
                    <div class="frog-listing">
                        <img data-src="holder.js/200x200" class="img-thumbnail" alt="Frog avatar">
                    </div>
                </div>

                <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
                    <div class="frog-listing">
                        <img data-src="holder.js/200x200" class="img-thumbnail" alt="Frog avatar">
                    </div>
                </div>

                <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
                    <div class="frog-listing">
                        <img data-src="holder.js/200x200" class="img-thumbnail" alt="Frog avatar">
                    </div>
                </div>

                <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
                    <div class="frog-listing">
                        <img data-src="holder.js/200x200" class="img-thumbnail" alt="Frog avatar">
                    </div>
                </div>

                <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
                    <div class="frog-listing">
                        <img data-src="holder.js/200x200" class="img-thumbnail" alt="Frog avatar">
                    </div>
                </div>

                <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
                    <div class="frog-listing">
                        <img data-src="holder.js/200x200" class="img-thumbnail" alt="Frog avatar">
                    </div>
                </div>

                <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
                    <div class="frog-listing">
                        <img data-src="holder.js/200x200" class="img-thumbnail" alt="Frog avatar">
                    </div>
                </div>

            </div>
        </div>

        <footer class="footer">
            <div class="container">
                <p class="text-muted">&copy; FrogPond 2019 All right reserves.</p>
            </div>
        </footer>


        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/holder.min.js"></script>
    </body>
</html>
