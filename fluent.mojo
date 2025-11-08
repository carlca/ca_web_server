# HTML and CSS Generator (Fluent API)
# Simple module for generating HTML and CSS without HTTP server dependencies

from html import Html
from style import Style, FontUnit
from colors import Colors
from googlefonts import GoogleFonts
from postresponse import PostResponse
from script import Script

# Data structures
@fieldwise_init
struct Class(Copyable, Movable):
   var round_image: String
   var fancy_input: String
   var red_text: String
   var big_button: String
   var small_text: String

@fieldwise_init
struct id(Copyable, Movable):
   var username: String
   var password: String
   var username_post: String
   var password_post: String
   var datetime: String
   var lorem: String
   var post_modern: String
   var update_dom: String

@fieldwise_init
struct PostData(Copyable, Movable):
   var username: String
   var password: String

# Page struct with fluent API
@fieldwise_init
struct Page(Copyable, Movable):

   # Helper function to read file contents
   fn get_file_contents(self, path: String) raises -> String:
      var file_name = path.split("/")[-1]
      with open("static/" + file_name, "r") as f:
         var result = String()
         for byte in f.read_bytes():
            result += String(byte)
         return result

   # Generate CSS for a given path
   fn get_css(self, path: String) raises -> String:
      return self.get_file_contents(path)

   # Generate image bytes for a given path
   fn get_image(self, path: String) raises -> String:
      return self.get_file_contents(path)

   # Generate complete HTML page
   fn get_page_html(self, use_static_css: Bool = False, use_static_html: Bool = False, username: String = "", password: String = "") raises -> String:
      var page = Html()
      var style = Style()
      var css_class = Class(
         round_image="round_image",
         fancy_input="fancy_input",
         red_text="red_text",
         big_button="big_button",
         small_text="small_text"
      )
      var element_id = id(
         username="username",
         password="password",
         username_post="username_post",
         password_post="password_post",
         datetime="datetime",
         lorem="lorem",
         post_modern="post_modern",
         update_dom="updateDom"
      )

      # Image styling
      _ = style.
         image_style(css_class.round_image).
         width(150).height(150).
         border(20, "solid", Colors.darkblue).border_radius(75)

      # Input styling
      _ = style.
         input_style(css_class.fancy_input).
         padding(10).margin(5).
         border(2, "dotted", Colors.blue).border_radius(5)

      # Paragraph styling
      _ = style.p().
         font_family("arial").color(Colors.blueviolet).background_color(Colors.yellow)

      _ = style.set_h_scale_factor(2)

      # Header styling
      _ = style.h1().
         font_family(GoogleFonts.Audiowide).color(Colors.red).background_color(Colors.lightblue)

      _ = style.h2().
         font_family(GoogleFonts.Sofia).color(Colors.goldenrod).background_color(Colors.lightgreen)

      _ = style.h3().
         font_family(GoogleFonts.Trirong).color(Colors.green).background_color(Colors.lightcoral)

      _ = style.h4().
         font_family(GoogleFonts.Aclonica).color(Colors.blueviolet).background_color(Colors.lightblue)

      _ = style.h5().
         font_family(GoogleFonts.Bilbo).color(Colors.crimson).background_color(Colors.lightgreen)

      _ = style.h6().
         font_family(GoogleFonts.Salsa).color(Colors.black).background_color(Colors.lightcoral)

      # Body styling
      _ = style.body().
         color(Colors.darkblue).background_color(Colors.azure).
         font_size(16, FontUnit.PX).font_family("Arial, sans-serif")

      # ID-specific styling
      _ = style.id(element_id.lorem).
         font_family("Times New Roman, serif").font_size(110, FontUnit.PERCENT).
         color(Colors.chartreuse).background_color(Colors.darkblue).
         margin_top(0).margin_bottom(0).padding_top(10).padding_bottom(2).padding_left(10).padding_right(10)

      _ = style.id(element_id.post_modern).
         font_family("Futura, sans-serif").
         color(Colors.gainsboro).background_color(Colors.darkblue).
         margin(0).padding_top(2).padding_bottom(10).padding_left(10).padding_right(10)

      _ = style.id(element_id.datetime).
         color(Colors.darkblue).background_color(Colors.lightblue).
         margin(0).padding(0).
         font_size(20, FontUnit.PX)

      # Generate HTML head
      if use_static_css:
         _ = style.save_to_file("static/style.css")
         _ = style.clear()
         _ = page.html_head("ca_web HTML/CSS generator", "style.css", style)
      else:
         _ = page.html_head("ca_web HTML/CSS generator", "", style)

      # Add content
      _ = page.para("", element_id.datetime)
      _ = page.script(Script(element_id.datetime).update_time())

      _ = page.
         h1(GoogleFonts.Audiowide).h2(GoogleFonts.Sofia).h3(GoogleFonts.Trirong).h4(GoogleFonts.Aclonica).h5(GoogleFonts.Bilbo).h6(GoogleFonts.Salsa)

      _ = page.image("/earlyspring.png", css_class.round_image)
      _ = page.para(page.lorem(), element_id.lorem)
      _ = page.para(page.post_modern(), element_id.post_modern)

      _ = page.form()
      _ = page.input_text(element_id.username, username, css_class.fancy_input, 23, 23, False)
      _ = page.input_text(element_id.password, password, css_class.fancy_input, 23, 23, True)
      _ = page.submit()
      _ = page.end_form()

      var post_data = PostData(username, password)
      _ = page.para("Username (POST): " + post_data.username, element_id.username_post)
      _ = page.para("Password (POST): " + post_data.password, element_id.password_post)

      _ = page.para("Username (DOM): ", element_id.username)
      _ = page.para("Password (DOM): ", element_id.password)

      _ = page.button("Update Outputs", element_id.update_dom)
      _ = page.script(Script(element_id.update_dom).update_dom(
         (element_id.username, post_data.username, True),
         (element_id.password, post_data.password, True)))

      _ = page.end_html()
      page.prettify()

      if use_static_html:
         page.save_to_file("static/index.html")

      return String(page)

# Simple main function for testing
fn main() raises:
   print("Creating Page instance...")
   var page = Page()
   print("Calling get_page_html...")
   var html = page.get_page_html(True, True)
   print("Done!")
   print("Generated HTML with static CSS and HTML files.")
   print("Check the 'static' directory for output files.")
