module Main exposing (..)

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Html exposing (..)


main : Html.Html a
main =
    Svg.svg [ viewBox "0 0 500 500" ] view


type alias Point =
    { x : Float
    , y : Float
    }


distance : number
distance =
    50


distance2 : number
distance2 =
    2 * distance


halfDistance : Float
halfDistance =
    distance / 2


p1 : Point
p1 =
    { x = 100.0, y = 10.0 }


p2 : Point
p2 =
    { x = p1.x + distance, y = p1.y }


p3 : Point
p3 =
    { x = p1.x - halfDistance, y = p1.y + distance }


p4 : Point
p4 =
    { x = p1.x + halfDistance, y = p2.y + distance }


p5 : Point
p5 =
    { x = p2.x + halfDistance, y = p2.y + distance }


p6 : Point
p6 =
    { x = p1.x, y = (p1.y + distance2) }


p7 : Point
p7 =
    { x = p2.x, y = (p2.y + distance2) }


p8 : Point
p8 =
    { x = p1.x + halfDistance / 2, y = p1.y + halfDistance }


renderPoint : Point -> Svg d
renderPoint p =
    Svg.circle [ cx (toString p.x), cy (toString p.y), r "3", fill "#black" ] []


renderPoints : List (Svg a)
renderPoints =
    List.map renderPoint ([ p1, p2, p3, p4, p5, p6, p7 ])


drawLine : Point -> Point -> Svg a
drawLine p1 p2 =
    Svg.line [ x1 (toString p1.x), y1 (toString p1.y), x2 (toString p2.x), y2 (toString p2.y), Svg.Attributes.style "stroke:rgb(0,0,0);stroke-width:6" ] []


drawLines : List (Svg a)
drawLines =
    [ drawLine p1 p2
    , drawLine p1 p3
    , drawLine p3 p6
    , drawLine p6 p7
    , drawLine p7 p5
    , drawLine p2 p5
    , drawLine p3 p4
    , drawLine p2 p4
    , drawLine p6 p4
    , drawLine p7 p4
    , drawLine p1 p8
    ]


view : List (Svg a)
view =
    List.append renderPoints drawLines
