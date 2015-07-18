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


model = {completedPomodoros = [], currentPomodoro = newPomodoro}

updatedPomodoro : Pomodoro -> Pomodoro
updatedPomodoro p =
  {time = p.time + 1}

newPomodoro = {time = 1}

isPomodoroComplete = \p -> p.time >= 5

updatedPomodoros : Pomodoros -> Pomodoros
updatedPomodoros pomodoros =
  if isPomodoroComplete pomodoros.currentPomodoro
     then {completedPomodoros = pomodoros.completedPomodoros ++ [pomodoros.currentPomodoro],
           currentPomodoro = newPomodoro}
     else
       {completedPomodoros = pomodoros.completedPomodoros,
        currentPomodoro = updatedPomodoro pomodoros.currentPomodoro}

view pomodoros =
  div []
        [ul [] (List.map (\p -> li [] [text "a completed pomodoro!"]) pomodoros.completedPomodoros)]
        text ("pomodoros time: " ++ toString pomodoros.currentPomodoro.time)]
