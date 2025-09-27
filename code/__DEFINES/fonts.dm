//FONTS: Used by Paper, PhotoCopier, PDA's Notekeeper, NewsCaster, NewsPaper, ModularComputers (and PaperBin once a year).
/// Font used by regular pens
#define PEN_FONT "Verdana"
/// Font used by fancy pens
#define FOUNTAIN_PEN_FONT "Segoe Script"
/// Font used by crayons
#define CRAYON_FONT "Comic Sans MS"
/// Font used by printers
#define PRINTER_FONT "Times New Roman"
/// Font used by charcoal pens
#define CHARCOAL_FONT "Candara"
/// Font used when signing on paper.
#define SIGNATURE_FONT "Segoe Script"

/// Emoji icon set
<<<<<<< HEAD
#define EMOJI_SET 'icons/ui_icons/emoji/emoji.dmi'
=======
#define EMOJI_SET 'icons/ui/chat/emoji.dmi'
>>>>>>> tg-pr-88929

// Font metrics bitfield
/// Include leading A width and trailing C width in GetWidth() or in DrawText()
#define INCLUDE_AC (1<<0)
<<<<<<< HEAD

DEFINE_BITFIELD(font_flags, list(
	"INCLUDE_AC" = INCLUDE_AC,
))
=======
>>>>>>> tg-pr-88929
