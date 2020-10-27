---
layout: page
title: Gallery
fulltitle: Images from the blog
permalink: /gallery/
gallery_path: "assets/img/"
tags: [Gallery, Photo]
---

Here's a collection of all the images I've used in my blog posts - enjoy! 😊

<div id='masonry' class="grid">
<div class="grid-sizer"></div>
<div class="gutter-sizer"></div>
{% for image in site.static_files %}
  {% if image.path contains page.gallery_path %}
    {% unless image.path contains '.md' %}
        <img src="{{ image.path | relative_url }}" alt="" class="grid-item" style="padding: 0;">
    {% endunless %}  
  {% endif %}
{% endfor %}
</div> 

<script src="{{ "/assets/js/vendor/imagesloaded.min.js" | relative_url }}" type="text/javascript"></script>
<script src="{{ "/assets/js/vendor/masonry.pkgd.min.js" | relative_url }}" type="text/javascript"></script>
