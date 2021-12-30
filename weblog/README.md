This is the source repo for http://mattlorentz.com/weblog. The other pages on mattlorentz.com are hosted in https://github.com/mplorentz/mplorentz.github.com.

# Setup

`gem install jekyll bundler`
`bundle install`

# Editing the site

Make your changes then run `bundle exec jekyll serve`

## Linking to assets

[link title]({{ "/assets/asset_filename" | absolute_url }})

# Publishing the site

`./scripts/publish_blog`
