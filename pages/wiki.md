---
layout: page
title: mothur's wiki
permalink: /wiki/
---

<h1 style="margin-bottom:10px">{{ page.title }}</h1>

Welcome to the {{ site.title }} Documentation pages! Here you can quickly jump to a
particular page.

<div class="section-index">
    <hr class="panel-line">
    {% for post in site.wiki  %}        
    <div class="entry">
    <h5><a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a></h5>
    <p>{{ post.description }}</p>
    </div>{% endfor %}
</div>
