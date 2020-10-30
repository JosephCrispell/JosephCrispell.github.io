---
layout: page
title: Gallery
fulltitle: Images from the website
permalink: /gallery/
tags: [Gallery, Photo]
---

Here's a collection of the images I've used across my website. Click an image to go to where it is used. 📷

<div id='masonry' class="grid">
    <div class="grid-sizer"></div>
    <div class="gutter-sizer"></div>
    {% for post in site.posts %}
        <a href="{{ post.url | relative_url }}">
            <img src="{{ post.thumbnail | relative_url }}" alt="" class="grid-item" style="padding: 0;">
        </a>
    {% endfor %}
</div> 

<script src="{{ "/assets/js/vendor/imagesloaded.min.js" | relative_url }}" type="text/javascript"></script>
<script src="{{ "/assets/js/vendor/masonry.pkgd.min.js" | relative_url }}" type="text/javascript"></script>
