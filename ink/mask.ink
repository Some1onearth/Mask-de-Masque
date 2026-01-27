LIST masks = beggar_mask, peasant_mask

VAR current_mask = beggar_mask

- (game)
You're wearing {current_mask}
+ PEASANT
-> peasant ->
+ PEASANT_MASK
~ current_mask = peasant_mask
+ BEGGAR_MASK
~ current_mask = beggar_mask
-
-> game

== peasant
{ current_mask == beggar_mask:
    Get way from me beggar!
- else:
    How's your day?
}
-
->->