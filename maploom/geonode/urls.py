from django.conf.urls import patterns, url

urlpatterns = patterns('',
                       url(r'^maploom/maps/new', 'geonode.maps.views.new_map', {'template': 'maps/maploom.html'},
                           name='maploom-map-new'),
                       url(r'^maploom/maps/(?P<mapid>\d+)/view', 'geonode.maps.views.map_view',
                           {'template': 'maps/maploom.html'}, name='maploom-map-view'),)
