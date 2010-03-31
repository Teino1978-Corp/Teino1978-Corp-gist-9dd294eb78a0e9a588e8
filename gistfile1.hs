tokenBase = token showTok posFromTok
            where showTok    (p, t) = show t
                  posFromTok (p, t) = p

match x = tokenBase testTok
          where testTok (p, t) = if t == x then Just t else Nothing

advance = tokenBase testTok
          where testTok (p, t) = Just t

--

data Token = NameTok    String
           | KeywordTok String
           | StringTok  String
           | NumberTok  Double
           | OperTok    String
           | DelimTok   Char deriving (Eq)

instance Show Token where
  show t = case t of
             NameTok n    -> n
             KeywordTok k -> k
             StringTok s  -> "\"" ++ s ++ "\""
             NumberTok n  -> show n
             OperTok o    -> o
             DelimTok d   -> [d]