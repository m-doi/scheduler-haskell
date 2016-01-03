module Handler.NewSchedule where

import Import
import Yesod.Form.Bootstrap3
import Data.Time

scheduleForm :: AForm Handler Schedule
scheduleForm = Schedule
    <$> areq dayField (bfs ("Day" :: Text)) Nothing
    <*> areq timeFieldTypeTime (bfs ("From" :: Text)) Nothing
    <*> areq timeFieldTypeTime (bfs ("To" :: Text)) Nothing
    <*> areq textField (bfs ("Who?" :: Text)) Nothing
    <*> areq textField (bfs ("Where?" :: Text)) Nothing


getNewScheduleR :: Handler Html
getNewScheduleR = do
    (widget, enctype) <- generateFormPost $ renderBootstrap3 BootstrapBasicForm scheduleForm
    defaultLayout $ do
        $(widgetFile "/schedule/posts/new")



postNewScheduleR :: Handler Html
postNewScheduleR = do
    ((res, widget), enctype) <- runFormPost $ renderBootstrap3 BootstrapBasicForm scheduleForm
    case res of
        FormSuccess schedule -> do
            runDB $ insert schedule
            defaultLayout $(widgetFile "/schedule/posts/new")
        _ -> defaultLayout $(widgetFile "/schedule/posts/new")
