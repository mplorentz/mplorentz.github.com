This is the source repo for http://mattlorentz.com. It is built with Jekyll and 
deployed using Github Pages.

# Setup

`gem install jekyll bundler`
`bundle install`

# Editing the site

Make your changes then run `bundle exec jekyll serve --incremental`

## Linking to assets

[link title]({{ "/assets/asset_filename" | absolute_url }})

# Publishing the site

`git push origin master`
