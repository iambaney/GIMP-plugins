;Plugin for GIMP
;Divides the image into 256x256 guidelines.
;Used for Okaymon contact sheet exports

(define (script-fu-Guides-At-256 image drawable)
  (let* ((width (car(gimp-image-width image))) (height (car(gimp-image-height image))) (xoffset 256) (yoffset 256))
    ;Prep
    (gimp-context-push)

;Assemble Vertical Guides
	(let loop ((yoffset 256))
	(if(< yoffset height)
	(begin
	(gimp-image-add-hguide image yoffset)
	(loop (+ yoffset 256) ))))	

;Assemble Horizontal Guides
	(let loop ((xoffset 256))
	(if(< xoffset width)
	(begin
	(gimp-image-add-vguide image xoffset)
	(loop (+ xoffset 256) ))))
	
;Slice
   )
)

(script-fu-register "script-fu-Guides-At-256"
                    _"_Guides at 256px"
                    _"Guides at 256px"
                    "Anthony Baney"
                    "iambaney"
                    "12/13/2021"
                    "RGB* GRAY*"
                    SF-IMAGE       "Image"           0
                    SF-DRAWABLE    "Drawable"        0)

(script-fu-menu-register "script-fu-Guides-At-256"
			 "<Image>/Edit")