module HomePage exposing (..)

import DataModel exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)


ultrasound_pics : List (Picture a)
ultrasound_pics =
    [ { bigUrl = "images/ultrasound/2176105_0036.jpg"
      , smallUrl = "images/ultrasound/2176105_0036_small.jpg"
      , shortDesc = text "My Pretty Face!"
      , longDesc = text "Just look at the cuteness!"
      }
    , { bigUrl = "images/ultrasound/2176105_0018.jpg"
      , smallUrl = "images/ultrasound/2176105_0018_small.jpg"
      , shortDesc = text "And my hoof!"
      , longDesc = text "Little Miss Twinkletoes!"
      }
    , { bigUrl = "images/ultrasound/2176105_0009.jpg"
      , smallUrl = "images/ultrasound/2176105_0009_small.jpg"
      , shortDesc = text "And.. er, well, I'm a girl!"
      , longDesc = text "(Gah, you guys! Did you really...?! *sigh*)"
      }
    ]


ultrasound : Section a
ultrasound =
    PictureGroup
        { meta =
            { id = "ultrasound"
            , name = text "Ultrasound"
            , title = text "My first pics!"
            }
        , pics = ultrasound_pics
        }


mom_pics : List (Picture a)
mom_pics =
    [ { bigUrl = "images/mom/22_weeks.jpg"
      , smallUrl = "images/mom/22_weeks_small.jpg"
      , shortDesc = text "22 Weeks!"
      , longDesc = text "Just look at that bump!"
      }
    , { bigUrl = "images/mom/26_weeks.jpg"
      , smallUrl = "images/mom/26_weeks_small.jpg"
      , shortDesc = text "26 Weeks!"
      , longDesc = text "The bun's rising!"
      }
    ]


mom : Section a
mom =
    PictureGroup
        { meta =
            { id = "mom"
            , name = text "Mom's Progress"
            , title = text "Mom's Progress"
            }
        , pics = mom_pics
        }


nursery_pics : List (Picture a)
nursery_pics =
    [ { bigUrl = "images/nursery/IMG_8874.jpg"
      , smallUrl = "images/nursery/IMG_8874_small.jpg"
      , shortDesc = text "I have a bedroom!"
      , longDesc = text "Didn't mom do a great job picking it all out??"
      }
    , { bigUrl = "images/nursery/IMG_8824.jpg"
      , smallUrl = "images/nursery/IMG_8824_small.jpg"
      , shortDesc = text "With pictures!"
      , longDesc = text "I bet I'll like princesses and dragons!"
      }
    , { bigUrl = "images/nursery/IMG_8804.jpg"
      , smallUrl = "images/nursery/IMG_8804_small.jpg"
      , shortDesc = text "Here, see 'em better!"
      , longDesc = text "Aren't they dreamy?"
      }
    , { bigUrl = "images/nursery/IMG_8796.jpg"
      , smallUrl = "images/nursery/IMG_8796_small.jpg"
      , shortDesc = text "Oh! Oh! And my stuffed animals!"
      , longDesc = text "They're so snuggly!"
      }
    , { bigUrl = "images/nursery/IMG_8825.jpg"
      , smallUrl = "images/nursery/IMG_8825_small.jpg"
      , shortDesc = text "A pic of me from the future!"
      , longDesc = text "Time travel is real, y'all!"
      }
    , { bigUrl = "images/nursery/IMG_8827.jpg"
      , smallUrl = "images/nursery/IMG_8827_small.jpg"
      , shortDesc = text "Look at my pretty curtains!"
      , longDesc = text "I already have good taste.. ;)"
      }
    , { bigUrl = "images/nursery/IMG_8830.jpg"
      , smallUrl = "images/nursery/IMG_8830_small.jpg"
      , shortDesc = text "My Rocking Dragon and Kitty!"
      , longDesc = div [] [ text "I bet I can ride at ", i [] [ text "least" ], text " one of them..." ]
      }
    , { bigUrl = "images/nursery/IMG_8787.jpg"
      , smallUrl = "images/nursery/IMG_8787_small.jpg"
      , shortDesc = div [] [ text "My first ", i [] [ text "actual" ], text " bed." ]
      , longDesc = text "I start off pretty small, you know. :)"
      }
    ]


nursery : Section a
nursery =
    PictureGroup
        { meta =
            { id = "nursery"
            , name = text "Nursery"
            , title = text "Winnie's Place"
            }
        , pics = nursery_pics
        }


announcement : Section a
announcement =
    Prose
        { meta =
            { id = "shower"
            , name = text "Spoil Me!"
            , title = text """The "Spoil Me" Zone!"""
            }
        , headingClass = "spoil-me"
        , sectionClass = "bg-light"
        , shortDesc = text "You can get me stuff on the internet!"
        , longDesc =
            div []
                [ text "Mom and Dad said you can go to"
                , a [ href "https://www.target.com/gift-registry/giftgiver?registryId=fc3507522f4d4f8cacfd9a6024e9e4dd&type=BABY", target "_blank" ]
                    [ text " Target " ]
                , text "or"
                , a [ href "https://www.amazon.com/baby-reg/joellen-miller-christopher-sams-september-2020-littlerock/ZTFV0AX4J31E", target "_blank" ]
                    [ text " Amazon " ]
                , text "to see things I need, but don't feel like you have to get anything or get stuff from there. And just yell at them if you have questions. :)"
                ]
        }


model : Model a
model =
    [ ultrasound
    , mom
    , nursery
    , announcement
    ]


main : Html a
main =
    view model
