---
layout: page
title: Gallery
fulltitle: Images from the website
permalink: /gallery/
tags: [Gallery, Photo]
---

<style>
.grid-item:hover {
  opacity: 0.3;
}
</style>


Here's the thumbnails for each of my blog posts. Click an image to go to it's blog post. 📷

<div id='masonry' class="grid">
    <div class="grid-sizer"></div>
    <div class="gutter-sizer"></div>
    {% for post in site.posts %}
        <a href="{{ post.url | relative_url }}">
            <img src="{{ post.thumbnail | relative_url }}" alt="" class="grid-item" style="padding: 0;" title="{{ post.title }}">
        </a>
    {% endfor %}
</div> 

<script src="{{ "/assets/js/vendor/imagesloaded.min.js" | relative_url }}" type="text/javascript"></script>
<script src="{{ "/assets/js/vendor/masonry.pkgd.min.js" | relative_url }}" type="text/javascript"></script>
