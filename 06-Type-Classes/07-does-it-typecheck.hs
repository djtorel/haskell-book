module DoesItTypeCheck where

-- 01 Does the following type check ?

{-
data Person = Person Bool

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)
-}

-- No because Person has no instance of Show. Fix:
data Person = Person Bool
  deriving Show

printPerson :: Person -> IO ()
printPerson person = print (show person)

-------------------------------------------------------

-- 02 Does the following type check?

{-
data Mood = Blah
          | Woot deriving Show

settleDown x = if x == Woot
                  then Blah
                  else x
-}

-- No because Mood has no instance of Eq. Fix:
data Mood = Blah
          | Woot deriving (Show, Eq)

settleDown x = if x == Woot
                  then Blah
                  else x

-------------------------------------------------------

-- 04 Does the following type check?
type Subject = String
type Verb = String
type Object = String

data Sentence =
  Sentence Subject Verb Object
  deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"

-- Yes it does

-------------------------------------------------------

-- Given the following datatype definitions:
data Rocks =
  Rocks String deriving (Eq, Show)

data Yeah =
  Yeah Bool deriving (Eq, Show)

data Papu =
  Papu Rocks Yeah
  deriving (Eq, Show)

-- Which of the following will type check?
-- 1
-- phew = Papu "chases" True
-- ^--- This one does NOT type check

-- 2
truth = Papu (Rocks "chomskydoz")
             (Yeah True)
-- ^--- This one type checks

-- 3
equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'
-- ^--- This one type checks

-- 4
-- comparePapus :: Papu -> Papu -> Bool
-- comparePapus p p' = p > p'
-- ^--- This does NOT type check

-------------------------------------------------------
