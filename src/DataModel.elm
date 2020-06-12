module DataModel exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias Picture a =
    { bigUrl : String
    , smallUrl : String
    , shortDesc : Html a
    , longDesc : Html a
    }


type alias Meta a =
    { id : String
    , name : Html a
    , title : Html a
    }


type Section a
    = PictureGroup
        { meta : Meta a
        , pics : List (Picture a)
        }
    | Prose
        { meta : Meta a
        , sectionClass : String
        , headingClass : String
        , shortDesc : Html a
        , longDesc : Html a
        }


type alias Model a =
    List (Section a)


navItem : Section a -> Html a
navItem sec =
    let
        ( identifier, name ) =
            case sec of
                PictureGroup group ->
                    ( group.meta.id, group.meta.name )

                Prose prose ->
                    ( prose.meta.id, prose.meta.name )
    in
    li [ class "nav-item" ]
        [ a [ class "nav-link js-scroll-trigger", href <| String.append "#" identifier ]
            [ name ]
        ]


renderNavigation : Model a -> Html a
renderNavigation picGroups =
    nav
        [ class "navbar navbar-expand-lg navbar-dark bg-dark fixed-top", id "mainNav" ]
        [ div [ class "container" ]
            [ a [ class "navbar-brand js-scroll-trigger", href "#page-top" ]
                [ text "Winnie Sams" ]
            , button [ attribute "aria-controls" "navbarResponsive", attribute "aria-expanded" "false", attribute "aria-label" "Toggle navigation", class "navbar-toggler", attribute "data-target" "#navbarResponsive", attribute "data-toggle" "collapse", type_ "button" ]
                [ span [ class "navbar-toggler-icon" ]
                    []
                ]
            , div [ class "collapse navbar-collapse", id "navbarResponsive" ]
                [ ul [ class "navbar-nav ml-auto" ]
                    (List.map
                        navItem
                        picGroups
                    )
                ]
            ]
        ]


renderBanner : Html a
renderBanner =
    header [ class "winnie-banner" ]
        [ div [ class "container text-center text-white" ]
            [ h1 []
                [ text "Gwendolyn \"Winnie\" Joyce Sams" ]
            , p [ class "lead" ]
                [ text "Coming September 12, 2020" ]
            ]
        ]


renderFooter : Html a
renderFooter =
    footer [ class "py-5 bg-dark" ]
        [ div [ class "container" ]
            [ p [ class "m-0 text-center text-white" ]
                [ text "Copyright © Christopher, Jo Ellen, and Winnie Sams 2020" ]
            ]
        ]


renderPicture : Picture a -> Html a
renderPicture pic =
    div [ class "col-md-6 col-lg-4" ]
        [ div [ class "card border-0 transform-on-hover" ]
            [ a [ class "lightbox", href pic.bigUrl ]
                [ img [ class "card-img-top", src pic.smallUrl ]
                    []
                ]
            , div [ class "card-body" ]
                [ h6 []
                    [ a [ href "#" ]
                        [ pic.shortDesc ]
                    ]
                , p [ class "text-muted card-text" ]
                    [ pic.longDesc ]
                ]
            ]
        ]


renderSection : Section a -> Html a
renderSection sec =
    case sec of
        PictureGroup group ->
            section [ class "gallery-block cards-gallery", id group.meta.id ]
                [ div [ class "container" ]
                    [ div [ class "heading" ]
                        [ h2 []
                            [ group.meta.title ]
                        ]
                    , div [ class "row" ]
                        (List.map
                            renderPicture
                            group.pics
                        )
                    ]
                ]

        Prose prose ->
            section [ class prose.sectionClass, id prose.meta.id ]
                [ div [ class "container" ]
                    [ div [ class <| String.append "heading " prose.headingClass ]
                        [ h2 []
                            [ prose.meta.title ]
                        ]
                    , div [ class "row" ]
                        [ div [ class "col-lg-8 mx-auto" ]
                            [ p [ class "lead" ]
                                [ prose.shortDesc ]
                            , p []
                                [ prose.longDesc ]
                            ]
                        ]
                    ]
                ]


renderSections : Model a -> List (Html a)
renderSections sections =
    List.map renderSection sections


view : Model a -> Html a
view model =
    div []
        (List.concat
            [ [ renderNavigation model, renderBanner ]
            , renderSections model
            , [ renderFooter ]
            ]
        )
