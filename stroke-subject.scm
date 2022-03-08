;Plugin for GIMP
;Selects contiguous background then emboldens the outline of the subject.
;Used for Okaymon border enhancement

(define (script-fu-stroke-subject image drawable)
  (let* ((width (car(gimp-image-width image))) (brushfactor 100) (brushsize))
    ;Prep
    (gimp-context-push)
    ;(gimp-image-undo-group-start image)
    (set! brushsize (+ (/ width brushfactor) 1))

    ;Set Contexts Params
    (gimp-context-set-antialias TRUE)
    (gimp-context-set-feather FALSE)
    (gimp-context-set-feather-radius 0 0)
    (gimp-context-set-sample-merged TRUE)
    (gimp-context-set-sample-criterion 8)
    (gimp-context-set-sample-threshold-int 1)
    (gimp-context-set-sample-transparent TRUE)
    (gimp-context-set-diagonal-neighbors FALSE)  
    (gimp-context-set-opacity 98)
    ;Set Selection of Subject
    (gimp-image-select-contiguous-color image CHANNEL-OP-ADD drawable 0 0)
    ;(gimp-selection-shrink image 1)
    (gimp-selection-invert image)
    (gimp-selection-shrink image 1)
    ;(gimp-selection-sharpen image)

    ;Stroke Selection
    ;(gimp-context-set-paint-mode 0)	;27 might also work
    (gimp-context-set-brush-size brushsize)	;5 is a good base.
    (gimp-context-set-stroke-method 1)	;line=0 paintbrush=1
    (gimp-context-set-brush-hardness .15)
    ;(gimp-context-set-line-width 1)
    (gimp-drawable-edit-stroke-selection drawable)

    ;Deselect
    (gimp-selection-none image)

  )
)

(script-fu-register "script-fu-stroke-subject"
                    _"_Stroke Subject..."
                    _"Find the subject and outline it"
                    "Anthony Baney"
                    "iambaney"
                    "11/22/2021"
                    "RGB* GRAY*"
                    SF-IMAGE       "Image"           0
                    SF-DRAWABLE    "Drawable"        0)

(script-fu-menu-register "script-fu-stroke-subject"
			 "<Image>/Edit")