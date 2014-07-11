django-maploom
==============

A Django wrapper for [MapLoom](https://github.com/ROGUE-JCTD/MapLoom).

Installation
------------

Download django-maploom and install it directly from source:

```python setup.py install```

Project Configuration
---------------------

Once installed you can configure your project to use 
django-maploom with the following steps.

Add ``maploom`` to ``INSTALLED_APPS`` in your project's
``settings`` module:

    INSTALLED_APPS = (
        # other apps
        'maploom',
    )

Usage
-----

Once installed, you can easily add maploom to any template on your site.

First load the template tags in your template:

	{% load maploom_tags %}

In the ```<head>``` section of your html section add the MapLoom js files:

    {% maploom_js %}

Then add a map loom map to your page by placing the following tag anywhere in the ```<body>``` tags:

	{% maploom_html %}


Adding in GeoNode
-----------------
To use MapLoom as your GeoNode map client, follow the Project Configuration steps above.  Next, add the MapLoom urls
to the bottom of the `urls.py` file in GeoNode and append them to the GeoNode url patterns.

```
from maploom.geonode.urls import urlpatterns as maploom_urls

urlpatterns += maploom_urls
```
