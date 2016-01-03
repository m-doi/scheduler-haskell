module Handler.NewSchedule where

import Import
import Yesod.Form.Bootstrap3
import Data.Time

scheduleForm :: AForm Handler Schedule
scheduleForm = Schedule
    <$> areq dayField "Day" Nothing
    <*> areq timeFieldTypeTime "From" Nothing
    <*> areq timeFieldTypeTime "To" Nothing
    <*> areq textField (bfs ("Who?" :: Text)) Nothing
    <*> areq textField (bfs ("Where?" :: Text)) Nothing


getNewScheduleR :: Handler Html
getNewScheduleR = error "Not yet implemented: getScheduleR"


postNewScheduleR :: Handler Html
postNewScheduleR = error "Not yet implemented: postNewScheduleR"
