module MoodSwing where
--   [1]    [2]    [2]
data Mood = Blah | Woot deriving Show
-- [1] = type constructor
-- [2] = data constructor
changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood _ = Blah
