"W I T N E S S :   T H E   P R E Q U E L "

"THE PROJECT"

<CONSTANT GAME-TITLE "Witness: The Prequel">
<CONSTANT GAME-DESCRIPTION
"A mystery story by Friends of ZILF">

<CONSTANT RELEASEID 1> <VERSION ZIP TIME>


"THE MECHANICS"

"Startup"

<ROUTINE GO ()
    <SET-THE-SCENE>
    <INTRODUCE-THE-GAME>
    <MAIN-LOOP>
>


"Library and Extensions"

<INSERT-FILE "parser">


"Game Specific Interaction"

"Game Specific Behaviour"

"In this game, rooms can have an FDESC. The original DESCRIBE-ROOM always prints FDESC
instead of LDESC. It's not clear how LDESC gets printed if at all."

<BIND ((REDEFINE T))

<ROUTINE DESCRIBE-ROOM (RM "OPT" LONG "AUX" P)

    <COND (<AND <==? .RM ,HERE> <NOT ,HERE-LIT>>
           <DARKNESS-F ,M-LOOK>
           <RFALSE>)>
 
    ;"Print the room's real name."
    <VERSION? (ZIP) (ELSE <HLIGHT ,H-BOLD>)>
    <TELL D .RM CR>
    <VERSION? (ZIP) (ELSE <HLIGHT ,H-NORMAL>)>

    ;"If this is an implicit LOOK, check briefness."
    <COND (<NOT .LONG>
           <COND (<EQUAL? ,MODE ,SUPERBRIEF>
                  <RFALSE>)
                 (<AND <FSET? .RM ,TOUCHBIT>
                       <NOT <EQUAL? ,MODE ,VERBOSE>>>
                  ;"Call the room's ACTION with M-FLASH even in brief mode."
                  <APPLY <GETP .RM ,P?ACTION> ,M-FLASH>
                  <RTRUE>)>)>

    ;"The room's ACTION can print a description with M-LOOK.
      Otherwise, print the LDESC if present."
    <COND (<APPLY <GETP .RM ,P?ACTION> ,M-LOOK>)
          (<SET P <GETP .RM ,P?LDESC>>
           <TELL .P CR>)>

    ;"Call the room's ACTION again with M-FLASH for important descriptions."
    <APPLY <GETP .RM ,P?ACTION> ,M-FLASH>

    ;"Mark the room visited."
    <FSET .RM ,TOUCHBIT>

    <RTRUE>

>

>


"Extra Game Verbs"

"Library Hooks"


"THE GAME"

"Setting the Scene"

<ROUTINE SET-THE-SCENE ()
    <SETG SCORE 20>
	<SETG HERE DRIVEWAY-ENTRANCE>
    <MOVE PLAYER ,HERE>
>

"Introduction"

<ROUTINE INTRODUCE-THE-GAME ()
    <TELL CR CR "This game needs an introduction ..." CR>
    <CRLF> <V-VERSION>
    <CRLF> <V-LOOK>
>

"Cast"

"Setting"

<ROOM DRIVEWAY-ENTRANCE (DESC "driveway entrance") (IN ROOMS)
    (FDESC
"You are standing at the foot of the driveway, the entrance to the
Linder property. The entire lot is screened from the street and the
neighbors by a wooden fence, except on the east
side, which fronts on dense bamboo woods. The house looks like a mixture of
a California bungalow and East Asian influences. From here you can
see the driveway leading north and, beyond that, the front door.")
    (LDESC
"This is the entrance to the driveway from the street, which lies to the
south. To the north is the driveway, and to the east is the side yard.")
    (FLAGS LIGHTBIT)
>


"Plot"
