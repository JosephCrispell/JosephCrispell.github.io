# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "joseph-crispell"
  spec.version       = "1.0.1"
  spec.authors       = ["Joseph Crispell"]
  spec.email         = ["crispelljoseph@gmail.com"]

  spec.summary       =  "A jekyll theme based upon the type-on-strap and particle themes"
  spec.description   = %q{A jekyll theme based upon the type-on-strap and particle themes. A personal website to suit my blogging needs.}
  spec.homepage      = "https://github.com/JosephCrispell/JosephCrispell.github.io"
  spec.license       = "MIT"

  spec.rdoc_options            = ["--charset=UTF-8"]
  spec.extra_rdoc_files        = %w(README.md LICENSE)
  spec.metadata["plugin_type"] = "theme"

  spec.files                   = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r!^(assets/(js|css|fonts|data)/|_(includes|layouts|sass)/|_data/language.yml|(LICENSE|README.md))!i)
  end

  spec.post_install_message =  <<~MSG
                                -------------------------------------------------------------------------------------
                                My blog (Joseph Crispell) is using Jekyll 4.0:

                                  * Please make sure you have updated your _config.yml.

                                  * Use _data/ for social and language customization

                                  * Vist https://github.com/JosephCrispell/JosephCrispell.github.io for more info.

                                -------------------------------------------------------------------------------------
                               MSG

  spec.required_ruby_version   = '>= 2.4.0'
    
  spec.add_runtime_dependency "jekyll", ">= 3.5", "< 5.0"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.9"
  spec.add_runtime_dependency "jekyll-paginate", "~> 1.1"
  spec.add_runtime_dependency "jekyll-seo-tag", "~>2.6"
end
