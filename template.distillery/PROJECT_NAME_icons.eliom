(* This file was generated by Ocsigen Start.
   Feel free to use it, modify it, and redistribute it as you wish. *)

[%%shared.start]

(** This module defines an interface to create icons HTML element with
    predefined style/value. We assume "Font Awesome" icons are used by
    default (fa CSS class is added when using [icon classes]).  See
    http://fontawesome.io/ for more information and for the complete
    list of CSS classes values. *)

module Make(A : module type of Eliom_content.Html.F) = struct

  (** [icon classes ~a:other_css_classes ()] create an icon HTML
      attribute with "fa" and [classes] as CSS classes. The HTML tag
      "i" is used because it is the de facto standard for icons. The
      optional parameter ~a is at the end to be able to add other CSS
      classes with predefined icons. *)
  let icon classes
      ?(a = ([] : Html_types.i_attrib Eliom_content.Html.attrib list)) () =
    A.i ~a:(A.a_class ("fa" :: classes) :: a) []

  (** Icons used by Ocsigen Start's library *)

  let user = icon ["fa-user"; "fa-fw"]
  let signout = icon ["fa-sign-out"; "fa-fw"]
  let close = icon ["fa-close"; "fa-fw"]
  let trash = icon ["fa-trash-o"; "fa-fw"]

  (* Add your own icons here. See http://fontawesome.io/icons/ for the
     complete list of CSS classes available by default. *)

end

module F = Make(Eliom_content.Html.F)

module D = Make(Eliom_content.Html.D)

(* Register this module for use by Os_icon. *)
module Empty = Os_icons.Register(F)(D)
