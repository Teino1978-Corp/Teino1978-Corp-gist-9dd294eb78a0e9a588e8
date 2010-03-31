tokenBase = token showTok posFromTok
            where showTok    (p, t) = show t
                  posFromTok (p, t) = p

match x = tokenBase testTok
          where testTok (p, t) = if t == x then Just t else Nothing

advance = tokenBase testTok
          where testTok (p, t) = Just t