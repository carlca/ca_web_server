from html import Html

@fieldwise_init
struct Page(Copyable, Movable):
   fn test(self) -> String:
      var page = Html()
      return String(page)

fn main() raises:
   var p = Page()
   var result = p.test()
   print("Test passed!")
