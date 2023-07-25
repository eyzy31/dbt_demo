{% macro limit_data_in_dev() %}
    {% if target.name == 'bqusr'%}
    Limit 10
    {% endif %}
{% endmacro %}