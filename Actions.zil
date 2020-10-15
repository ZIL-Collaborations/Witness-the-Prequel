"W I T N E S S :   T H E   P R E Q U E L   -  Actions File"

"THE INTERACTION"

"This consists of a collection of actions. It is not always necessary to define
actions but there may, in principle, be as many as are required to support the
game."

"Actions are constructed in ZIL from verb routines and their associated syntax
definitions."

"Note: as at ZILF 0.9, there is no mechanism to replace syntax definitions in
the ZILF library other than by editing a copy of verbs.zil. See ZILF Issue #42"

;"Stuff to take the place of FIRE-SHOT from the original, all relating to pressing the (partially or fully) armed butler button in the office."

;"Intercept when Monica tries to press the repaired button with putty or gun installed while Linder is in the room. (if both Linder and Phong, use Linder's response only.)"
;"No action, just this text"

    <TELL "Before you can, Dad roughly catches your wrist. \"Easy! Your contraption is live, remember?\" ">

;"Intercept when Monica tries to press the repaired button with putty or gun installed while Phong (only) is in the room."
;"No action, just this text"

    <TELL "A sharp inhalation from Phong is reminder enough: that button is wired. Press it now and you scotch the setup. ">

;"Alone, repaired button pressed, putty wired, gun not installed."

	       <TELL "The window shatters, right on cue. It's impressively noisy. You calmly note that your cheek is cold and wet. A quick dab of your fingertips reveals blood seeping from scrapes caused by the flying glass.||">
           <TELL "Dad and Phong nearly collide as they race into the office. Dad's face pales ">
           <TELL "as he surveys the shattered remains of his great scheme. ">
           <TELL "\"Monica! Monica, what happened?\"||">
           <TELL "Phong gives you the briefest sideways glance, then silently withdraws. He'll clean up the mess, you reason. That's his job.||
           You feel a pulsating warmth under both eyes as you realize your mistake. All you can do is channel it into a look of pure hate, leveled at your father. This was your chance. Now ">
           <TELL "it's spread all over the rug in a thousand prickly shards. " CR CR>
           <JIGS-UP "*** You botched it, Monica ***">

;"Alone, repaired button pressed, gun installed, first aim."

            <TELL " Suddenly there is a flash of light and an explosion. ">

        ;"If the putty is installed" <TELL "The window shatters, right on cue. It's impressively noisy. You calmly note that your cheek is cold and wet. A quick dab of your fingertips reveals blood seeping from scrapes caused by the flying glass.||">

            <TELL "Dad and Phong nearly collide as they race into the office. Dad's face pales ">
            <TELL "when he spots the bullet hole in the wall. It's high and wide of the desk, just where he wanted it. Just not when he wanted it. ">
            <TELL "\"Monica! Monica, what happened?\"||">
           <TELL "Phong gives you the briefest sideways glance, then silently withdraws. He'll clean up the mess, you reason. That's his job.||
           You feel a pulsating warmth under both eyes as you realize your mistake. All you can do is channel it into a look of pure hate, leveled at your father. This was your chance. Now ">
           <TELL "it's gone. All you have to show for it is a bullet hole in Dad's paneling. Not in his heart, where it belongs.">
           <JIGS-UP "*** You botched it, Monica ***">

;"Alone, repaired button pressed, gun installed, adjusted aim."

            <TELL " Suddenly there is a flash of light and an explosion. ">

        ;"If the putty is installed" <TELL "The window shatters, right on cue. It's impressively noisy. You calmly note that your cheek is cold and wet. A quick dab of your fingertips reveals blood seeping from scrapes caused by the flying glass.||">

            <JIGS-UP "Then you don't feel much at all. The floor rushes up at you, but it looks like a movie trick. The rug is growing wet, but the blood is staining someone else's blouse. And the call you hear for \"Monica! Monica?\" from a man you've been numb to for years? It won't be answered. She's gone.||
            Your eyes close for the last time.||
            *** You have died ***">
