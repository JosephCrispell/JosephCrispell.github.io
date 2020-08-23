# Code for: [JosephCrispell.github.io](https://josephcrispell.github.io/)

## Author: Joseph Crispell

## Description

The website is built using [Jekyll](https://jekyllrb.com) combining code from the <a href='https://github.com/sylhare/Type-on-Strap'>Type on Strap</a> and <a href='https://github.com/nrandecker/particle'>particle</a> themes.

![The landing page (particle)](assets/img/README/LandingPage.PNG)
![The blog (Type On Strap)](assets/img/README/Blog.PNG)

## Structure

Here are the main files of this site

```bash
jekyll-theme-basically-basic
├── _includes                   # Template htmls to be included in pages of site
├── _layouts                    # Layout for different pages in site defined as html
├── _posts                      # Blog posts
├── _sass                       # Style elements of website encoded as SASS (an extension to css)
├── assets                      # Files to be called when building site
|  ├── js                           # Javascript code for different site elements: particle, Katex, jquery, bootstrap, jekyll search,
|  ├── css                          # css code for different site elements: Bootstrap, font-awesome, katex and main css
|  ├── fonts		                    # Fonts to be used in site
|  └── img		                      # Images used in site
├── pages                       # Pages of site
|   ├── 404.md                      # To be displayed when url is wrong
|   ├── about.md                    # About me page
|   ├── projects.md                 # Portfolio page for your projects
|   ├── search.html                 # Search my site page
|   └── tags.md                     # Explore the project and blog tags here
├── _config.yml                 # Site configuration file 
├── index.html                  # Particle landing page
└── blog                        # Needed separate index.html for blog pagination (next/previous) to work
    └── index.html              # Type on strap landing page
```

## License

There are some fonts and component on this theme going under the MIT licence as well in this theme.
[The MIT License (MIT)](https://raw.githubusercontent.com/Sylhare/Type-on-Strap/master/LICENSE)
