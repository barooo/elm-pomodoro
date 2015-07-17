import Html exposing (..)
import Time exposing (..)
import Signal exposing (..)

main =
  view <~ foldp (\_ pomodoros -> updatedPomodoros pomodoros) model (every second)

type alias Pomodoro =
  {time: Time}

type alias Pomodoros =
  {completedPomodoros: List Pomodoro,
  currentPomodoro: Pomodoro}


model = {completedPomodoros = [], currentPomodoro = {time = 0}}

updatedPomodoro : Pomodoro -> Pomodoro
updatedPomodoro p =
  {time = p.time + 1}

updatedPomodoros : Pomodoros -> Pomodoros
updatedPomodoros pomodoros =
  {completedPomodoros = pomodoros.completedPomodoros,
  currentPomodoro = updatedPomodoro pomodoros.currentPomodoro}

view pomodoros =
  div []
    [text ("pomodoros time: " ++ toString pomodoros.currentPomodoro.time)]
