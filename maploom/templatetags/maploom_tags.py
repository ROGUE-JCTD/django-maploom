from django import template
from django.conf import settings

register = template.Library()

@register.inclusion_tag('maploom/_maploom_map.html')
def maploom_html(options=None):
    """
    Maploom html template tag.
    """
    return dict()


