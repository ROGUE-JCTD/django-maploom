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

Add ``maploom` to ``INSTALLED_APPS`` in your project's
``settings`` module::

    INSTALLED_APPS = (
        # other apps
        'maploom',
    )

Usage
-----

Once installed, you can easily add a classification banner to any template on your site.

First load the template tags in your template:

	{% load maploom_tags %}
	
Then add a map loom map to your page:

	{% maploom_html %}

* Note: ```maploom_html``` currently reutrns a full HTML site that can be loaded via an iframe.
This will be improved as MapLoom development continues.

