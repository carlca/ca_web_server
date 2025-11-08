from html import Html
from style import Style, FontUnit
from colors import Colors

struct Page():
   fn test_method(self) -> String:
      var page = Html()
      return String(page)

fn main() raises:
   var p = Page()
   var result = p.test_method()
   print("Test passed!")
