+++
# A Projects section created with the Portfolio widget.
widget = "portfolio"  # See https://sourcethemes.com/academic/docs/page-builder/
headless = true  # This file represents a page section.
active = true  # Activate this widget? true/false
weight = 65  # Order that this section will appear.

title = "Projects"
subtitle = ""

[content]
  # Page type to display. E.g. project.
  page_type = "project"

  # Filter toolbar (optional).
  # Add or remove as many filters (`[[content.filter_button]]` instances) as you like.
  # To show all items, set `tag` to "*".
  # To filter by a specific tag, set `tag` to an existing tag name.
  # To remove toolbar, delete/comment all instances of `[[content.filter_button]]` below.

  # Default filter index (e.g. 0 corresponds to the first `[[filter_button]]` instance below).
  filter_default = 0

  [[content.filter_button]]
     name = "All"
     tag = "*"

 [[content.filter_button]]
   name = "Attention Network"
   tag = "attention-networks"

 [[content.filter_button]]
   name = "Computational Communication"
   tag = "computational-communication"

[design]
  # Choose how many columns the section has. Valid values: 1 or 2.
  columns = "2"

  # Toggle between the various page layout types.
  #   1 = List
  #   2 = Compact
  #   3 = Card
  #   5 = Showcase
  view = 5

  # For Showcase view, flip alternate rows?
  flip_alt_rows = false

[design.background]
  # Apply a background color, gradient, or image.
  #   Uncomment (by removing `#`) an option to apply it.
  #   Choose a light or dark text color by setting `text_color_light`.
  #   Any HTML color name or Hex value is valid.

  # Background color.
  # color = "navy"

  # Background gradient.
  # gradient_start = "DeepSkyBlue"
  # gradient_end = "SkyBlue"

  # Background image.
  # image = "background.jpg"  # Name of image in `static/img/`.
  # image_darken = 0.6  # Darken the image? Range 0-1 where 0 is transparent and 1 is opaque.

  # Text color (true=light or false=dark).
  # text_color_light = true  

[advanced]
 # Custom CSS.
 css_style = ""

 # CSS class.
 css_class = ""
+++

- Bringing Back the Reference Group: Agent-based Modeling of Spiral of Silence. National postdoc grant 2015M571722
- The Network Threshold of the Formation and Diffusion of Public Opinion. National Social Science Fundation for Young Scholars 15CXW017

<!-- +++
# Projects widget.
# Note: this widget will only display if `content/project/` contains projects.

date = "2016-04-20T00:00:00"
draft = false

title = "Projects"
subtitle = ""
widget = "portfolio"

# Order that this section will appear in.
weight = 40

# View.
# Customize how projects are displayed.
# Legend: 0 = list, 1 = cards.

view = 1

# Filter toolbar.
# Add or remove as many filters (`[[filter]]` instances) as you like.
## Use * tag to show all projects or an existing tag prefixed with "." to
# filter by specific tag.
# To remove toolbar, delete/comment all instances of [[filter]] below.


[[filter]]
  name = "All"
  tag = "*"

[[filter]]
  name = "Attention Networks"
  tag = ".attention-networks"

[[filter]]
  name = "Computational Communication"
  tag = ".computational-communication"

+++

- Bringing Back the Reference Group: Agent-based Modeling of Spiral of Silence. National postdoc grant (￥50000, 2015M571722)
- The Network Threshold of the Formation and Diffusion of Public Opinion. National Social Science Fundation for Young Scholars(￥200'000, 15CXW017) -->
